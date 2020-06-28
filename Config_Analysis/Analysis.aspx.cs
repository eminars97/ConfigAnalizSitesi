using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Analysis : System.Web.UI.Page
{
    ServiceReference.ServiceClient proxy;

    protected void Page_Load(object sender, EventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        if (Session["ParamAnalyis"] != null)
        {
            string parameter = Session["ParamAnalyis"].ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{parameter}')", true);
            var result1 = proxy.GetAnalysis().Where(x => x.parameter == parameter).ToList();

            if (result1.Count != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('Bu parametre ile ilgili {result1.Count} tane test yapılmıştır')", true);
                rptAnalysis.DataSource = result1;
                rptAnalysis.DataBind();
                Session["ParamAnalyis"] = null;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{parameter} parametre ile ilgili test yapılmamıştır')", true);

                var result = proxy.GetAnalysis();
                rptAnalysis.DataSource = result;
                rptAnalysis.DataBind();
                Session["ParamAnalyis"] = null;
            }
        }
        else if (!IsPostBack) //Sayfa ilk defa mı yüklendi yoksa yenilendi mi diye kontrol ediyor.
        {
            var result = proxy.GetAnalysis();
            rptAnalysis.DataSource = result;
            rptAnalysis.DataBind();
        }
    }



    protected void btnFilter_Click(object sender, EventArgs e)
    {

        if (TextBox1.Text != "")
        {  //TextBox'ın içi boş ise filtre yapmadan bütün ürünleri listeler
            proxy = new ServiceReference.ServiceClient();

            var result1 = proxy.GetAnalysisFilter(TextBox1.Text.ToString());
            rptAnalysis.DataSource = result1.ToList();
            rptAnalysis.DataBind();
        }
        else
        {
            var result2 = proxy.GetAnalysis();
            rptAnalysis.DataSource = result2.ToList();
            rptAnalysis.DataBind();
        }
    }
    protected void rptAnalysis_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        if (e.CommandName == "GoTestOutput")
        {
            Session["Search"] = true;

            int paramid = Convert.ToInt32(e.CommandArgument);
            string parameter = proxy.GetAnalysis().Where(x => x.id == paramid).Select(x => x.parameter).FirstOrDefault();

            Session["Parameter"] = parameter.ToString();

            Response.Redirect("TestOutput.aspx");
        }
        if (e.CommandName == "GoConfigParam")
        {
            
            int paramid = Convert.ToInt32(e.CommandArgument);
            string parameter = proxy.GetAnalysis().Where(x => x.id == paramid).Select(x => x.parameter).FirstOrDefault();

            Session["ConfigParam"] = parameter.ToString();

            Response.Redirect("Config_Parameters.aspx");
        }
        

    }
}
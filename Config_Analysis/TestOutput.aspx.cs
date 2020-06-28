using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestOutput : System.Web.UI.Page
{
    ServiceReference.ServiceClient proxy;

    protected void Page_Load(object sender, EventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        if (Session["Search"] != null && Session["Parameter"] != null)
        {
            string parameter = Session["Parameter"].ToString();
            var result1 = proxy.GetTestDataFilter(parameter).Where(x => x.parameter == parameter).OrderBy(x => x.value).ToList();

            if (result1.Count != 0)
            {
                if (Session["SearchInfo"] != null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('Bu parametre ile ilgili {result1.Count} tane test yapılmıştır')", true);
                    Session["SearchInfo"] = null;
                }
                rptTestData.DataSource = result1;
                rptTestData.DataBind();
                Session["Search"] = null;
            }
            else
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('Bu parametre ile ilgili test yapılmamıştır')", true);

                var result = proxy.GetTestData();
                rptTestData.DataSource = result;
                rptTestData.DataBind();
                Session["Search"] = null;
            }



        }
        else
        {
            if (!IsPostBack)
            {
                var result = proxy.GetTestData();
                rptTestData.DataSource = result;
                rptTestData.DataBind();
            }


        }

    }
    protected void rptTestData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        if (e.CommandName == "GoConfigFile")
        {
            Session["Search"] = true;
            Session["OpenConfig"] = true;
            string config_files = e.CommandArgument.ToString();

            Session["Config_Files"] = config_files.ToString();
            Response.Redirect("Default.aspx");

        }
        if (e.CommandName == "GoAnalysis")
        {
            string anaylsis_param = e.CommandArgument.ToString();

            Session["ParamAnalyis"] = anaylsis_param.ToString();
            Response.Redirect("Analysis.aspx");

        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {  //TextBox'ın içi boş ise filtre yapmadan bütün ürünleri listeler
            proxy = new ServiceReference.ServiceClient();

            var result1 = proxy.GetTestDataFilter(TextBox1.Text.ToString());
            rptTestData.DataSource = result1;
            rptTestData.DataBind();
            Session["Search"] = null;
            Session["Parameter"] = null;
        }
        else
        {
            var result2 = proxy.GetTestData();
            rptTestData.DataSource = result2;
            rptTestData.DataBind();
        }
    }

}
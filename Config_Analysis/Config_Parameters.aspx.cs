using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Config_Parameters : System.Web.UI.Page
{
    ServiceReference.ServiceClient proxy;

    protected void Page_Load(object sender, EventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        if (Session["ConfigParam"] != null)
        {
            string param = Session["ConfigParam"].ToString();
            var result = proxy.GetConfigParameter().Where(x => x.parameter == param).ToList();

            rptConfigParam.DataSource = result;
            rptConfigParam.DataBind();

            Session["ConfigParam"] = null;
        }
        else
        {
            if (!IsPostBack) //Sayfa ilk defa mı yüklendi yoksa yenilendi mi diye kontrol ediyor.
            {
                var result = proxy.GetConfigParameter();
                rptConfigParam.DataSource = result;
                rptConfigParam.DataBind();
                lblCount.Text = "Parametre Sayısı : "+result.Count().ToString();

            }
        }

    }



    protected void btnFilter_Click(object sender, EventArgs e)
    {

        if (TextBox1.Text != "")
        {  //TextBox'ın içi boş ise filtre yapmadan bütün ürünleri listeler
            proxy = new ServiceReference.ServiceClient();

            var result1 = proxy.GetConfigParameterFilter(TextBox1.Text.ToString());
            rptConfigParam.DataSource = result1.ToList();
            rptConfigParam.DataBind();
            lblCount.Text = "Parametre Sayısı : " + result1.Count().ToString();

        }
        else
        {
            var result2 = proxy.GetConfigParameter();
            rptConfigParam.DataSource = result2.ToList();
            rptConfigParam.DataBind();
            lblCount.Text = "Parametre Sayısı : " + result2.Count().ToString();

        }
    }


    protected void rptConfigParam_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        if (e.CommandName == "GoTestOutput")
        {
            Session["Search"] = true;
            Session["SearchInfo"] = true;

            int paramid = Convert.ToInt32(e.CommandArgument);
            string parameter = proxy.GetConfigParameter().Where(x => x.id == paramid).Select(x => x.parameter).FirstOrDefault();

            Session["Parameter"] = parameter.ToString();

            var result1 = proxy.GetTestDataFilter(parameter).Where(x => x.parameter == parameter).OrderBy(x => x.value).ToList();

            if (result1.Count != 0)
            {
                Response.Redirect("TestOutput.aspx");

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('Bu parametre ile ilgili test yapılmamıştır')", true);


            }

        }

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        string query = DropDownList1.SelectedValue.ToString();
        if (query != "")
        {

            var result3 = proxy.GetConfigParametersFilterasTag(query);
            rptConfigParam.DataSource = result3;
            rptConfigParam.DataBind();
            lblCount.Text = "Parametre Sayısı : " + result3.Count().ToString();


        }
    }
}
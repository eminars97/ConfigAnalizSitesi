using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestBootstrap : System.Web.UI.Page
{
    ServiceReference.ServiceClient proxy;

    protected void Page_Load(object sender, EventArgs e)
    {
        proxy = new ServiceReference.ServiceClient();

        var result = proxy.GetTestData();
        rptTestData.DataSource = result;
        rptTestData.DataBind();
    }
    protected void rptTestData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string ss = TextBox1.Text.ToString();
        if (ss != "")
        {  //TextBox'ın içi boş ise filtre yapmadan bütün ürünleri listeler
            proxy = new ServiceReference.ServiceClient();

            var result1 = proxy.GetTestDataFilter(ss.ToString());
            rptTestData.DataSource = result1;
            rptTestData.DataBind();
        }
        else
        {
            var result2 = proxy.GetTestData();
            rptTestData.DataSource = result2;
            rptTestData.DataBind();
        }
    }
}
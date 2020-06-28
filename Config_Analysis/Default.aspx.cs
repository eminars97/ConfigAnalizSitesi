using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Config_Files"] == null)
        {
            Response.Redirect("TestOutpu.aspx");
        }
        string c_files = Session["Config_Files"].ToString();

        StreamReader sr = File.OpenText(Server.MapPath("ConfigInput/"+c_files));
        string strContents = sr.ReadToEnd();
        ////To display normal raw contents
        //Response.Write(strContents);

        //To handle Carriage returns
        strContents = strContents.Replace("\n", "<br>");
        strContents = strContents.Replace(" ", "&nbsp&nbsp");
        strContents = strContents.Replace("\t", "&ensp");
        Response.Write(strContents);

        sr.Close();


    }
}
﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Configuration;
using System.Data.SqlClient;


public partial class MasterPage : System.Web.UI.MasterPage
{

    //    //SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ketnoi"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("~/Home.aspx");
    }
    public void btn_logout(object sender, EventArgs e)
    {
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Collage_Grevance
{
    public partial class Sloved_Complient_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                    {
                        lblUserName.Text = "Hi" + " " + Session["Name"].ToString();
                        con.Open();
                        SqlCommand cmdobj = new SqlCommand("View_Solved_Complients", con);
                        SqlDataAdapter da = new SqlDataAdapter(cmdobj);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
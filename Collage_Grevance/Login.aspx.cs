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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_GetLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", txtUname.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPwd.Text);
                SqlDataReader dr=cmd.ExecuteReader();
                
                if (dr.Read())
                {
                    while (dr.HasRows)
                    {
                        string roll = dr["RollName"].ToString();
                        Session["Name"] = dr["Username"].ToString();
                        if (roll == "Admin")
                        {
                            Session["Roll"] = roll;
                            Response.Redirect("AdminPage.aspx");
                        }
                        else if (roll == "Student")
                        {
                            Response.Redirect("StudentLounge.aspx");
                        }
                        else if(roll== "Head of Department")
                        {
                            Response.Redirect("HOD_Lounge.aspx");
                        }
                    }
                   
                }



            }
            catch(SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
           
        }
    }
}
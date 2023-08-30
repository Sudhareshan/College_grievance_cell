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
    public partial class Remove_Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = "Hi" + " " + Session["Name"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_GetRolls", con);
              
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                da.Fill(dt);
                DropRolls.DataSource = dt;
                DropRolls.DataTextField = "RollName";
                DropRolls.DataValueField = "Rollid";
                DropRolls.DataBind();
                DropRolls.Items.Insert(0, "--Select--");
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                if (DropRolls.SelectedItem.Text == "Student")
                {
                    //string ss = "SP_DeleteDept";
                    SqlCommand cmd = new SqlCommand("Remove_Both_User_Person", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", txtid.Text);
                    int DelStu = cmd.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("Remove_Both_User_Employe", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", txtid.Text);
                    int DelDept = cmd.ExecuteNonQuery();
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
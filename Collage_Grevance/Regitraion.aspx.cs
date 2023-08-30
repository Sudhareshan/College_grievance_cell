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
    public partial class Regitraion : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_GetRolls", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dropRoll.DataSource = dt;
                dropRoll.DataTextField = "RollName";
                dropRoll.DataValueField = "Rollid";
                dropRoll.DataBind();
                dropRoll.Items.Insert(0, "--Select--");
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Rege_Logon_Grevience", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Uname", txtDname.Text);
                cmd.Parameters.AddWithValue("@Password", txtUserName.Text);
                cmd.Parameters.AddWithValue("@email", txtPwd.Text);
                cmd.Parameters.AddWithValue("@phone",long.Parse( txtMobile.Text));
                cmd.Parameters.AddWithValue("@Roll", dropRoll.SelectedItem.Text);
                if (dropRoll.SelectedItem.Text == "Student")
                {
                    cmd.Parameters.AddWithValue("@stuid",int.Parse( txtUserid.Text));
                    cmd.Parameters.AddWithValue("@dept", null);
                }

                else
                {
                    cmd.Parameters.AddWithValue("@dept", txtUserid.Text);
                    cmd.Parameters.AddWithValue("@stuid", null);
                }

                cmd.Parameters.AddWithValue("@personName", txtName.Text);
                int register = cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
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
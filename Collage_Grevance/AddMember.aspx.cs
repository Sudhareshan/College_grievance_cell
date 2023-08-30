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
    public partial class AddMember : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        public  void GetDept_Roll(string spName, string TextField, string valuefiled)
        {
            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand(spName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                da.Fill(dt);
                if(TextField== "RollName")
                {
                    dropRoll.DataSource = dt;
                    dropRoll.DataTextField = TextField;
                    dropRoll.DataValueField = valuefiled; 
                    dropRoll.DataBind();
                    dropRoll.Items.Insert(0, "--Select--");
                }
                else
                {
                    dropDept.DataSource = dt;
                    dropDept.DataTextField = TextField;
                    dropDept.DataValueField = valuefiled;                 
                    dropDept.DataBind();
                    dropDept.Items.Insert(0, "--Select--");
                }

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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDept_Roll("sp_GetRolls", "RollName", "Rollid");
                GetDept_Roll("sp_Dept", "DepartmentName", "Did");
                lblUserName.Text = "Hi" + " " + Session["Name"].ToString();

            }

        }
        public void Insertdate(string sp_name)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sp_name, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", txtid.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@rollid", dropRoll.SelectedValue);
                cmd.Parameters.AddWithValue("@did", dropDept.SelectedValue);
                int result = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
           

            
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (dropRoll.SelectedItem.Text == "Student")
                {
                    Insertdate("SP_InsertDetaills");
                    Response.Write("record inserted");
                    con.Close();
                }
                else
                {
                    Insertdate("SP_InsertDepartment");
                    Response.Write("record insertd");
                }
               

            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
       
        
    }
}
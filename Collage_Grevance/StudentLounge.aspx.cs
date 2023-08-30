using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;

namespace Collage_Grevance
{
    public partial class StudentLounge : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblGreatings.Text = "Hii   " + Session["Name"];
                try
                {
                    //GetDept_Roll("sp_Dept", "DepartmentName", "Did");
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_Dept", con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DropDepts.DataSource = dt;
                    DropDepts.DataTextField = "DepartmentName";
                    DropDepts.DataValueField = "Did";
                   
                    DropDepts.DataBind();
                    DropDepts.Items.Insert(0, "--Select--");

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

        protected void btnShow_Click(object sender, EventArgs e)
        {
            txtComplaint.Visible = true;
            btnSaveComplanit.Visible = true;
            lblcomplient.Visible = true;
            lblComplinetOn.Visible = true;
            DropDepts.Visible = true;
            GridView1.Visible = false;
            txtCid.Visible = false;
            lblcid.Visible = false;
        }

        protected void btnSaveComplanit_Click(object sender, EventArgs e)
        {
            try
            {
                
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Sp_Complient", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Complient", txtComplaint.InnerText);
                    cmd.Parameters.AddWithValue("@did", DropDepts.SelectedValue);
                    int rise_Compliaint = cmd.ExecuteNonQuery();
                    if (rise_Compliaint == 1)
                    {
                        txtComplaint.Visible = false;
                        btnSaveComplanit.Visible = false;
                        lblComplinetOn.Visible = false;
                        DropDepts.Visible = false;
                        SqlCommand getid = new SqlCommand("GetComplientId", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        int CompliantId = (int)getid.ExecuteScalar();

                        lblcomplient.Text = "Note : Your Compliant Id is :" + CompliantId.ToString();
                        lblcomplient.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            catch
            {
                lblGreatings.Text = "Oops...!";
            }
           
        }

        protected void BtnSeachComp_Click(object sender, EventArgs e)
        {
            txtCid.Visible = true;
            lblcid.Visible = true;
            lblComplinetOn.Visible = false;
            DropDepts.Visible = false;
            txtComplaint.Visible = false;
            btnSaveComplanit.Visible = false;

        }

        protected void txtCid_TextChanged(object sender, EventArgs e)
        {
            try
            {
                GridView1.Visible = true;
                con.Open();
                SqlCommand SeacrhComp = new SqlCommand("Sp_SerchComp", con);
                SeacrhComp.CommandType = CommandType.StoredProcedure;
                SeacrhComp.Parameters.AddWithValue("@id", txtCid.Text);
                SqlDataAdapter da = new SqlDataAdapter(SeacrhComp);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                lblcid.Visible = false;
                txtCid.Visible = false;
            }catch
            {
                lblcid.Text = "Some Thing Went Wrong....!";
                txtCid.Visible = false;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
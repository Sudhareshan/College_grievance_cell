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
    public partial class Make_Solve_By_Admin : System.Web.UI.Page
    {
        public void Filldata()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
            {
                con.Open();
                SqlCommand cmdobj = new SqlCommand("View_Pending_Comp", con);
                cmdobj.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmdobj);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridSolve.DataSource = dt;
                GridSolve.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = "Hi" + " " + Session["Name"].ToString();
                Filldata();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "IsSolved")
                {
                    int indexVal = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridSolve.Rows[indexVal];
                    Label id = (Label)row.FindControl("Label1");


                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Complient_Sloved", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", id.Text);
                        /*int sloved =*/ cmd.ExecuteNonQuery();
                        //if (sloved == 1)
                        //{
                            Filldata();
                       // }
                    }
                }
            }
            catch(SqlException ex)
            {
                Response.Write(ex.Message);
            }
           
        }
           
    }
}
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
    public partial class HOD_Lounge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lblUserName.Text = "Hi" + " " + Session["Name"].ToString();

            }
        }

        protected void BtnViewAllComp_Click(object sender, EventArgs e)
        {
            GridAllComp.Visible = true;
            GridAllComp0.Visible = false;
            try
            {
               // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                {
                    con.Open();
                    SqlCommand cmdobj = new SqlCommand("View_All_Complients", con);
                    cmdobj.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmdobj);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridAllComp.DataSource = dt;
                    GridAllComp.DataBind();
                }
            }
            catch(SqlException ex)
            {
                Response.Write(ex.Message);
            }
            
        }
        public void View_Pending_Comp()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
            {
                con.Open();
                SqlCommand cmdobj = new SqlCommand("View_Pending_Comp", con);
                cmdobj.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmdobj);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridAllComp0.DataSource = dt;
                GridAllComp0.DataBind();
            }
        }
        protected void btnPendingCom_Click(object sender, EventArgs e)
        {
            GridAllComp.Visible = false;
            GridAllComp0.Visible = true;

            View_Pending_Comp();

        }

        protected void GridAllComp0_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CmdUpdate")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                //Reference the GridView Row.
                GridViewRow row = GridAllComp0.Rows[rowIndex];
                Label id = (Label)row.FindControl("Lblcomid");
                //Fetch value of Name.
                //string name = (row.FindControl("ComId") as TextBox).Text;
                //string id = row.Cells[0].Text;

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Complient_Sloved",con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id.Text);
                    int sloved= cmd.ExecuteNonQuery();
                    if (sloved == 1)
                    {
                        View_Pending_Comp();
                    }
                }

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BreweryBucketList;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace BreweryBucketList
{
    public partial class Breweries : System.Web.UI.Page
    {
        BBListDbContext context = new BBListDbContext();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BreweryBucketListConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (!Page.IsPostBack) { dlBreweries.DataBind();  }
            
            //using (var entity = new BBListDbContext())
            //{
            //    var first = (from x in context.Breweries
            //                 select new { x.BreweryID, x.BreweryName }).ToList();
            //    grdCounties.DataSource = first;
            //    grdCounties.DataBind();
            //}
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string find = "select BreweryName as 'Name', Address, City from Brewery where(BreweryName like '%' + @BreweryName + '%')";
            SqlCommand comm = new SqlCommand(find, con);
            comm.Parameters.Add("@BreweryName", SqlDbType.NVarChar).Value = txtBrewerySearch.Text;

            con.Open();
            comm.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = comm;
            DataSet ds = new DataSet();
            da.Fill(ds, "BreweryName");
            grvSearch.DataSource = ds;
            grvSearch.DataBind();
            con.Close();
        }

        protected void btnAddtoList_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] { new DataColumn("Visit"), new DataColumn("BreweryName"), new DataColumn("City"), new DataColumn("Website") });
            
            foreach (GridViewRow row in grvBreweries.Rows)
            {
                if(row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkVisited") as CheckBox);
                    if(chkRow.Checked)
                    {
                        string BreweryName = row.Cells[1].Text;
                        string City = row.Cells[2].Text;
                        string Website = row.Cells[3].Text;
                        dt.Rows.Add(BreweryName, City, Website);
                    }
                }
            }

            grvSelected.DataSource = dt;
            grvSelected.DataBind();
        }

     


        //private void GetMultipleSelections(ListControl listControl)
        //{
        //    foreach (ListItem li in cblBrewerySelection.Items)
        //    {
        //        if (li.Selected)
        //        {
        //           // txtResults.Text += ("Brewery Name: " + li.Text + Environment.NewLine);
        //        }
        //    }
        //}


    }
}   
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BreweryBucketList.Admin
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void grvBreweries_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvr = grvBreweries.SelectedRow;

            txtBreweryName.Text = gvr.Cells[1].Text;
            txtAddress.Text = gvr.Cells[2].Text;
            txtCity.Text = gvr.Cells[3].Text;
            txtState.Text = gvr.Cells[4].Text;
            txtZip.Text = gvr.Cells[5].Text;
            ddlCounties.SelectedValue = gvr.Cells[6].Text;
            txtWebsite.Text = gvr.Cells[7].Text; 
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtBreweryName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZip.Text = "";
            ddlCounties.ClearSelection();
            txtWebsite.Text = ""; 
        }


    }
}
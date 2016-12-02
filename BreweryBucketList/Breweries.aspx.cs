using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BreweryBucketList;
using System.Data.Entity;

namespace BreweryBucketList
{
    public partial class Breweries : System.Web.UI.Page
    {
        BBListDbContext context = new BBListDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { dlBreweries.DataBind();  }
            
            //using (var entity = new BBListDbContext())
            //{
            //    var first = (from x in context.Breweries
            //                 select new { x.BreweryID, x.BreweryName }).ToList();
            //    grdCounties.DataSource = first;
            //    grdCounties.DataBind();
            //}
        }      


        private void GetMultipleSelections(ListControl listControl)
        {
            foreach (ListItem li in cblBrewerySelection.Items)
            {
                if (li.Selected)
                {
                    Response.Write("Text = " + li.Text + ", Value = " + li.Value +
                        ", Index = " + listControl.Items.IndexOf(li).ToString() + "<br/>");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GetMultipleSelections(cblBrewerySelection);
        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            GetMultipleSelections(cblBrewerySelection);
        }
        
    }
}
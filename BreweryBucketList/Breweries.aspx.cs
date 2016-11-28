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
            //using (var entity = new BBListDbContext())
            //{
            //    var first = (from x in context.Breweries
            //                 select new { x.BreweryID, x.BreweryName }).ToList();
            //    grdCounties.DataSource = first;
            //    grdCounties.DataBind();
            //}
        }

    
    }
}
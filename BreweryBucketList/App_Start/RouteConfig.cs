using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace BreweryBucketList
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);


//            BreweryBucketListModel.RegisterContext(
//                new Microsoft.AspNet.DynamicData.ModelProviders.EFDataModelProvider(() => new BBListDbContext()),
//newContextConfiguration { ScaffoldAllTables = true });  
        }
    }
}

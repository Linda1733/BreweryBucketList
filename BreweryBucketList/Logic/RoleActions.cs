using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BreweryBucketList.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace BreweryBucketList.Logic
{
    internal class RoleActions
    {
        // method stub created from Global asax file
        internal void createAdmin()
        {
            // Access the application context and create result variables
            Models.ApplicationDbContext context = new Models.ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the applicationdbcontext object 
            // the rolestore is only allowed to contain identity role objects
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a role manager object that is only allowed to contain IdentityRole objects
            // when creating the role manager object you pass in a parameter - a new rolestore object 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // create the Admin role if it doesn't already exists 
            if (!roleMgr.RoleExists("Administrator"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole("Administrator"));
                if(!IdRoleResult.Succeeded)
                {
                    // handle the error if problem creating Role Manager object 
                }
            }

            // create a user manager object based on teh user store object and the applicationdbcontext object 

            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser()
            {
                UserName = "Admin",
            };

            IdUserResult = userMgr.Create(appUser, "Pa$$word");
            
            // If the new "admin" user was successfully created - add the Admin user to the "Administrator" role
            if(IdUserResult.Succeeded)
            {
                IdUserResult = userMgr.AddToRole(appUser.Id, "Administrator");
                if(!IdUserResult.Succeeded)
                {
                    // handle the error of adding the user to the role
                }
                else
                {
                    // handle the error of creating a new user 
                }
            }
        }
    }
}
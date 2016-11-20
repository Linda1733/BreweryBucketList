using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BreweryBucketList.Startup))]
namespace BreweryBucketList
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

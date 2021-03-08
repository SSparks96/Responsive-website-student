using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(pantry_app.Startup))]
namespace pantry_app
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

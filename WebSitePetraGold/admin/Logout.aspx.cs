using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSitePetraGold.Models;

namespace WebSitePetraGold.admin
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Sair()
        {
            try
            {
                string json = "";
                InfoJSon info = null;

                HttpContext.Current.Session["Usuario"] = null;

                info = new InfoJSon();
                info.Info = "ResultOk";
                info.Data = "";
                info.Message = "";

                json = JsonConvert.SerializeObject(info);

                return json;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
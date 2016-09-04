using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSitePetraGold.Models;


namespace WebSitePetraGold.Views
{
    public partial class Logar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod]
        public static string Login(string usuario, string senha)
        {

            string json = "";
            InfoJSon info = null;

            AuthenticateEventArgs evento = new AuthenticateEventArgs();

            try
            {
                if (info == null)
                {

                    if (usuario.Equals("fred") & senha.Equals("fred")) //se usuario não é nulo
                    {
                        HttpContext.Current.Session.Add("usuario", usuario);
                        //gravando o objeto Usuario em sessão
                        evento.Authenticated = true;

                        info = new InfoJSon();
                        info.Info = "ResultOk";
                        info.Data = "";
                        info.Message = "Logado no sistema com sucesso!";

                    }
                    else
                    {
                        HttpContext.Current.Session["usuario"] = null;
                        evento.Authenticated = false;

                        info = new InfoJSon();
                        info.Info = "Error";
                        info.Data = "";
                        info.Message = "Usuário ou senha não são válidos, por favor tente novamente!";
                    }
                }

                json = JsonConvert.SerializeObject(info);

                return json;

            }
            catch (Exception e)
            {
                info = new InfoJSon();
                info.Info = "Error";
                info.Data = "";
                info.Message = e.Message;

                json = JsonConvert.SerializeObject(info);

                return json;
            }

        }

    }
}
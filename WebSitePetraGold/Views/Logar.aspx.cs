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
        public static string login(string usuario, string senha)
        {

            string json = "";
            InfoJSon info = null;

            AuthenticateEventArgs evento = new AuthenticateEventArgs();

            try
            {
                //if (usuario == null)
                //{
                //    info = new InfoJSon();
                //    info.Info = "Error";
                //    info.Data = "";
                //    info.Message = "Usuário de sessão não está conectado!";
                //}

                if (info == null)
                {

                    //if (usuario.Equals("") & senha.Equals("")) //se usuario não é nulo
                    //{
                    HttpContext.Current.Session.Add("usuario", usuario);
                    //gravando o objeto Usuario em sessão
                    evento.Authenticated = true;
                    //}
                    //else
                    //{
                    // evento.Authenticated = false;
                    //}


                    info = new InfoJSon();
                    info.Info = "ResultOk";
                    info.Data = "";
                    info.Message = "Logado no sistema com sucesso!";

                    //HttpContext.Current.Response.Redirect("~/admin/PainelPrincipal.aspx", false);
                    //HttpContext.Current.ApplicationInstance.CompleteRequest();

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

        [WebMethod]
        public static string sair(AuthenticateEventArgs evento)
        {
            try
            {
                string json = "";

                evento.Authenticated = false;
                HttpContext.Current.Session["Usuario"] = null;

                return json;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

    }
}
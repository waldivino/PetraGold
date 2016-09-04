using ModelPetraGold.Model;
using Newtonsoft.Json;
using PetraGoldComum.BLL;
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
            try
            {
                if (info == null)
                {
                    BLLLogin bll = new BLLLogin();
                    InfoUsuarios infoUsuario = null;

                    infoUsuario = bll.BDEfetuarLogin(usuario, senha);

                    if (!Equals(infoUsuario, null)) //se usuario não é nulo
                    {
                        if (infoUsuario.usuario.Equals(usuario) & infoUsuario.senha.Equals(senha))
                        {
                            HttpContext.Current.Session["usuario"] = usuario;
                            info = new InfoJSon();
                            info.Info = "ResultOk";
                            info.Data = "";
                            info.Message = "Logado no sistema com sucesso!";
                        }
                    }
                    else if (Equals(infoUsuario, null))
                    {
                        HttpContext.Current.Session["usuario"] = null;
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
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
    public partial class FaleConosco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        [WebMethod]
        public static string EnviarContato(string Nome, string Telefone, string Email, string AreaDeinteresse, string Mensagem)
        {
            string json = null;
            InfoJSon info = null; ;

            try
            {
                ContatoModel contato = new ContatoModel();

                contato.Nome = Nome;
                contato.Telefone = Telefone;
                contato.Email = Email;
                contato.AreaDeinteresse = AreaDeinteresse;
                contato.Mensagem = Mensagem;




                info = new InfoJSon();
                info.Info = "ResultOk";
                info.Data = "";
                info.Message = JsonConvert.SerializeObject(contato); ;

                json = JsonConvert.SerializeObject(info);

                return json;

            }
            catch(Exception e)
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
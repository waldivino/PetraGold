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
    public partial class FaleConosco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        [WebMethod]
        public static string EnviarContato(string Nome, string Telefone, string Email, string AreaDeinteresse, string Mensagem)
        {
            string json = null;
            InfoJSon info = null;
            bool status = false;

            try
            {
                BLLEnviarContato bll = new BLLEnviarContato();
                InfoContato contato = new InfoContato();

                contato.Nome = Nome;
                contato.Telefone = Telefone;
                contato.Email = Email;
                contato.AreaDeinteresse = AreaDeinteresse;
                contato.Mensagem = Mensagem;

                status = bll.abstractEnviarContato(contato);

                if(status == true)
                {
                    info = new InfoJSon();
                    info.Info = "ResultOk";
                    info.Data = "";
                    info.Message = JsonConvert.SerializeObject(contato);
                }else
                {
                    info = new InfoJSon();
                    info.Info = "Error";
                    info.Data = "";
                    info.Message = "Não foi possível enviar o contato, por favor tente mais tarde ou se preferir entre em contato no número: Tel: +55 21 3179-0651 !";
                }
                

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
using PetraGoldComum.BLLAbstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelPetraGold.Model;
using DataAccess.DAL;
using SendEmailPetraGold.Control;

namespace PetraGoldComum.BLL
{
    public class BLLEnviarContato : BLLAbstractFaleConosco
    {
        public override bool abstractEnviarContato(InfoContato info)
        {
            bool status = false;
            DALEnviarContato dal = new DALEnviarContato();

            status = dal.BDEnviarContato(info);

            //Envio de email
            InfoEmail infoEmail = new InfoEmail();
            infoEmail.destinatario = "wfredericomp@gmail.com";
            infoEmail.mensagem = "Senhor: "+ info.Nome + " <h2>Email enviado do site Petra Gold !</h2>";

            abstractEnviarEmail(infoEmail);

            return status;
        }

        public override bool abstractEnviarEmail(InfoEmail info)
        {
            try
            {
                bool status = false;
                SendEmail email = new SendEmail();

                status = email.enviarEmail(info);

                return status;
            }
            catch
            {
                throw;
            }
            
        }
    }
}

using ModelPetraGold.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace SendEmailPetraGold.Control
{
    public class SendEmail
    {

        public bool enviarEmail(InfoEmail info)
        {
            bool status = false;
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.live.com";
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("fredericofalcom@hotmail.com", "100988");
            MailMessage mail = new MailMessage();
            mail.Sender = new System.Net.Mail.MailAddress("wfredericomp@gmail.com", "Petra Gold - Câmbio e Investimentos.");
            mail.From = new MailAddress(info.destinatario, "Petra Gold - Câmbio e Investimentos.");
            mail.To.Add(new MailAddress(info.destinatario, "RECEBEDOR"));
            mail.Subject = "Contato Petra Gold - Câmbio e Investimentos.";
            mail.Body = info.mensagem;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            try
            {
                client.Send(mail);
                status = true;

                return status;
            }
            catch (Exception erro)
            {
                throw erro;
            }
            finally
            {
                mail = null;
            }
        }
    }
}

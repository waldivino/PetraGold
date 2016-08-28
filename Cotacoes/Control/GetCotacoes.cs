using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Cotacoes.Control
{
    public class GetCotacoes
    {
        public string AtualizarCotacoes()
        {
            string json_data = "";
            using (var w = new WebClient())
            {
                try
                {
                    IWebProxy defaultWebProxy = WebRequest.DefaultWebProxy;
                    defaultWebProxy.Credentials = CredentialCache.DefaultCredentials;
                    w.Proxy = defaultWebProxy;
                    json_data = w.DownloadString("http://economia.uol.com.br/cotacoes/");


        }
                catch (Exception ex)
                {
                    throw new Exception("", ex);
                }
            }
            return json_data;
        }
    }
}

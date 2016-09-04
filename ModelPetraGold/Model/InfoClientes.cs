using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelPetraGold.Model
{
    public class InfoClientes
    {
        public string idClientes { get; set; }
        public string nome { get; set; }
        public string endereco { get; set; }
        public string telefoneFixo { get; set; }
        public string celular { get; set; }
        public string cpf { get; set; }
        public string identidade { get; set; }
        public string nacionalidade { get; set; }
        public string naturalidade { get; set; }
        public DateTime dataNascimento { get; set; }
        public string email { get; set; }
    }
}

using ModelPetraGold.Model;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public class DALEnviarContato
    {
        INFOFabrica fabrica = MySqlFactory.objetoConexao();

        public bool BDEnviarContato(InfoContato info)
        {
            try
            {
                bool status = false;
                //DbDataReader dataReader = null;

                string sql = "insert into faleConosco(Nome, Telefone, Email, AreaDeinteresse, Mensagem) values('" + info.Nome + "', " +
                    "'" + info.Telefone + "', '" + info.Email + "','" + info.AreaDeinteresse + "','" + info.Mensagem + "')";

                fabrica.fncExecutarSQL(fabrica, sql);
                status = true;

                return status;
            }
            catch
            {
                throw;
            }
            finally
            {
                fabrica.Conexao.Close();
            }

        }
        
    }
}

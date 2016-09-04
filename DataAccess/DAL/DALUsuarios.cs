using ModelPetraGold.Model;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public class DALUsuarios
    {
        INFOFabrica fabrica = MySqlFactory.objetoConexao();

        public InfoUsuarios BDEfetuarLogin(string usuario, string senha)
        {
            try
            {
                InfoUsuarios info = null;
                DbDataReader dataReader = null;

                string sql = "select nome, usuario, senha, status, dataCadastro from Usuarios "
                   + " where usuario = '" + usuario + "' and senha = '" + senha + "'";

                dataReader = fabrica.SqlExeConsultaPassandoQuery(fabrica, sql);

                if (dataReader.Read())
                {
                    info = new InfoUsuarios();
                    info.nome = Convert.ToString(dataReader["nome"]);
                    info.usuario = Convert.ToString(dataReader["usuario"]);
                    info.senha = Convert.ToString(dataReader["senha"]);
                    info.status = Convert.ToString(dataReader["status"]);
                }

                return info;
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

        public bool BDCadastrarUsuarios(InfoUsuarios info)
        {
            try
            {
                bool status = false;
                //DbDataReader dataReader = null;

                string sql = "insert into usuarios(nome, usuario, senha, status, dataCadastro) values('" + info.nome + "', '" + info.usuario + "', '" + info.senha + "', '" + info.status + "', sysdate())";

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

        public List<InfoUsuarios> BDListarUsuarios()
        {
            try
            {
                List<InfoUsuarios> lista = null;
                DbDataReader dataReader = null;

                string sql = "select nome, usuario, senha, status, dataCadastro from Usuarios";

                dataReader = fabrica.SqlExeConsultaPassandoQuery(fabrica, sql);

                lista = populaLista(dataReader);

                return lista;
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

        private List<InfoUsuarios> populaLista(DbDataReader dataReader)
        {
            try
            {
                InfoUsuarios info = null;
                List<InfoUsuarios> lista = new List<InfoUsuarios>();

                while (dataReader.Read())
                {
                    info = new InfoUsuarios();
                    info.id = Convert.ToString(dataReader.GetInt32(0));
                    info.nome = Convert.ToString(dataReader.GetInt32(1));
                    info.usuario = Convert.ToString(dataReader.GetInt32(2));
                    info.senha = Convert.ToString(dataReader.GetInt32(3));
                    info.status = Convert.ToString(dataReader.GetInt32(4));

                    lista.Add(info);
                }

                return lista;
            }
            catch
            {
                throw;
            }
        }

    }
}

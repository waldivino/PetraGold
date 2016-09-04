using DataAccess.DAL;
using ModelPetraGold.Model;
using PetraGoldComum.BLLAbstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetraGoldComum.BLL
{
    public class BLLLogin : BLLAsbtractUsuarios
    {
        public override InfoUsuarios BDEfetuarLogin(string usuario, string senha)
        {
            InfoUsuarios info = null;
            DALUsuarios dal = new DALUsuarios();

            info = dal.BDEfetuarLogin(usuario, senha);

            return info;
        }
    }
}

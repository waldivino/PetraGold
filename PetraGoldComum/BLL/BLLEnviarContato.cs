using PetraGoldComum.BLLAbstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelPetraGold.Model;
using DataAccess.DAL;

namespace PetraGoldComum.BLL
{
    public class BLLEnviarContato : BLLAbstractFaleConosco
    {
        public override bool abstractEnviarContato(InfoContato info)
        {
            bool status = false;
            DALEnviarContato dal = new DALEnviarContato();

            status = dal.BDEnviarContato(info);

            return status;
        }
    }
}

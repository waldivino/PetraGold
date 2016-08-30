using ModelPetraGold.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetraGoldComum.BLLAbstract
{
    public abstract class BLLAbstractFaleConosco
    {
        public abstract bool abstractEnviarContato(InfoContato info);
        public abstract bool abstractEnviarEmail(InfoEmail info);
    }
}

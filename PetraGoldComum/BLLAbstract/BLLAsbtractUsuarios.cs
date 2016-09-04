using ModelPetraGold.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetraGoldComum.BLLAbstract
{
    public abstract class BLLAsbtractUsuarios
    {
        public abstract InfoUsuarios BDEfetuarLogin(string usuario, string senha);
    }
}

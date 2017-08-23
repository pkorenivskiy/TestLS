using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mvc.Domain
{
    public interface IUserRepository
    {
        bool Validate(string name, string password);
    }
}

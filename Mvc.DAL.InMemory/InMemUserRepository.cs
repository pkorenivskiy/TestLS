using Mvc.Domain;

namespace Mvc.DAL.InMemory
{
    public class InMemUserRepository : IUserRepository
    {
        public bool Validate(string name, string password)
        {
            if (name == "user" && password == "password")
                return true;

            return false;
        }
    }
}

using System;

namespace Mvc.Domain
{
    public class UserService
    {
        private readonly IUserRepository _repository;

        public UserService(IUserRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException("Repository");
        }
    }
}

using Mvc.Dto;
using System;
using System.Linq;

namespace Mvc.Domain
{
    public class PersonService
    {
        private readonly IPersonRepository _repository;

        public PersonService(IPersonRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException("Repository");
        }

        public Person GetById(int id)
        {
            return _repository.GetById(id);
        }

        public IQueryable<Person> GetPersons()
        {
            return _repository.GetPersons();
        }

        public void Save(Person person)
        {
            _repository.Save(person);
        }

        public void Delete(int Id)
        {
            _repository.Delete(Id);
        }
    }
}

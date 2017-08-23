using Mvc.Dto;
using System.Linq;

namespace Mvc.Domain
{
    public interface IPersonRepository
    {
        Person GetById(int Id);
        IQueryable<Person> GetPersons();
        void Save(Person person);
        void Delete(int Id);
    }
}

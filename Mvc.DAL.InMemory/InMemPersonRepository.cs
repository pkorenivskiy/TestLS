using Mvc.Domain;
using Mvc.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mvc.DAL.InMemory
{
    public class InMemPersonRepository : IPersonRepository
    {
        private static List<Person> _persons;

        static InMemPersonRepository()
        {
            _persons = new List<Person>();
        }

        public void Delete(int Id)
        {
            var person = _persons.Where(p => p.Id == Id).FirstOrDefault();
            if (person != null)
                _persons.Remove(person);
        }

        public Person GetById(int Id)
        {
            var person = _persons.Where(p => p.Id == Id).FirstOrDefault();
            return person;
        }

        public IQueryable<Person> GetPersons()
        {
            return _persons.AsQueryable();
        }

        public void Save(Person person)
        {
            if (person.Id == 0)
            {
                if (_persons.Count > 0)
                    person.Id = _persons.OrderBy(p => p.Id).LastOrDefault().Id + 1;
                else
                    person.Id = 1;
            }

            var oldPerson = _persons.Where(p => p.Id == person.Id).FirstOrDefault();
            if (oldPerson != null)
                _persons.Remove(oldPerson);

            _persons.Add(person);
        }
    }
}

using Mvc.Domain;
using Mvc.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mvc.App.Controllers
{
    public class PersonController : Controller
    {        
        private readonly IPersonRepository _personRepository;

        public PersonController(IPersonRepository repository)
        {
            _personRepository = repository;
        }

        // GET: Person
        public ActionResult Index()
        {
            var model = _personRepository.GetPersons().ToList();
            return View(model);
        }

        // GET: Person/Details/5
        public ActionResult Details(int id)
        {
            var model = _personRepository.GetById(id);
            return View(model);
        }


        // GET: Person/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Person/Create
        [HttpPost]
        public ActionResult Create(Person person)
        {
            try
            {
                _personRepository.Save(person);
            }
            catch
            {
                return View();
            }

            return Redirect("/Person/Index");
        }

        // GET: Person/Edit/5
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = _personRepository.GetById(id);
            return View(model);
        }

        // POST: Person/Edit/5
        [HttpPost]
        public ActionResult Edit(Person person)
        {
            try
            {
                _personRepository.Save(person);
            }
            catch
            {
                return View();
            }
            return Redirect("/Person/Index");
        }

        // GET: Person/Delete/5
        public ActionResult Delete(int id)
        {
            var model = _personRepository.GetById(id);

            return View(model);
        }

        // POST: Person/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                _personRepository.Delete(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        [Authorize]
        public ActionResult UpdateDescription(int Id, string description)
        {
            var person = _personRepository.GetById(Id);
            if (person != null)
            {
                person.Descriprion = description;
                _personRepository.Save(person);
                return Json(new { result = "Ok" });
            }
            else
            {
                return Json(new { result = "Fail", description = "Person not found" });
            }
        }
    }
}

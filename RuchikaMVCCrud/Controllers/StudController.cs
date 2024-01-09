using ClosedXML.Excel;
using Dapper;
using PagedList;
using RuchikaMVCCrud.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;

namespace RuchikaMVCCrud.Controllers
{
    public class StudController : Controller
    {
        // GET: Stud

        public ActionResult Index(string search, string sortOrder, int? page, int? pageSize)
        {
            // Use the search parameter to filter the data
            var students = StudDapOrm.ReturnList<StudModel>("StudView", null);
            ViewBag.NameSortParm = string.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.EmailSortParm = sortOrder == "email_asc" ? "email_desc" : "email_asc";
            ViewBag.AgeSortParm = sortOrder == "age_asc" ? "age_desc" : "age_asc";
            ViewBag.GenderSortParm = sortOrder == "gender_asc" ? "gender_desc" : "gender_asc";
            ViewBag.FeesSortParm = sortOrder == "fees_asc" ? "fees_desc" : "fees_asc";

            switch (sortOrder)
            {
                case "name_desc":
                    students = students.OrderByDescending(s => s.Name);
                    break;
                case "email_asc":
                    students = students.OrderBy(s => s.EmailID);
                    break;
                case "email_desc":
                    students = students.OrderByDescending(s => s.EmailID);
                    break;
                case "age_asc":
                    students = students.OrderBy(s => s.Age);
                    break;
                case "age_desc":
                    students = students.OrderByDescending(s => s.Age);
                    break;
                case "gender_asc":
                    students = students.OrderBy(s => s.Gender);
                    break;
                case "gender_desc":
                    students = students.OrderByDescending(s => s.Gender);
                    break;
                case "fees_asc":
                    students = students.OrderBy(s => s.Fees);
                    break;
                case "fees_desc":
                    students = students.OrderByDescending(s => s.Fees);
                    break;
                default:
                    students = students.OrderBy(s => s.Name);
                    break;
            }
            ViewBag.Search = search;

            if (!string.IsNullOrEmpty(search))
            {
                students = students.Where(s =>
                    s.GetType().GetProperties().Any(property =>
                    {
                        var propertyValue = property.GetValue(s);
                        return propertyValue != null &&
                               propertyValue.ToString().IndexOf(search, StringComparison.OrdinalIgnoreCase) >= 0;
                    })
                );
            }

            //return View(students);
            int pageNumber = (page ?? 1);
            int pageSizeValue = pageSize ?? 10; // Default page size is 10

            // Paginate the student data
            var pagedStudents = students.ToPagedList(pageNumber, pageSizeValue);

            // Include "Show All" option in the PageSize dropdown
            var pageSizeOptions = new[] { 5, 10, 15, 20, 25 };
            ViewBag.PageSize = new SelectList(pageSizeOptions, pageSizeValue);

            return View(pagedStudents);

        }
        [HttpGet]
        public ActionResult AddEd(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters dp1 = new DynamicParameters();
                dp1.Add("@StudentID", id);
                return View(StudDapOrm.ReturnList<StudModel>("StudViewById", dp1).FirstOrDefault<StudModel>());
            }
        }
        [HttpPost]
        public ActionResult AddEd(StudModel student, FormCollection form)
        {
            if (student != null && ModelState.IsValid)
            {
                // Retrieve the selected skills from the form collection
                var selectedSkills = form["Skills"];

                // If skills are selected, join them into a comma-separated string
                if (!string.IsNullOrEmpty(selectedSkills))
                {
                    student.Skills = string.Join(",", selectedSkills.Split(',').Select(skill => skill.Trim()));
                }
                else
                {
                    student.Skills = string.Empty; // No skills selected
                }
                // The rest of your code remains unchanged
                DynamicParameters dp = new DynamicParameters();
                dp.Add("@StudentID", student.StudentID);
                dp.Add("@Name", student.Name);
                dp.Add("@EmailID", student.EmailID);
                dp.Add("@Age", student.Age);
                dp.Add("@Gender", student.Gender);
                dp.Add("@Skills", student.Skills);
                dp.Add("@Fees", student.Fees);
                StudDapOrm.ExecuteWithoutReturn("StudAddDelete", dp);
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        [HttpGet]
        public ActionResult Edit(int id = 0)
        {
            if (id == 0)
            {
                return HttpNotFound(); // Return a 404 Not Found if the ID is not provided
            }
            else
            {
                DynamicParameters dp1 = new DynamicParameters();
                dp1.Add("@StudentID", id);
                return View(StudDapOrm.ReturnList<StudModel>("StudViewById", dp1).FirstOrDefault<StudModel>());
            }
        }
        [HttpPost]
        public ActionResult Edit(StudModel student, FormCollection form)
        {
            if (student != null && ModelState.IsValid)
            {
                var selectedSkills = form["Skills"];

                // If skills are selected, join them into a comma-separated string
                if (!string.IsNullOrEmpty(selectedSkills))
                {
                    student.Skills = string.Join(",", selectedSkills.Split(',').Select(skill => skill.Trim()));
                }
                else
                {
                    student.Skills = string.Empty; // No skills selected
                }
                DynamicParameters dp = new DynamicParameters();
                dp.Add("@StudentID", student.StudentID);
                dp.Add("@Name", student.Name);
                dp.Add("@EmailID", student.EmailID);
                dp.Add("@Age", student.Age);
                dp.Add("@Gender", student.Gender);
                dp.Add("@Skills", student.Skills);
                dp.Add("@Fees", student.Fees);

                // Call the stored procedure to update the student
                StudDapOrm.ExecuteWithoutReturn("UpdateStudent", dp);

                return RedirectToAction("Index");
            }
            else
            {
                // If ModelState is not valid, return to the Edit view with the provided model
                return View(student);
            }
        }

        public ActionResult Del(int id)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("@StudentID", id);
            ViewBag.RecordId = id;       
            return View();
        }
        public ActionResult DeleteConfirmed(int id)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("@StudentID", id);
            StudDapOrm.ExecuteWithoutReturn("DeleteStud", dp);
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            DynamicParameters dp1 = new DynamicParameters();
            dp1.Add("@StudentID", id);
            StudDapOrm.ExecuteWithoutReturn("StudViewById", dp1);
            return View(StudDapOrm.ReturnList<StudModel>("StudViewById", dp1).FirstOrDefault<StudModel>());

        }
        public ActionResult SoftDeletedRecords()
        {
            return View(StudDapOrm.ReturnList<StudModel>("SoftDeletedStudView", null));
        }
        public ActionResult RetriveData(int id)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("@StudentID", id);
            StudDapOrm.ExecuteWithoutReturn("Retrive", dp);
            return RedirectToAction("Index");
        }
        public ActionResult ExportStudDataToExcel()
        {
            // Retrieve data from the "StudView" stored procedure
            IEnumerable<StudModel> students = StudDapOrm.ReturnList<StudModel>("StudView", null);
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("StudData");

                // Add header row
                worksheet.Cell(1, 1).Value = "StudentID";
                worksheet.Cell(1, 2).Value = "Name";
                worksheet.Cell(1, 3).Value = "Age";
                worksheet.Cell(1, 4).Value = "Gender";
                worksheet.Cell(1, 5).Value = "Fees";

                // Add data rows
                int row = 2;
                foreach (var student in students)
                {
                    worksheet.Cell(row, 1).Value = student.StudentID;
                    worksheet.Cell(row, 2).Value = student.Name;
                    worksheet.Cell(row, 3).Value = student.Age;
                    worksheet.Cell(row, 4).Value = student.Gender;
                    worksheet.Cell(row, 5).Value = student.Fees;
                    row++;
                }
                // Set content type and header for the response
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=StudData.xlsx");
                // Write the workbook content to the response
                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    stream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
            // Return an empty result to prevent rendering a view
            return new EmptyResult();
        }
    }
}
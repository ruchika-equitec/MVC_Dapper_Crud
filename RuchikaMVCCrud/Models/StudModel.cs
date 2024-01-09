using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace RuchikaMVCCrud.Models
{
    public class StudModel
    {
    
        public int StudentID {  get; set; }
        [RegularExpression("^[a-zA-Z]+$", ErrorMessage = "Name should only contain alphabetical characters")]
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Email Address is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string EmailID { get; set; }

        [Required(ErrorMessage = "Age is required")]
        [Range(1, int.MaxValue, ErrorMessage = "Age must be a positive integer")]
        public int Age {  get; set; }
        [Required(ErrorMessage ="Fees is required")]
      
        public string Skills { get; set; }
        [Required(ErrorMessage = "skills is required")]

        public int Fees {  get; set; }
        [Required(ErrorMessage = "Gender is required")]
        public string Gender { get; set; }
       
    }   
}
using System.ComponentModel.DataAnnotations;

namespace MyBlog.Models
{
    public class Links
    {
        [Key]
        public int id { get; set; }

        [Display(Name = "友链名称")]
        [Required(ErrorMessage = "友链名称不能为空")]
        public string name { get; set; }

        [Display(Name = "地址")]
        [Required(ErrorMessage = "地址不能为空")]
        public string address { get; set; }
    }
}
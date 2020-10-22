using System.ComponentModel.DataAnnotations;

namespace MyBlog.Models
{
    public class Labels
    {
        [Key]
        [Display(Name = "标签编号")]
        public int lid { get; set; }

        [Display(Name = "标签名")]
        [Required(ErrorMessage = "标签名不能为空")]
        public string name { get; set; }
    }
}

using System;
using System.ComponentModel.DataAnnotations;

namespace MyBlog.Models
{
    public class Message
    {
        [Key]

        public int m_id { get; set; }

        [Required(ErrorMessage = "内容不能为空")]
        [Display(Name = "内容")]
        [DataType(DataType.MultilineText)]
        public string m_content { get; set; }

        [Required(ErrorMessage = "昵称不能为空")]
        [Display(Name = "昵称")]
        public string athor { get; set; }

        [Required(ErrorMessage = "邮箱不能为空")]
        [Display(Name = "邮箱")]
        public string email { get; set; }

        [Display(Name = "回复时间：")]
        [DisplayFormat(DataFormatString = "{0:yyyy年MM月dd日}")]
        DateTime? now = null;
        public virtual System.DateTime time
        {
            get { return now ?? DateTime.Now; }
            set { now = value; }
        }

        public string answer { get; set; }
    }
}
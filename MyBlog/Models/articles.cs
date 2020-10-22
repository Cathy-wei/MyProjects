using System;
using System.ComponentModel.DataAnnotations;

namespace MyBlog.Models
{
    //文章实体类
    public class Articles
    {
        public int id { get; set; }

        [Display(Name = "标签编号")]
        public int lid { get; set; }

        [Required(ErrorMessage = "标题不能为空")]
        [Display(Name = "标题")]
        public string title { get; set; }

        [Display(Name = "类型")]
        public string type { get; set; }
        //public DateTime time { get; set; }
        [Required(ErrorMessage = "内容不能为空")]
        [Display(Name = "内容")]
        [DataType(DataType.MultilineText)]
        public string content { get; set; }
        public int view { get; set; }
        public int like { get; set; }

        [Display(Name = "发布时间：")]
        [DisplayFormat(DataFormatString = "{0:yyyy年MM月dd日}")]
        DateTime? now = null;
        public virtual System.DateTime time
        {
            get { return now ?? DateTime.Now; }
            set { now = value; }
        }

    }
}
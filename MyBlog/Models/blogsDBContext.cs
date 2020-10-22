using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace MyBlog.Models
{
    public class blogsDBContext : DbContext
    {
        public blogsDBContext() : base("blogContext")
        {

        }
        //去掉自动在表名后添加的s
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
        public DbSet<Articles> Articles { get; set; }
        public DbSet<Labels> Labels { get; set; }
        public DbSet<Links> Links { get; set; }
        public DbSet<Message> Message { get; set; }
    }
}
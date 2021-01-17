using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstDetailExample
{
    public partial class Course
    {
        public int CourseID { get; set; }
        public int AuthorID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public short Price { get; set; }
        public short Level { get; set; }
        public string LevelString { get; set; }
        public virtual Author Author { get; set; }
        public virtual ICollection<Tag> Tags { get; set; }
    }
    public partial class Author
    {
        public int AuthorID { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Course> Courses { get; set; }
    }
    public partial class Tag
    {
        public int TagID { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Course> Courses { get; set; }
    }
    public enum CourseLevel
    {
        Begineer = 1,
        Intermediate = 2,
        Advanced = 3
    }
    public class PlutoContext : DbContext
    {
        public DbSet<Course> Courses { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Tag> Tags { get; set; }

        public PlutoContext()
            :base("name:DefaultConnection")
        {

        }

    }

    class Program
    {
        static void Main(string[] args)
        {
        }
    }
}

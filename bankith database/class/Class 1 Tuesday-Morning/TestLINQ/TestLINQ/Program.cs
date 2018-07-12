using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestLINQ
{
    class Program
    {
        public class Student
        {
            public string LastName { get; set; }
            public List<int> Scores { get; set; }
        }

        static void Main()
        {

            // Use a collection initializer to create the data source. Note that 
            // each element in the list contains an inner sequence of scores.
            List<Student> students = new List<Student>
        {
           new Student {LastName="Omelchenko", Scores= new List<int> {97, 72, 81, 60}},
           new Student {LastName="O'Donnell", Scores= new List<int> {75, 84, 91, 39}},
           new Student {LastName="Mortensen", Scores= new List<int> {88, 94, 65, 85}},
           new Student {LastName="Garcia", Scores= new List<int> {97, 89, 85, 82}},
           new Student {LastName="Beebe", Scores= new List<int> {35, 72, 91, 70}},
           new Student {LastName="bankith", Scores= new List<int> {10,11,12,13}}
        };

            // Use a compound from to access the inner sequence within each element.
            // Note the similarity to a nested foreach statement.
            var scoreQuery = from student in students
                             from score in student.Scores
                             where score > 90
                             select new { Last = student.LastName, score };

            // Execute the queries.
            Console.WriteLine("scoreQuery:");
            // Rest the mouse pointer on scoreQuery in the following line to 
            // see its type. The type is IEnumerable<'a>, where 'a is an 
            // anonymous type defined as new {string Last, int score}. That is,
            // each instance of this anonymous type has two members, a string 
            // (Last) and an int (score).
            foreach (var student in scoreQuery)
            {
                Console.WriteLine("{0} Score: {1}", student.Last, student.score);
            }

            // Keep the console window open in debug mode.
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}

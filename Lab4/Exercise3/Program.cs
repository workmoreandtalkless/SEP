using System;
using System.Collections.Generic;

namespace Exercise3
{
   

    class Program
    {
        static void VarTest()
        {
            /*  int i = 43;

              string s = "...This is only a test...";

              int[] numbers = new int[] { 4, 9, 16 };

              SortedDictionary<string, List<DateTime>> complex =
                  new SortedDictionary<string, List<DateTime>>();*/

            /* var i = 43;

             var s = "...This is only a test...";

            var numbers = new int[] { 4, 9, 16 };

             var complex =
                 new SortedDictionary<string, List<DateTime>>();*/

            /*   var x;  // Error: what type is it?
               x = new int[] { 1, 2, 3 };*/

            //var x = { 1, 2, 3 }; // Error: array initalization expression not permitted

            var x = new[] { 1, 3, 2 };

         

        }

        static void Main(string[] args)
        {
            var customers = CreateCustomers();
            Console.WriteLine("Customers:\n");
            /*foreach (Customer1 c in customers)
                Console.WriteLine(c);*/
            foreach (var c in customers)
                Console.WriteLine(c);

        }
        static List<Customer1> CreateCustomers()
        {
            return new List<Customer1>
            {
            new Customer1(1) { Name = "Maria Anders",     City = "Berlin"    },
            new Customer1(2) { Name = "Laurence Lebihan", City = "Marseille" },
            new Customer1(3) { Name = "Elizabeth Brown",  City = "London"    },
            new Customer1(4) { Name = "Ann Devon",        City = "London"    },
            new Customer1(5) { Name = "Paolo Accorti",    City = "Torino"    },
            new Customer1(6) { Name = "Fran Wilson",      City = "Portland"  },
            new Customer1(7) { Name = "Simon Crowther",   City = "London"    },
            new Customer1(8) { Name = "Liz Nixon",        City = "Portland"  }
            };
        }
        /*

                static void Main(string[] args)
                {
                    var customers = CreateCustomers();
                    Console.WriteLine("Customers:\n");
                    foreach (Customer c in customers)
                        Console.WriteLine(c);

                }
                static List<Customer> CreateCustomers()
                {
                    return new List<Customer>
                    {
                    new Customer(1) { Name = "Maria Anders",     City = "Berlin"    },
                    new Customer(2) { Name = "Laurence Lebihan", City = "Marseille" },
                    new Customer(3) { Name = "Elizabeth Brown",  City = "London"    },
                    new Customer(4) { Name = "Ann Devon",        City = "London"    },
                    new Customer(5) { Name = "Paolo Accorti",    City = "Torino"    },
                    new Customer(6) { Name = "Fran Wilson",      City = "Portland"  },
                    new Customer(7) { Name = "Simon Crowther",   City = "London"    },
                    new Customer(8) { Name = "Liz Nixon",        City = "Portland"  }
                    };
                }*/

    }
}

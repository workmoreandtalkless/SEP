using System;
using System.Collections.Generic;
using System.Linq;
namespace Exercise8
{
    class Program
    {
        static void Main(string[] args)
        {
            Query();
            Console.WriteLine("Hello World!");
        }
        static void Query()
        {
            /* foreach(var c in CreateCustomers())
             {
                 var CustomerStores = new
                 {
                     *//*CustomerID = c.CustomerID,
                     City = c.City,*//*
                     c.CustomerID,
                     c.City,
                     CustomerName = c.Name,
                     Stores = from s in CreateStores() where s.City == c.City select s
                 };
                 Console.WriteLine("{0}\t{1}",
               CustomerStores.City, CustomerStores.CustomerName);

               foreach (var store in CustomerStores.Stores)
                   Console.WriteLine("\t<{0}>", store.Name);
             }*/

            /* var results = from c in CreateCustomers()
                           select new
                           {
                               c.CustomerID,
                               c.City,
                               CustomerName = c.Name,
                               Stores = CreateStores().Where(s => s.City == c.City)
                           };

             foreach(var result in results)
             {
                 Console.WriteLine("{0}\t{1}", result.City, result.CustomerName);
                 foreach (var store in result.Stores)
                     Console.WriteLine("\t<{0}>", store.Name);

             }*/

            /*var results = from c in CreateCustomers()
                          join s in CreateStores() on c.City equals s.City
                          select new
                          {
                              CustomerName = c.Name,
                              StoreName = s.Name,
                              c.City,
                          };

            foreach (var r in results)
                Console.WriteLine("{0}\t{1}\t{2}",
                    r.City, r.CustomerName, r.StoreName);*/

            var results = from c in CreateCustomers()
                          join s in CreateStores() on c.City equals s.City
                          group s by c.Name into g
                          let count = g.Count()
                          orderby count ascending
                          select new { CustomerName = g.Key, Count = count };

            foreach(var r in results)
            {
                Console.WriteLine(r);

                Console.WriteLine("{0}\t{1}", r.CustomerName, r.Count);
            }




        }

        static List<Store> CreateStores()
        {
            return new List<Store>{
             new Store { Name = "Jim’s Hardware",   City = "Berlin" },
            new Store { Name = "John’s Books",  City = "London" },
            new Store { Name = "Lisa’s Flowers",    City = "Torino" },
            new Store { Name = "Dana’s Hardware",   City = "London" },
            new Store { Name = "Tim’s Pets",    City = "Portland" },
            new Store { Name = "Scott’s Books",     City = "London" },
            new Store { Name = "Paula’s Cafe",  City = "Marseille" },

            };
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
        }
    }
}

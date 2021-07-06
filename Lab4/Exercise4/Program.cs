using System;
using System.Collections.Generic;

namespace Exercise4
{
    class Program
    {
        static void Main(string[] args)
        {
            var customers = CreateCustomers();
            var addedCustomers = new List<Customer> 
            {
                new Customer(9)  { Name = "Paolo Accorti", City = "Torino" },
                new Customer(10) { Name = "Diego Roel", City = "Madrid" }
            };
            var updatedCustomers = customers.Append(addedCustomers);
            var newCustomer = new Customer(10)
            {
                Name = "Diego Roel",
                City = "Madrid"
            };

            foreach (var c in updatedCustomers)
            {
               /* if (Extensions.Compare(newCustomer, c))
                {
                    Console.WriteLine("The new customer was already in the list");
                    return;
                }*/
                if (newCustomer.Compare(c))
                {
                    Console.WriteLine("The new customer was already in the list");
                    return;
                }

            }

            Console.WriteLine("The new customer was not in the list");

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

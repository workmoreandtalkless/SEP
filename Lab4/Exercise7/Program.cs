using System;
using System.Collections.Generic;
using System.Linq;

namespace Exercise7
{
    public class Store
    {
        public string Name { get; set; }
        public string City { get; set; }
        public override string ToString()
        {
            return Name + "\t" + City;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Query();
            Console.WriteLine("Hello World!");
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
        static void Query()
        {
            /* var stores = CreateStores();
             foreach(var store in stores.Where(s => s.City =="London"))
             {
                 Console.WriteLine(store);
             }*/

            /*  var stores = CreateStores();
              IEnumerable<Store> results = from s in stores
                                           where s.City == "London"
                                           select s;

              foreach(var s in results)
              {
                  Console.WriteLine(s);
              }*/

            var stores = CreateStores();
            var numberLondon = stores.Count(s => s.City == "London");
            Console.WriteLine("There are {0} stores in London", numberLondon);
        }
    }
}

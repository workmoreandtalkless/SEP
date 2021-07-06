using System;

namespace Exercise1
{   
    public class Point
    {
        private int x;
        private int y;

        public int X { get { return x; } set { x = value; } }
        public int Y { get { return y; } set { x = value; } }
    }

    public class Point1
    {
        public int X { get; set; }
        public int Y { get; set; }
    }

    public class Customer
    {
        public string Name { get; set; }
        public string City { get; set; }
        public int CustomerID { get; private set; }

        public Customer(int ID)
        {
            CustomerID = ID;
        }
        public override string ToString()
        {
            return Name + "\t" + City+"\t"+CustomerID;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Customer c = new Customer(1);
            c.Name = "Maria Anders";
            c.City = "Berlin";
          /*  c.CustomerID = 1;*/
            Console.WriteLine(c);

        }
    }
}

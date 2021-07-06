using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise3
{
    class Customer1
    {
        public string Name { get; set; }
        public string City { get; set; }
        public int CustomerID { get; private set; }

        public Customer1(int ID)
        {
            CustomerID = ID;
        }
        public override string ToString()
        {
            return Name + "\t\t" + City + "\t\t" + CustomerID;
        }
    }
}

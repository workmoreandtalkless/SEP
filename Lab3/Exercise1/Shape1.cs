using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise1
{
    abstract class Shape1
    {

        protected double R, L, B;

        //Abstract methods can have only declarations
        public abstract double Area();
        public abstract double Circumference();

    }

}

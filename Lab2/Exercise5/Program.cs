using System;

namespace Exercise5
{
    class Box
    {
        public double length;
        public double breadth;
        public double height;
        public double getVolume()
        {
            return length * breadth * height;
        }
        public void setLength(double len)
        {
            length = len;
        }

        public void setBreadth(double bre)
        {
            breadth = bre;
        }

        public void setHeight(double hei)
        {
            height = hei;
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Box box1 = new Box { length=10, breadth=3, height=7 };
            Box box2 = new Box { length=10, breadth=3, height=52 };
            Box box3 = new Box { length=10, breadth=10, height=54 };
            Console.WriteLine("Volume of box1 : "+ box1.getVolume());
            Console.WriteLine("Volume of box2 : " + box2.getVolume());
            Console.WriteLine("Volume of box3 : " + box3.getVolume());
        }
    }
}

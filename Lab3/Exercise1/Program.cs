using System;

namespace Exercise1
{
    

    class Program
    {
        static void Main(string[] args)
        {
            Shape1 rec = new Rectangle();
            /* Console.WriteLine("Area : {0:0.00}", rec.Area());
             Console.WriteLine("Circumference : {0:0.00}", rec.Circumference());*/
            Calculate(rec);
            Shape1 cir = new Circle();
            /*Console.WriteLine("Area : {0:0.00}", cir.Area());
            Console.WriteLine("Circumference : {0:0.00}", cir.Circumference());*/
            Calculate(cir);

        }

        public static void Calculate(Shape1 S)
        {

            Console.WriteLine("Area : {0:0.00}", S.Area());
            Console.WriteLine("Circumference : {0:0.00}", S.Circumference());

        }

    }
}

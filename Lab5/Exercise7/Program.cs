﻿using System;

namespace Exercise7
{
    class Program
    {
        static void Main(string[] args)
        {
            double number = 0;
            Console.Write("Please enter number:");
            number = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Rounded value of {0} is {1}", number, (int)(number + 0.5));
            Console.ReadKey();

        }
    }
}

using System;
using System.Collections.Generic;

namespace Exercise4
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] arr = new int[,] { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
            spiralOrder(arr);
        }

        public static List<Int32> spiralOrder(int [,] arr)
        {
            List<Int32> list = new List<Int32>();
            if (arr.Length == 0) return list;

            int r1 = 0, r2 = arr.GetLength(0) - 1;
            int c1 = 0, c2 = arr.GetLength(1) - 1;

            while (r1 <= r2 && c1 <= c2)
            {
                for(int c = c1; c <= c2; c++)
                {
                    list.Add(arr[r1,c]);
                    Console.Write(arr[r1, c] + " ");
                }
                for(int r = r1 + 1; r <= r2; r++)
                {
                    list.Add(arr[r, c2]);
                    Console.Write(arr[r, c2] + " ");
                }
                if(r1<r2&& c1 < c2)
                {
                    for(int c = c2 - 1; c > c1; c--)
                    {
                        list.Add(arr[r2, c]);
                        Console.Write(arr[r2, c] + " ");
                    }
                    for(int r = r2; r > r1; r--)
                    {
                        list.Add(arr[r, c1]);
                        Console.Write(arr[r, c1] + " ");
                    }
                }
                r1++;
                r2--;
                c1++;
                c2--;
            }
            return list;
        }
    }
}

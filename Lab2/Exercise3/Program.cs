using System;

namespace Exercise3
{
    class Solution
    {
        public int solution(int A, int B)
        {
            int cnt = 0;
            for(int i = A; i <= B; i++)
            {
                if (isP(i))
                {
                    Console.WriteLine("this number is whole square: {0}", i);
                    cnt++;
                }
            }
            return cnt;

        }

        public bool isP(int i)
        {
            double result = Math.Sqrt(i);
            bool isSquare = result % 1 == 0;
            return isSquare;
        }
        
    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("please enter 2 words: ");
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());

        Exercise3.Solution s1 = new Exercise3.Solution();

        Console.WriteLine(s1.solution(a, b));
        }
    }
}

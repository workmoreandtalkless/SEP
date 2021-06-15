using System;

namespace Exercise9
{
    class A
    {
        int n;
        string s;
        public A(int n)
        {
            this.n = n;
        }
        public int getN()
        {
            return n;
        }
    }
    class Program
    { 
        static void Main(string[] args)
        {
            A[] v = new A[10];
            for(int i = 0; i < v.Length; i++)
            {
                v[i] = new A(50-i);
            }
            print(v);
            Array.Sort(v, delegate (A a, A b)
             {
                 return a.getN().CompareTo(b.getN());
             });

            print(v);

        }

        static void print(A[] v)
        {
            foreach (A item in v)
            {
                Console.Write(item.getN()+" ");
            }
            Console.WriteLine();
        }
    }
}

using System;

namespace Exercise8
{
    class A
    {
        int x;
        public abstract void f(int n);
        private virtual void g(uint n)
        {
            //x = n as int; error
            x = (int)x;
        }
        public string ToString()
        {
            return x.ToString();
        }
    }

}

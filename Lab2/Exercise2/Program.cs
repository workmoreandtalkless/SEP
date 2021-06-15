using System;
using System.Collections.Generic;

namespace Exercise2
{
    class Solution{
             public int solution(int[] A)
    {
        Dictionary<int, int> dic = new Dictionary<int, int>();
        foreach (int x in A)
        {
            if (dic.ContainsKey(x))
            {
                dic[x]++;
            }
            else
            {
                dic[x] = 1;
            }
        }
        int max = 0;
        int value = 0;
        foreach (KeyValuePair<int, int> kv in dic)
        {
            if (kv.Value > max)
            {
                max = kv.Value;
                value = kv.Key;
            }


        }
        return value;

        }
    }




class Program

    {


        static void Main(string[] args)
        {
            int size = 0;
            Console.WriteLine("please enter array size: ");
            size = Convert.ToInt32(Console.ReadLine());

            int[] arr = new int[size];
            int index = 0;
            Console.WriteLine("please enter array number: ");
            while (index < size)
            {
                arr[index++] = Convert.ToInt32(Console.ReadLine());
            }

            Solution p1 = new Solution();
            Console.WriteLine("the solution is:{0}", p1.solution(arr));


        }
       
    }

}

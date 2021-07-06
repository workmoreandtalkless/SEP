using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise5
{
    public delegate bool KeyValueFilter<K, V>(K key, V value);

    public static class Extensions
    {
        public static List<K> FilterBy<K,V>(
            this Dictionary<K,V> items,KeyValueFilter<K,V> filter)
        {
            var result = new List<K>();
            foreach(KeyValuePair<K,V> element in items)
            {
                if (filter(element.Key, element.Value))
                    result.Add(element.Key);
            }
            return result;
        }

        public static List<T> Append<T>(this List<T> a, List<T> b)
        {
            var newList = new List<T>(a);
            newList.AddRange(b);
            return newList;
        }
    }

    class Customer
    {
        public string Name { get; set; }
        public string City { get; set; }
        public int CustomerId { get; private set; }

        public Customer(int id)
        {
            this.CustomerId = id;
        }

        public override string ToString()
        {
            return "Name: " + Name + "\t\t" + City + "\t\t" + CustomerId;
        }


    }
}

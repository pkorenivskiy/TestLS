using System;
using System.IO;
using System.Text;
using System.Linq;
using System.Collections.Generic;

namespace TestCs
{
    class Program
    {
        private static readonly int MAXWORDS = 10000000;
        private static readonly int MAXWORD = 50;

        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            var fileName = "data.txt";
            if (args.Length > 0)
                fileName = args[0];

            if (args.Length == 0)
            {
                if (createData(fileName) == false)
                {
                    Console.WriteLine("Error on create test data.");
                    return;
                }
            }

            var words = parceData(fileName);
            
            if (words == null)
            {
                Console.WriteLine("Can't process inpur data");
                return;
            }
            
            if (storeResult(words, "result.txt") == false)
            {
                Console.WriteLine("Can't store result");
                return;
            }
        }        

        static List<string> parceData(string fileName)
        {
            var result = new List<string>(MAXWORDS);
            try
            {
                using (var sr = File.OpenText(fileName))
                {
                    var ch = sr.Read();

                    while (ch != -1)
                    {
                        var word = string.Empty;
                        while (ch != -1 && char.IsLetterOrDigit((char)ch))
                        {
                            word += (char)ch;
                            ch = sr.Read();
                        }

                        ch = (char)sr.Read();
                        while (ch != -1 && char.IsLetterOrDigit((char)ch) == false)
                            ch = sr.Read();

                        result.Add(word);
                    }
                }
            }
            catch(Exception /*ex*/)
            {
                return null;
            }

            return result;
        }

        static bool storeResult(List<String> words, string fileName)
        {
            bool result = false;

            try
            {
                using (var sw = File.CreateText("result.txt"))
                {
                    var query = from w in words
                                group w by w into gw
                                orderby gw.Count() descending, gw.Key
                                select new { Word = gw.Key, Count = gw.Count() };

                    query.ToList().ForEach(x => sw.WriteLine($"{x.Word} {x.Count}"));
                }

                result = true;
            }
            catch(Exception /*ex*/)
            {
                result = false;
            }

            return result;
        }

        static bool createData(string fileName)
        {
            bool result = false;

            try
            {
                var data = new StringBuilder(MAXWORDS * MAXWORD);
                var random = new Random();
                var randomChar = new Random();
                for (var i = 0; i < MAXWORDS; ++i)
                {
                    var length = random.Next(3, MAXWORD);
                    for (var j = 0; j < length; ++j)
                    {
                        char ch = (char)(randomChar.Next(32, 127));
                        if (char.IsLetter(ch))
                            data.Append(ch);
                    }
                    data.Append(' ');
                }

                using (var sw = File.CreateText(fileName))
                {
                    sw.Write(data.ToString());
                }

                result = true;
            }
            catch (Exception /*ex*/)
            {
                result = false;
            }

            return result;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Demos.Common.Demonstrators;
using System.Reflection;

namespace Demos.Common.Util
{
    public static class DemonstratorDiscovery
    {
        /// <summary>
        /// Finds the demonstrators registered by interface.
        /// </summary>
        public static List<IDemonstrateDials> FindDemonstrators()
        {
            var types = from p in Assembly.GetExecutingAssembly().GetTypes()
                        where (p.GetInterface("IDemonstrateDials", false) != null)
                        select p;
            var demonstrations = (from p in types
                               orderby p.Name
                               select Activator.CreateInstance(p) as IDemonstrateDials).ToList();

            demonstrations.Sort((a, b) => a.DemoName.CompareTo(b.DemoName));
            return demonstrations;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Demos.Common.Demonstrators;

namespace Demos.Common.Util
{
    public static class DemonstratorDiscovery
    {
        /// <summary>
        ///     Finds the demonstrators registered by interface.
        /// </summary>
        public static List<IDemonstrateDials> FindDemonstrators()
        {
            var types = from p in Assembly.GetExecutingAssembly().GetTypes()
                where p.GetInterface("IDemonstrateDials", false) != null
                select p;
            var demonstrations = (from p in types
                orderby p.Name
                select Activator.CreateInstance(p) as IDemonstrateDials).ToList();

            demonstrations.Sort((a, b) => string.Compare(a.DemoName, b.DemoName, StringComparison.Ordinal));
            return demonstrations;
        }
    }
}
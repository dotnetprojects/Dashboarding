using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public interface IDemonstrateDials
    {
        /// <summary>
        /// Gets the display name of the control.
        /// </summary>
        /// <value>The name.</value>
        string DemoName { get; }

        /// <summary>
        /// Creates a control for this demo.
        /// </summary>
        /// <returns></returns>
        UserControl Create();
    }
}

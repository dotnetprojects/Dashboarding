using System.Windows.Media;
using System;

namespace Demos.Common.Util
{
    /// <summary>
    /// The result of a color selection event
    /// </summary>
    public class ColorSelectedEventargs : EventArgs
    {
        /// <summary>
        /// Gets or sets the color selected.
        /// </summary>
        /// <value>The color selected.</value>
        public Color Color { get; set; }
    }
}

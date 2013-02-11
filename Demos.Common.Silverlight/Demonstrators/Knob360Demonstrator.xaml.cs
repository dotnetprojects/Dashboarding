using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Demos.Common.Demonstrators
{
    public class Knob360Demo : IDemonstrateDials
    {

        /// <summary>
        /// Gets the display name of the control.
        /// </summary>
        /// <value>The name.</value>
        public string DemoName
        {
            get { return "* Knob360"; }
        }

        /// <summary>
        /// Creates a control for this demo.
        /// </summary>
        /// <returns></returns>
        public UserControl Create()
        {
            return new Knob360Demonstrator();
        }
    }

    /// <summary>
    /// Interaction logic for Knob360Demonstrator.xaml
    /// </summary>
    public partial class Knob360Demonstrator : UserControl
    {
        private BoundObject _object = BoundObject.Create(Colors.White);


        public Knob360Demonstrator()
        {
            InitializeComponent();
            DataContext = _object;
        }

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Knob360"; }
        }

        #endregion
    }
}

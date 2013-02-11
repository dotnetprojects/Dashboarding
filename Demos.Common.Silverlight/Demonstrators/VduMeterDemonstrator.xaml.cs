using System;
using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public class VduDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Decade VU Meter"; }
        }

        public UserControl Create()
        {
            return new VduMeterDemonstrator();
        }

        #endregion
    }
    /// <summary>
    /// Interaction logic for VduMeterDemonstrator.xaml
    /// </summary>
    public partial class VduMeterDemonstrator : UserControl
    {
        public VduMeterDemonstrator()
        {
            InitializeComponent();
            this.DataContext = new BoundObject();
        }
    }
}

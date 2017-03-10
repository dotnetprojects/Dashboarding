using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public class VduDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName => @"Decade VU Meter";

        public UserControl Create()
        {
            return new VduMeterDemonstrator();
        }

        #endregion
    }
    /// <summary>
    /// Interaction logic for VduMeterDemonstrator.xaml
    /// </summary>
    public partial class VduMeterDemonstrator
    {
        public VduMeterDemonstrator()
        {
            InitializeComponent();
            DataContext = new BoundObject();
        }
    }
}

using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public class OdoDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Odometer"; }
        }

        public UserControl Create()
        {
            return new OdometerDemonstrator();
        }

        #endregion
    }

    /// <summary>
    /// Interaction logic for OdometerDemonstrator.xaml
    /// </summary>
    public partial class OdometerDemonstrator : UserControl
    {
        public OdometerDemonstrator()
        {
            InitializeComponent();
        }
    }
}

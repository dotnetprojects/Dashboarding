using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{

    public class MarqueDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Scrolling LED Marquee"; }
        }

        public UserControl Create()
        {
            return new LedMarqueeDemonstrator();
        }

        #endregion
    }

    /// <summary>
    /// Interaction logic for LedMarqueeDemonstrator.xaml
    /// </summary>
    public partial class LedMarqueeDemonstrator : UserControl
    {
        public LedMarqueeDemonstrator()
        {
            InitializeComponent();
        }
    }
}

using System.Windows.Controls;
using System.Windows.Media;

namespace Demos.Common.Demonstrators
{
    public class PlainThermometerDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "* Thermometers"; }
        }

        public UserControl Create()
        {
            return new PlainThermometerDemonstrator();
        }

        #endregion
    }


    /// <summary>
    /// Interaction logic for PlainThermometerDemonstrator.xaml
    /// </summary>
    public partial class PlainThermometerDemonstrator : UserControl
    {
        private BoundObject _object = BoundObject.Create(Colors.Blue);

        public PlainThermometerDemonstrator()
        {
            InitializeComponent();
            DataContext = _object;
        }
    }
}

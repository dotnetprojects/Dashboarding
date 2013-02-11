using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Demos.Common.Demonstrators
{
    public class Dial90Demo : IDemonstrateDials
    {


        public string DemoName
        {
            get { return "* Dial90"; }
        }


        public UserControl Create()
        {
            return new Dial90Demonstrator();
        }


    }

    /// <summary>
    /// Interaction logic for Dial90Demonstrator.xaml
    /// </summary>
    public partial class Dial90Demonstrator : UserControl
    {
        private BoundObject _object = BoundObject.Create(Colors.White);

        public Dial90Demonstrator()
        {
            InitializeComponent();
            DataContext = _object;
        }

    }
}

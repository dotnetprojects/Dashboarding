using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public class ProgressbarDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Progress bars"; }
        }

        public UserControl Create()
        {
            return new ProgressbarDemonstrator();
        }

        #endregion
    }
    /// <summary>
    /// Interaction logic for ProgressbarDemonstrator.xaml
    /// </summary>
    public partial class ProgressbarDemonstrator : UserControl
    {
        private BoundObject _object = new BoundObject { CurrentValue = 50 };

        public ProgressbarDemonstrator()
        {
            InitializeComponent();
            DataContext = _object;
        }
    }
}

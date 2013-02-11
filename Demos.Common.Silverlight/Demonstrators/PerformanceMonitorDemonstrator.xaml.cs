using System.Windows;
using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
  
    /// <summary>
    /// Interaction logic for PerformanceMonitorDemonstrator.xaml
    /// </summary>
    public partial class PerformanceMonitorDemonstrator : UserControl
    {
        public PerformanceMonitorDemonstrator()
        {
            InitializeComponent();
            DataContext = new BoundObject() ;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            BoundObject bo = DataContext as BoundObject;
            if (bo != null)
            {
                bo.CurrentValue = 77;
            }
        }
    }

    public class PerfDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Performance Monitor"; }
        }

        public UserControl Create()
        {
            return new PerformanceMonitorDemonstrator();
        }

        #endregion
    }
}

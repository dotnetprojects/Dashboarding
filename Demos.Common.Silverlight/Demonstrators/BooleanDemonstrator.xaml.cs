using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public class BooleansDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Boolean controls"; }
        }

        public UserControl Create()
        {
            return new BooleanDemonstrator();
        }

        #endregion
    }

    /// <summary>
    /// Interaction logic for BooleanDemonstrator.xaml
    /// </summary>
    public partial class BooleanDemonstrator : UserControl
    {
        BoolBoundObject _object = new BoolBoundObject();
        public BooleanDemonstrator()
        {
            InitializeComponent();
            DataContext = _object;
        }
    }

    /// <summary>
    /// class to demo two way boolean data binding
    /// </summary>
    public class BoolBoundObject
    {
        /// <summary>
        /// Gets or sets the current value.
        /// </summary>
        /// <value><c>true</c> if [current value]; otherwise, <c>false</c>.</value>
        public bool CurrentValue { get; set; }
    }


}
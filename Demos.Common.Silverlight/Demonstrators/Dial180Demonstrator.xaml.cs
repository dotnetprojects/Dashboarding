using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Codeplex.Dashboarding;

namespace Demos.Common.Demonstrators
{
    
    public class Dial180Demo: IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "* Dial180"; }
        }

        public UserControl Create()
        {
            return new Dial180Demonstrator();
        }

        #endregion
    }


    /// <summary>
    /// Interaction logic for Dial180Demonstrator.xaml
    /// </summary>
    public partial class Dial180Demonstrator : UserControl
    {

        private BoundObject _object = BoundObject.Create(Colors.White);


        public Dial180Demonstrator()
        {
            InitializeComponent();
            DataContext = _object;
        }

        #region IDemonstrateDials Members

      
        #endregion
    }
}

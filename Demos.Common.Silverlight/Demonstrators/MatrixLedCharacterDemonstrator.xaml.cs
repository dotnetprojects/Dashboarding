using System;
using System.Windows.Controls;

namespace Demos.Common.Demonstrators
{
    public class MatrixCharacterDemo : IDemonstrateDials
    {

        #region IDemonstrateDials Members

        public string DemoName
        {
            get { return "Matrix led character"; }
        }

        public UserControl Create()
        {
            return new MatrixLedCharacterDemonstrator();
        }

        #endregion
    }

    /// <summary>
    /// Interaction logic for MatrixLedCharacter.xaml
    /// </summary>
    public partial class MatrixLedCharacterDemonstrator : UserControl
    {

        public MatrixLedCharacterDemonstrator()
        {
            InitializeComponent();
        }
    }
}

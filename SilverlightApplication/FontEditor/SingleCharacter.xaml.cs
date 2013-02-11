using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Codeplex.Dashboarding;

namespace SilverlightApplication.FontEditor
{
    public partial class SingleCharacter : UserControl
    {

        public event EventHandler<LetterSelectedEventArgs> LetterSelected;

        public SingleCharacter()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (LetterSelected != null)
            {
                LetterSelected(this, new LetterSelectedEventArgs { Letter = _displayChar.Text, MatrixLedCharacter = _led });
            }
        }

        /// <summary>
        /// Initialize the control
        /// </summary>
        /// <param name="letter"></param>
        public void Ininitiale(string letter)
        {
            _displayChar.Text = letter;
            _led.Text = letter;
            _code.Text = "" + ((int)letter[0]);

        }


    }

    /// <summary>
    /// Event args for a letter selected
    /// </summary>
    public class LetterSelectedEventArgs: EventArgs
    {
        /// <summary>
        /// Letter selected
        /// </summary>
        public string Letter { get; set; }

        /// <summary>
        /// Control representing the letter
        /// </summary>
        public MatrixLedCharacter MatrixLedCharacter { get; set; }
    }

}

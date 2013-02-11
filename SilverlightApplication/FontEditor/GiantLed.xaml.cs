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
    public partial class GiantLed : UserControl
    {
        // <summary>
        /// stores a list of columns (5 of them) which are in turn lists of row states
        /// </summary>
        private List<List<bool>> columns = new List<List<bool>>(5);

        private Color LedOnColor = Colors.Red;
        private Color LedOffColor = Colors.Gray;

        public GiantLed()
        {
            InitializeComponent();
        }

        Ellipse _selected;

        private MatrixLedCharacter _matrixLedCharacter;

        /// <summary>
        /// Initialize all columns from a definition in the Character defintion
        /// </summary>
       internal void SetLedsFromCharacter(string t, MatrixLedCharacter matrixLedCharacter)
        {
            byte[] bytes = MatrixLedCharacterDefinitions.GetDefinition(t);
            _matrixLedCharacter = matrixLedCharacter;

            columns.Clear();
            for (int i = 0; i < bytes.Length - 1; i++)
            {
                List<bool> n = new List<bool> 
                {
                    (bytes[i] & 0x40) != 0,
                    (bytes[i] & 0x20) != 0,
                    (bytes[i] & 0x10) != 0,
                    (bytes[i] & 0x08) != 0,
                    (bytes[i] & 0x04) != 0,
                    (bytes[i] & 0x02) != 0,
                    (bytes[i] & 0x01) != 0,
                };
                columns.Add(n);
            }
            SetLedsFromState();
        }

       private void SetStateFromLeds()
       {
           List<byte> newRep = new List<byte>();
           foreach (List<bool> col in columns)
           {
               byte b = 0;
               if (col[6]) b |= 0x01;
               if (col[5]) b |= 0x02;
               if (col[4]) b |= 0x04;
               if (col[3]) b |= 0x08;
               if (col[2]) b |= 0x10;
               if (col[1]) b |= 0x20;
               if (col[0]) b |= 0x40;
               newRep.Add(b);
           }
           newRep.Add(0);
           MatrixLedCharacterDefinitions.CharacterDefinitions.Remove(_matrixLedCharacter.Text);
           MatrixLedCharacterDefinitions.CharacterDefinitions.Add(_matrixLedCharacter.Text,newRep.ToArray());
           string oldChar = _matrixLedCharacter.Text;
           _matrixLedCharacter.Text = " ";
           _matrixLedCharacter.Text = oldChar;
       }


        /// <summary>
        /// Set the leds on or off acording to the buffer state
        /// </summary>
        private void SetLedsFromState()
        {
            for (int x = 0; x < columns.Count; x++)
            {
                ProcessColumn(x);
            }
        }

        /// <summary>
        /// Switches on or off leds fr a single column
        /// </summary>
        /// <param name="x">the column number</param>
        private void ProcessColumn(int x)
        {
            for (int y = 0; y < columns[x].Count; y++)
            {
                bool on = columns[x][y];
                Ellipse el = LayoutRoot.FindName(String.Format("_l{0}_{1}", x, y)) as Ellipse;
                TureLedOnOrOff(on, el);

            }
        }

        /// <summary>
        /// Sets the led color for a single led
        /// </summary>
        /// <param name="on">true if the led is on false otherwise</param>
        /// <param name="el">The ellipse repesesenting the led</param>
        private void TureLedOnOrOff(bool on, Ellipse el)
        {
            if (el != null)
            {
                el.Fill = new SolidColorBrush((on) ? LedOnColor : LedOffColor);
            }
        }





        private void MouseDownOnRect(object sender, MouseButtonEventArgs e)
        {
            if (_matrixLedCharacter != null)
            {
                _selected = sender as Ellipse;

            }
        }
        private void MouseUpOnRect(object sender, MouseButtonEventArgs e)
        {
            if (_matrixLedCharacter != null && sender == _selected)
            {
                FlipBit();
            }
        }

        private void FlipBit()
        {
            string [] parts = _selected.Name.Split(new Char[] { '_', 'l' }, StringSplitOptions.RemoveEmptyEntries);
            int x = Int32.Parse(parts[0]);
            int y = Int32.Parse(parts[1]);


            List<bool> list = columns[x];
            bool newValue = !list[y];
            list.RemoveAt(y);
            list.Insert(y, newValue);
            SetLedsFromState();
            SetStateFromLeds();
        }

       



    }
}

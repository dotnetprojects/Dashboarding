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
using System.Text;

namespace SilverlightApplication.FontEditor
{
    public partial class FontEditor : UserControl
    {
        public FontEditor()
        {
            InitializeComponent();

            _rhp.LetterSelected += new EventHandler<LetterSelectedEventArgs>(LetterSelected);
        }

        void LetterSelected(object sender, LetterSelectedEventArgs e)
        {
            _giant.SetLedsFromCharacter(e.Letter, e.MatrixLedCharacter);
        }

        private void _save_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            List<string> letters = new List<string>();
            letters.AddRange(MatrixLedCharacterDefinitions.CharacterDefinitions.Keys);
            foreach (string letter in letters)
            {
             

                sb.AppendFormat("{{ \"{0}\", new byte [] {{ {1},{2},{3},{4},{5},0}} }},",
                    (letter != "\"") ? letter : "\\\"",
                    MatrixLedCharacterDefinitions.GetDefinition(letter)[0],
                    MatrixLedCharacterDefinitions.GetDefinition(letter)[1],
                    MatrixLedCharacterDefinitions.GetDefinition(letter)[2],
                    MatrixLedCharacterDefinitions.GetDefinition(letter)[3],
                    MatrixLedCharacterDefinitions.GetDefinition(letter)[4]
                    );
                sb.AppendLine();
            }
            _tb.Text = sb.ToString();
            _codePopup.IsOpen = true;
            
        }

        private void _close_Click(object sender, RoutedEventArgs e)
        {
            _codePopup.IsOpen = false;
        }
    }
}

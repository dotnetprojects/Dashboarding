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
    public partial class RightHandPanel : UserControl
    {
        public event EventHandler<LetterSelectedEventArgs> LetterSelected;

        public RightHandPanel()
        {
            InitializeComponent();
            RenderExistingLetters();
        }

        private void RenderExistingLetters()
        {
            List<string> letters = new List<string>();
            letters.AddRange(MatrixLedCharacterDefinitions.CharacterDefinitions.Keys);
            foreach (string letter in letters)
            {
                SingleCharacter sc = new SingleCharacter();
                sc.Ininitiale(letter);
                _wrapPanel.Children.Add(sc);
                sc.LetterSelected += new EventHandler<LetterSelectedEventArgs>(SingleCharacterClicked);
            }
        }

        void SingleCharacterClicked(object sender, LetterSelectedEventArgs e)
        {
            if (LetterSelected != null)
            {
                LetterSelected(this, e);
            }
        }
    }
}

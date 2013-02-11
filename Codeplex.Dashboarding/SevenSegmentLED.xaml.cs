using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;

using Codeplex.Dashboarding;

namespace WpfDashBoard
{
    /// <summary>
    /// SevenSegmentLED.xaml
    /// </summary>
    public partial class SevenSegmentLED : PlatformIndependentDashboard
    {
        private bool hasInitialized;
        private Dictionary<Leds, Path> leds = new Dictionary<Leds, Path>();
        internal enum Leds
        {
            TH,   //Top
            THL,  //Top Vertical Left
            THR,  //Top Vertical Right
            MH,   //Middle
            BHL,  //Bottom horizontal left
            BHR,  //Bottom horizontal Right
            BH,   //Bottom
            PO    //Point
        }
        private static Dictionary<string, List<Leds>> characterLeds = new Dictionary<string, List<Leds>>
        {
            { "0", new List<Leds> { Leds.TH, Leds.THL, Leds.THR,Leds.BHL,Leds.BHR,Leds.BH}},
            { "1", new List<Leds> { Leds.THR, Leds.BHR } },
            { "2", new List<Leds> { Leds.TH,Leds.THR,Leds.MH,Leds.BHL,Leds.BH} },
            { "3", new List<Leds> { Leds.TH,Leds.THR,Leds.MH,Leds.BHR,Leds.BH} },
            { "4", new List<Leds> { Leds.THL,Leds.THR,Leds.MH,Leds.BHR} },
            { "5", new List<Leds> { Leds.TH,Leds.THL,Leds.MH,Leds.BHR,Leds.BH} },
            { "6", new List<Leds> { Leds.TH,Leds.THL,Leds.MH,Leds.BH,Leds.BHL,Leds.BHR } },
            { "7", new List<Leds> { Leds.TH,Leds.THR,Leds.BHR } },
            { "8", new List<Leds> { Leds.TH,Leds.THL,Leds.THR,Leds.MH,Leds.BHL,Leds.BHR,Leds.BH } },
            { "9", new List<Leds> { Leds.TH,Leds.THL,Leds.THR,Leds.MH,Leds.BHR,Leds.BH } },
        };
        private void StoreLedInformation()
        {
            this.leds.Add(Leds.TH,  Path_6);
            this.leds.Add(Leds.THL, Path_1);
            this.leds.Add(Leds.THR, Path_5);
            this.leds.Add(Leds.MH,  Path_0);
            this.leds.Add(Leds.BHL, Path_2);
            this.leds.Add(Leds.BHR, Path_4);
            this.leds.Add(Leds.BH,  Path_3);
            this.leds.Add(Leds.PO,  Path_8);
        }

        /// <summary>
        /// 
        /// </summary>
        public SevenSegmentLED()
        {
            InitializeComponent();
            Loaded += new RoutedEventHandler(this.SixteenSegmentLED_Loaded);

            this.LedOffColor = Color.FromArgb(0x50, 0x5e, 0x57, 0x57);
            this.LedOnColor = Color.FromArgb(0xFF, 0x00, 0x99, 0x00);
        }
        private void SixteenSegmentLED_Loaded(object sender, RoutedEventArgs e)
        {
            if (!this.hasInitialized)
            {
                this.hasInitialized = true;
                this.StoreLedInformation();
            }

            this.Animate();
        }

        /// <summary>
        /// 
        /// </summary>
        public static readonly DependencyProperty DisplayCharacterProperty =
            DependencyProperty.Register("DisplayCharacter", typeof(string), typeof(SevenSegmentLED), new PropertyMetadata(new PropertyChangedCallback(DisplayCharacterPropertyChanged)));
        private static void DisplayCharacterPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            SevenSegmentLED instance = dependancy as SevenSegmentLED;
            if (instance != null)
            {
                instance.Animate();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string DisplayCharacter
        {
            get { return (string)GetValue(DisplayCharacterProperty); }
            set { SetValue(DisplayCharacterProperty, value); }
        }
        private static void ColorPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            SevenSegmentLED instance = dependancy as SevenSegmentLED;

            if (instance != null)
            {
                instance.Animate();
            }
        }
        #region decimal point 

        /// <summary>
        /// 
        /// </summary>
        public static readonly DependencyProperty PointOnProperty =
            DependencyProperty.Register("PointOn", typeof(bool), typeof(SevenSegmentLED), new PropertyMetadata(new PropertyChangedCallback(ColorPropertyChanged)));

        /// <summary>
        /// 
        /// </summary>
        public bool PointOn
        {
            get { return (bool)GetValue(PointOnProperty); }
            set { SetValue(PointOnProperty, value); }
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        public static readonly DependencyProperty LedOffColorProperty =
            DependencyProperty.Register("LedOffColor", typeof(Color), typeof(SevenSegmentLED), new PropertyMetadata(new PropertyChangedCallback(ColorPropertyChanged)));

        /// <summary>
        /// 
        /// </summary>
        public Color LedOffColor
        {
            get { return (Color)GetValue(LedOffColorProperty); }
            set { SetValue(LedOffColorProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public static readonly DependencyProperty LedOnColorProperty =
            DependencyProperty.Register("LedOnColor", typeof(Color), typeof(SevenSegmentLED), new PropertyMetadata(new PropertyChangedCallback(ColorPropertyChanged)));

        /// <summary>
        /// 
        /// </summary>
        public Color LedOnColor
        {
            get { return (Color)GetValue(LedOnColorProperty); }
            set { SetValue(LedOnColorProperty, value); }
        }

        private void Animate()
        {
            this.SetAllLedsOff();
            this.SetRequiresLedsON();
        }

        private void SetAllLedsOff()
        {
            foreach (Path path in this.leds.Values)
            {
                path.Fill = new SolidColorBrush(this.LedOffColor);
            }
        }

        private void SetRequiresLedsON()
        {
            if (this.leds.Count == 0 || String.IsNullOrEmpty(this.DisplayCharacter) || this.DisplayCharacter == " ")
            {
                return;
            }

            if (this.DisplayCharacter.Length > 1)
            {
                this.ShowError();
            }

            if (characterLeds.ContainsKey(this.DisplayCharacter.ToUpper(CultureInfo.CurrentCulture)))
            {
                var leds = characterLeds[this.DisplayCharacter.ToUpper(CultureInfo.CurrentCulture)];
                foreach (Leds led in leds)
                {
                    this.leds[led].Fill = new SolidColorBrush(this.LedOnColor);
                }
            }
            //show decimal point
            if (PointOn == true)
            {
                this.leds[Leds.PO].Fill = new SolidColorBrush(this.LedOnColor);
            }
        }
        private void ShowError()
        {
            foreach (Path path in this.leds.Values)
            {
                path.Fill = new SolidColorBrush(this.LedOnColor);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected override FrameworkElement ResourceRoot
        {
            get
            {
                return IndicatorLEDs;
            }
        }
    }
}

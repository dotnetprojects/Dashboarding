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

namespace SilverlightApplication.SingleGuages
{
    public partial class Odd6 : UserControl
    {
        public Odd6()
        {
            InitializeComponent();
        }



        private void _inc3_Click(object sender, RoutedEventArgs e)
        {
            _od.Increment(Odometer.IncrementDecrementDigit.Hundreds);
        }

        private void _inc2_Click(object sender, RoutedEventArgs e)
        {
            _od.Increment(Odometer.IncrementDecrementDigit.Tens);
        }

        private void _inc1_Click(object sender, RoutedEventArgs e)
        {
            _od.Increment(Odometer.IncrementDecrementDigit.Units);
        }

        private void _dec3_Click(object sender, RoutedEventArgs e)
        {
            _od.Decrement(Odometer.IncrementDecrementDigit.Hundreds);
        }

        private void _dec2_Click(object sender, RoutedEventArgs e)
        {
            _od.Decrement(Odometer.IncrementDecrementDigit.Tens);
        }

        private void _dec1_Click(object sender, RoutedEventArgs e)
        {
            _od.Decrement(Odometer.IncrementDecrementDigit.Units);
        }
    }
}

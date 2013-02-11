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

namespace SilverlightApplication.SingleGuages
{
    public partial class ThirdStep : UserControl
    {
        public ThirdStep()
        {
            InitializeComponent();
            Loaded += new RoutedEventHandler(IamLoaded);
        }


        void IamLoaded(object sender, RoutedEventArgs e)
        {
            Random random = new Random();
            _dial.Value = random.Next(100);
        }
    }
}

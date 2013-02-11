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
    public partial class BiDiamond2 : UserControl
    {
        public BiDiamond2()
        {
            InitializeComponent();
        }

        private void DiamondSlider_ValueChanged(object sender, DashboardValueChangedEventArgs e)
        {
            if (_t != null)
            {
                _t.Text = String.Format("{0} -> {1} ", e.OldValue, e.NewValue);
            }
        }
    }
}

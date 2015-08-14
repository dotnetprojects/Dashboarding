using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Threading;
using System.Windows.Media;
using System.Collections.Generic;
using System.ComponentModel;
using Codeplex.Dashboarding;

namespace Demos.Common.Demonstrators
{
   

    /// <summary>
    /// Interaction logic for AllControlsDemonstrator.xaml
    /// </summary>
    public partial class WpfGaugeDemonstrator : UserControl, IDisposable
    {
        public WpfGaugeDemonstrator()
        {
            InitializeComponent(); 
 
        }
        

        #region IDisposable Members

        public void Dispose()
        {
        }

        #endregion
    }



    public class WpfGaugeDemo : IDemonstrateDials
    {


        public string DemoName
        {
            get { return "Wpf Gauge Demo"; }
        }


        public UserControl Create()
        {
            return new WpfGaugeDemonstrator();
        }


    }

}

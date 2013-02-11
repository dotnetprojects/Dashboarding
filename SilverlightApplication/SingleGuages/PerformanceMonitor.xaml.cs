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
    public partial class PerformanceMonitor : UserControl
    {
        private Random _random = new Random();
        Storyboard _timer = new Storyboard();
  
        public PerformanceMonitor()
        {
            InitializeComponent();
            _timer.Duration = new Duration(new TimeSpan(0,0, 0, 0, 500));
            _timer.Completed += new EventHandler(timer_Completed);
            Loaded += new RoutedEventHandler(IAmLoaded);

        }

        /// <summary>
        /// On load show value
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void IAmLoaded(object sender, RoutedEventArgs e)
        {
            SetValues();
        }

        /// <summary>
        /// Timer has ticked
        /// </summary>
        void timer_Completed(object sender, EventArgs e)
        {
            SetValues();
        }

        /// <summary>
        /// Set the value and display
        /// </summary>
        private void SetValues()
        {
            _l.Value = _random.Next(100);
            _l2.Value = _random.Next(100);
            _l3.Value = _random.Next(100);
            _timer.Begin();

        }
    }
}

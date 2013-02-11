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
    public partial class RoundLedHr : UserControl
    {
        private Random _random = new Random();
        Storyboard _timer = new Storyboard();



        protected Random Random
        {
            get { return _random; }
        }

        public RoundLedHr()
        {
            _random = new Random();
            InitializeComponent();
            _timer.Duration = new Duration(new TimeSpan(0, 0, 1));
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
            _l0.Value = Random.Next(100);
            _l1.Value = Random.Next(100);
            _l10.Value = Random.Next(100);
            _l11.Value = Random.Next(100);
            _l12.Value = Random.Next(100);
            _l13.Value = Random.Next(100);
            _l14.Value = Random.Next(100);
            _l16.Value = Random.Next(100);
            _l17.Value = Random.Next(100);
            _l18.Value = Random.Next(100);
            _l2.Value = Random.Next(100);
            _l3.Value = Random.Next(100);
            _l4.Value = Random.Next(100);
            _l5.Value = Random.Next(100);
            _l6.Value = Random.Next(100);
            _l7.Value = Random.Next(100);
            _l8.Value = Random.Next(100);
            _l9.Value = Random.Next(100);

            _timer.Begin();
        }

    }
}

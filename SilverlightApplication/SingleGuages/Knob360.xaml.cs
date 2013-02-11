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
    public partial class Knob360 : UserControl
    {
        private Random _random = new Random();
        Storyboard _timer = new Storyboard();

        public Knob360()
        {
            InitializeComponent();
            _timer.Duration = new Duration(new TimeSpan(0, 0, 1));
            _timer.Completed += new EventHandler(timer_Completed);
            Loaded += new RoutedEventHandler(IAmLoaded);

        }

        protected Random Random
        {
            get { return _random; }
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
            _dial0.Value = Random.Next(100);
            _dial1.Value = Random.Next(100);
            _dial2.Value = Random.Next(100);
            _timer.Begin();

        }


    }
}

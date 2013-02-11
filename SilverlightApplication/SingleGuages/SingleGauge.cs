using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Collections.Generic;

namespace SilverlightApplication.SingleGuages
{
    public abstract class SingleGauge: UserControl
    {
        // do we show random data periodically?
        private string AnimateRandomDataParam = "IsRandom";




        private Random _random = new Random();
        Storyboard _timer = new Storyboard();
        private IDictionary<string, string> _parameters;
       


        public SingleGauge(IDictionary<string, string> parameters)
        {
            _parameters = parameters;
            _timer.Duration = new Duration(new TimeSpan(0, 0, 1));
            _timer.Completed += new EventHandler(timer_Completed);
            Loaded += new RoutedEventHandler(IAmLoaded);
            SetValuesFromParameters();
        }

        protected Random Random
        {
            get { return _random; }
        }

   

        /// <summary>
        /// Are we demoing random data?
        /// </summary>
        public bool AnimateRandomData { get; private set; }

        /// <summary>
        /// retrieve data from the parameters passed in from ASP.NET
        /// </summary>
        private void SetValuesFromParameters()
        {
            AnimateRandomData = (_parameters.ContainsKey(AnimateRandomDataParam) && _parameters[AnimateRandomDataParam].Trim().ToLower() == "true");
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
            Animate();
            _timer.Begin();

        }

        /// <summary>
        /// Tell the child control to update animations (used with set randon data)
        /// </summary>
        protected abstract void Animate();
       


    }
}

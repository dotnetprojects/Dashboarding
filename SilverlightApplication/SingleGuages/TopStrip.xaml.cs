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
    public partial class TopStrip : UserControl
    {
        int pos = 0;
        private Random _random = new Random();
        private Storyboard _timer = new Storyboard();
        private BoundObject bo;

        public TopStrip(IDictionary<string, string> parameters)
        {
            InitializeComponent();
            _timer.Duration = new Duration(new TimeSpan(0, 0, 2));
            _timer.Completed += new EventHandler(timer_Completed);
            Loaded += new RoutedEventHandler(IAmLoaded);
            bo = new BoundObject { CurrentValue = 0 };
            DataContext = bo;
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
        /// Display the control according the the current value
        /// </summary>
        protected void Animate()
        {
            bo.CurrentValue = _random.Next(100);

            if (pos == 0)
            {
                _tickCross.Value = _random.Next(100);
                _roundLed.Value = _random.Next(100);




            }
            _dvu1.Value = _random.Next(100);
            _dvu2.Value = _random.Next(100);
            _dvu3.Value = _random.Next(100);


            _perf.Value = _random.Next(100);


                  _prog1.Value = _random.Next(100);
      

            string  t = DateTime.Now.ToString("hhmmsstt");

            _sH1.DisplayCharacter = "" + t[0];
            _sH2.DisplayCharacter = "" + t[1];
            _sM1.DisplayCharacter = "" + t[2];
            _sM2.DisplayCharacter = "" + t[3];
            
                       _odometer.Increment();



            pos++;
            if (pos == 4)
                pos = 0;
        }

       
    }
}

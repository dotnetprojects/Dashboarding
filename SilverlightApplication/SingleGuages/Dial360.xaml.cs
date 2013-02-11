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
    public partial class Dial360 : SingleGauge
    {
        public Dial360(IDictionary<string, string> parameters): base(parameters)
        {
            InitializeComponent();
        }

        /// <summary>
        /// Display the control according the the current value
        /// </summary>
        protected override void Animate()
        {
            if (AnimateRandomData)
            {

                _dial0.Value = Random.Next(100);
                _dial1.Value = Random.Next(100);
                _dial2.Value = Random.Next(100);

            }
        }
    }
}

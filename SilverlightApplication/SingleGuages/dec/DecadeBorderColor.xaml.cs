﻿using System;
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

namespace SilverlightApplication.SingleGuages.dec
{
    public partial class DecadeBorderColor : SingleGauge
    {
        public DecadeBorderColor(IDictionary<string, string> parameters): base(parameters)
        {
            InitializeComponent();
        }

        protected override void Animate()
        {
            if (AnimateRandomData)
            {
                
                _a.Value = Random.Next(100);
               
            }
        }
    }
}

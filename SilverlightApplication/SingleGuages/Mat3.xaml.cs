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
    public partial class Mat3 : UserControl
    {
        /// <summary>
        /// Our messages, we will continuously rotate through them
        /// </summary>
        List<string> Messages = new List<string>
        {
            "Message one",
            "Message two",
            "Message three"
        };

        /// <summary>
        /// Constructs a Mat3
        /// </summary>
        public Mat3()
        {
            InitializeComponent();

            Loaded += new RoutedEventHandler(IAmLoaded);
        }

        /// <summary>
        /// Control is loaded set the first message
        /// </summary>
        void IAmLoaded(object sender, RoutedEventArgs e)
        {
            SetNextMessage();
        }

        /// <summary>
        /// Marquee has finished animating, get the next message going
        /// </summary>
        private void _marq_MarqueeFinished(object sender, EventArgs e)
        {
            SetNextMessage();
        }

        int _message = 0;
        /// <summary>
        /// Sets the next message and puts a little place holder between em
        /// </summary>
        private void SetNextMessage()
        {
            _marq.Text = Messages[_message] + " * ";
            _message += 1;
            if (_message > Messages.Count -1 )
            {
                _message = 0;
            }
        }
       
    }
}

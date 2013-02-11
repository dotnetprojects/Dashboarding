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
using System.ComponentModel;

namespace SilverlightApplication.SingleGuages
{
    public partial class FourthStep : UserControl
    {
        public FourthStep()
        {
            InitializeComponent();
            Loaded += new RoutedEventHandler(IAmLoaded);
        }

        void IAmLoaded(object sender, RoutedEventArgs e)
        {

            Car porsche = new Car { MilesPerHour = 99 };
            _dial.DataContext = porsche;
        }
    }

    /// <summary>
    /// Class representing a car  and its velocity
    /// </summary>
    public class Car : DependencyObject, INotifyPropertyChanged
    {
        /// <summary>
        /// raised when a property changed
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// dependancy property for MilesPerHour
        /// </summary>
        public static readonly DependencyProperty MilesPerHourProperty =
            DependencyProperty.Register("MilesPerHour",
                                        typeof(double), typeof(Car),
                                        new PropertyMetadata(new PropertyChangedCallback(MilesPerHourPropertyChanged)));

        /// <summary>
        /// Speed in Miles per hour 
        /// </summary>
        public double MilesPerHour
        {
            get { return (double)GetValue(MilesPerHourProperty); }
            set { SetValue(MilesPerHourProperty, value); }
        }

        /// <summary>
        /// Dependancy property changed, raise the PropertyChanged event
        /// </summary>
        /// <param name="dependancy"></param>
        /// <param name="args"></param>
        private static void MilesPerHourPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            Car instance = dependancy as Car;
            if (instance != null)
            {
                instance.OnPropertyChanged("MilesPerHour");
            }
        }

        /// <summary>
        /// Property has changed lets inform the waiting world
        /// </summary>
        /// <param name="prop"></param>
        private void OnPropertyChanged(string prop)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
            }
        }
    }

}

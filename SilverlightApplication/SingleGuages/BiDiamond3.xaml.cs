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
    /// <summary>
    /// Class used to demonstrate two way data binding
    /// </summary>
    public partial class BiDiamond3 : UserControl
    {
        public BiDiamond3()
        {
            InitializeComponent();
            BoundObject bo = new BoundObject { CurrentValue = 25 };
            DataContext = bo;
        }

        /// <summary>
        /// Show we are two way
        /// </summary>
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            BoundObject bo = DataContext as BoundObject;
            bo.CurrentValue = 50;
        }
    }

    /// <summary>
    /// Class to do an example binding
    /// </summary>
    public class BoundObject : INotifyPropertyChanged
    {
        private double _currentValue;

        /// <summary>
        /// Current vlaue property, raises the on property changed event
        /// </summary>
        public double CurrentValue
        {
            get { return _currentValue; }
            set 
            { 
                _currentValue = value;
                OnPropertyChanged("CurrentValue");
            }
        }
            
        #region INotifyPropertyChanged Members

        /// <summary>
        /// One of my properties has changed
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// Notify any listeners that a property has changed
        /// </summary>
        /// <param name="propName">Name of the property</param>
        protected virtual void OnPropertyChanged(string propName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propName));
            }
        }

        #endregion
    }
}

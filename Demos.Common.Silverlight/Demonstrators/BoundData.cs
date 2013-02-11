using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Windows.Media;
using System.Windows;
using Codeplex.Dashboarding;

namespace Demos.Common.Demonstrators
{
    /// <summary>
    /// Class to do an example binding
    /// </summary>
    public class BoundObject : INotifyPropertyChanged
    {
        private double _currentValue;
        private double _minValue = 0;
        private double _maxValue = 100;
        private bool _isBidirectional;
        private TimeSpan _animationDuration = new TimeSpan(0,0,0,0,750);
        private ColorPointCollection _faceColorRange;
        private ColorPointCollection _needleColorRange;

        #region face text properties
        private Visibility _faceTextVisible;
        private Color _faceTextColor;
        private string _faceTextFormat;

        /// <summary>
        /// Gets or sets the face text format.
        /// </summary>
        /// <value>The face text format.</value>
        public string FaceTextFormat
        {
            get { return _faceTextFormat; }
            set { _faceTextFormat = value; OnPropertyChanged("FaceTextFormat"); }
        }

        /// <summary>
        /// Gets or sets the color of the face text.
        /// </summary>
        /// <value>The color of the face text.</value>
        public Color FaceTextColor
        {
            get { return _faceTextColor; }
            set { _faceTextColor = value; OnPropertyChanged("FaceTextColor"); }
        }

        /// <summary>
        /// Gets or sets the face text visiblity.
        /// </summary>
        /// <value>The face text visiblity.</value>
       public Visibility FaceTextVisibility
        {
            get { return _faceTextVisible; }
            set { _faceTextVisible = value; OnPropertyChanged("FaceTextVisibility"); }
        }
        #endregion

        #region value text properties
        private Visibility _valueTextVisible;
        private Color _valueTextColor;
        private string _valueTextFormat;

        /// <summary>
        /// Gets or sets the value text format.
        /// </summary>
        /// <value>The value text format.</value>
        public string ValueTextFormat
        {
            get { return _valueTextFormat; }
            set { _valueTextFormat = value; OnPropertyChanged("ValueTextFormat"); }
        }

        /// <summary>
        /// Gets or sets the color of the value text.
        /// </summary>
        /// <value>The color of the value text.</value>
        public Color ValueTextColor
        {
            get { return _valueTextColor; }
            set { _valueTextColor = value; OnPropertyChanged("ValueTextColor"); }
        }


        /// <summary>
        /// Gets or sets the value text visible.
        /// </summary>
        /// <value>The value text visible.</value>
        public Visibility ValueTextVisibility
        {
            get { return _valueTextVisible; }
            set { _valueTextVisible = value; OnPropertyChanged("ValueTextVisibility"); }
        }
        #endregion

  

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

        /// <summary>
        /// Gets or sets a value indicating whether this instance is bidirectional.
        /// </summary>
        /// <value>
        /// 	<c>true</c> if this instance is bidirectional; otherwise, <c>false</c>.
        /// </value>
        public bool IsBidirectional
        {
            get { return _isBidirectional; }
            set { _isBidirectional = value; OnPropertyChanged("IsBidirectional");}
        }

        /// <summary>
        /// Gets or sets the min value.
        /// </summary>
        /// <value>The min value.</value>
        public double Minimum
        {
            get { return _minValue; }
            set
            {
                _minValue = value;
                OnPropertyChanged("Minimum");
            }

        }

        /// <summary>
        /// Gets or sets the max value.
        /// </summary>
        /// <value>The max value.</value>
        public double Maximum
        {
            get { return _maxValue; }
            set
            {
                _maxValue = value;
                OnPropertyChanged("Maximum");
            }

        }

        /// <summary>
        /// Gets or sets the duration of the animation.
        /// </summary>
        /// <value>The duration of the animation.</value>
        public TimeSpan AnimationDuration
        {
            get { return _animationDuration; }
            set { _animationDuration = value; OnPropertyChanged("AnimationDuration"); }
        }



        public ColorPointCollection FaceColorRange
        {
            get { return _faceColorRange; }
            set { _faceColorRange = value; OnPropertyChanged("FaceColorRange"); }
        }
        
        public ColorPointCollection NeedleColorRange
        {
            get { return _needleColorRange; }
            set { _needleColorRange = value; OnPropertyChanged("NeedleColorRange"); }
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

        internal static BoundObject Create(Color textColor)
        {
            return new BoundObject
            {
                CurrentValue = 50,
                FaceTextColor = textColor,
                FaceTextFormat = "{0:0}",
                FaceTextVisibility = Visibility.Visible,
                ValueTextColor = textColor,
                ValueTextFormat = "{0:0}",
                ValueTextVisibility = Visibility.Visible,
                FaceColorRange = new ColorPointCollection(),
                NeedleColorRange = new ColorPointCollection()
            };
        }
    }
}

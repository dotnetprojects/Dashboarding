using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;

namespace WpfGauge
{
    /// <summary>
    /// Interaction logic for TickMarker.xaml
    /// </summary>
    public partial class TickMarker : UserControl, INotifyPropertyChanged
    {
        #region Dependency Properties

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty TickLabelStyleProperty =
            DependencyProperty.Register("TickLabelStyle", typeof(Style), typeof(TickMarker),
            new PropertyMetadata(Defaults.DefaultTickLabelStyle, OnTickLabelStyleChanged));

        private static void OnTickLabelStyleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var t = d as TickMarker;
            var o = t.TickLabelStyle;
        }

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty TickMarkColorProperty =
            DependencyProperty.Register("TickMarkColor", typeof(Brush), typeof(TickMarker),
            new PropertyMetadata(new SolidColorBrush(Colors.White)));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty LineMarginProperty =
            DependencyProperty.Register("LineMargin", typeof(Thickness), typeof(TickMarker),
            new PropertyMetadata(new Thickness(0,0,0,0)));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty LabelMarginProperty =
            DependencyProperty.Register("LabelMargin", typeof(Thickness), typeof(TickMarker),
            new PropertyMetadata(new Thickness(0, 20, 0, 0)));

        #endregion Dependency Properties

        #region Private Vars

        private double _labelAngle;
        private string _label;
        private double _angle;
        private double _strokeThickness;
        private double _lineHeight;

        #endregion Private Vars

        #region Public Vars

        /// <summary>
        /// 
        /// </summary>
        public Thickness LineMargin
        {
            get { return (Thickness)base.GetValue(LineMarginProperty); }
            set { base.SetValue(LineMarginProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Thickness LabelMargin
        {
            get { return (Thickness)base.GetValue(LabelMarginProperty); }
            set { base.SetValue(LabelMarginProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Style TickLabelStyle
        {
            get { return (Style)base.GetValue(TickLabelStyleProperty); }
            set { base.SetValue(TickLabelStyleProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Brush TickMarkColor
        {
            get { return (Brush)base.GetValue(TickMarkColorProperty); }
            set { base.SetValue(TickMarkColorProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double LabelAngle
        {
            get { return _labelAngle; }
            set
            {
                _labelAngle = value;
                this.OnPropertyChanged("LabelAngle");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Label
        {
            get { return _label; }
            set
            {
                _label = value;
                this.OnPropertyChanged("Label");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public double Angle
        {
            get { return _angle; }
            set
            {
                _angle = value;
                this.OnPropertyChanged("Angle");
                this.LabelAngle = value - 90;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public double StrokeThickness
        {
            get { return _strokeThickness; }
            set
            {
                _strokeThickness = value;
                this.OnPropertyChanged("StrokeThickness");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public double LineHeight
        {
            get { return _lineHeight; }
            set
            {
                _lineHeight = value;
                this.OnPropertyChanged("LineHeight");
                this.LineMargin = new Thickness(55 - this.LineHeight, 0, 0, 0);
            }
        }

        #endregion Public Vars

        /// <summary>
        /// 
        /// </summary>
        public TickMarker()
        {
            InitializeComponent();
        }

        #region INotifyPropertyChanged

        /// <summary>
        /// 
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="propertyName"></param>
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;

            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        #endregion INotifyPropertyChanged

    }
}

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
    /// Interaction logic for GoalMarker.xaml
    /// </summary>
    public partial class GoalMarker : UserControl
    {
        internal Gauge ParentGauge { get; set; }

        #region Dependency Properties

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty ValueProperty =
            DependencyProperty.Register("Value", typeof(double), typeof(GoalMarker), new PropertyMetadata(OnValueChanged));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty AngleProperty =
            DependencyProperty.Register("Angle", typeof(double), typeof(GoalMarker), new PropertyMetadata(0.0));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty GaugeMaxProperty =
            DependencyProperty.Register("GaugeMax", typeof(double), typeof(GoalMarker), new PropertyMetadata(0.0));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty GaugeStartAngleProperty =
            DependencyProperty.Register("GaugeStartAngle", typeof(double), typeof(GoalMarker), new PropertyMetadata(0.0));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty GaugeEndAngleProperty =
            DependencyProperty.Register("GaugeEndAngle", typeof(double), typeof(GoalMarker), new PropertyMetadata(0.0));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty MarkerWidthProperty =
            DependencyProperty.Register("MarkerWidth", typeof(double), typeof(GoalMarker), new PropertyMetadata(10.0d));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty MarkerHeightProperty =
            DependencyProperty.Register("MarkerHeight", typeof(double), typeof(GoalMarker), new PropertyMetadata(10.0d));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty MarkerColorProperty =
            DependencyProperty.Register("MarkerColor", typeof(Brush), typeof(GoalMarker), new PropertyMetadata(new SolidColorBrush(Colors.Orange)));

        /// <summary>
        /// 
        /// </summary>
        public static DependencyProperty TitleProperty =
            DependencyProperty.Register("Title", typeof(string), typeof(GoalMarker), new PropertyMetadata(null));

        private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var goal = d as GoalMarker;

            goal.ParentGauge.UpdateAngle();

            // Update the Angle Property
            var v = (double)e.NewValue;
            var valueInPercent = v / goal.GaugeMax;
            var valueInDegrees = valueInPercent * (goal.GaugeEndAngle - goal.GaugeStartAngle) + goal.GaugeStartAngle;
            goal.Angle = valueInDegrees;
        }

        #endregion Dependency Properties

        #region Public Vars

        /// <summary>
        /// 
        /// </summary>
        public double Value
        {
            get { return (double)base.GetValue(ValueProperty); }
            set { base.SetValue(ValueProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double Angle
        {
            get { return (double)base.GetValue(AngleProperty); }
            set { base.SetValue(AngleProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double GaugeMax
        {
            get { return (double)base.GetValue(GaugeMaxProperty); }
            set { base.SetValue(GaugeMaxProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double GaugeStartAngle
        {
            get { return (double)base.GetValue(GaugeStartAngleProperty); }
            set { base.SetValue(GaugeStartAngleProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double GaugeEndAngle
        {
            get { return (double)base.GetValue(GaugeEndAngleProperty); }
            set { base.SetValue(GaugeEndAngleProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double MarkerWidth
        {
            get { return (double)base.GetValue(MarkerWidthProperty); }
            set { base.SetValue(MarkerWidthProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public double MarkerHeight
        {
            get { return (double)base.GetValue(MarkerHeightProperty); }
            set { base.SetValue(MarkerHeightProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Brush MarkerColor
        {
            get { return (Brush)base.GetValue(MarkerColorProperty); }
            set { base.SetValue(MarkerColorProperty, value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Title
        {
            get { return (string)base.GetValue(TitleProperty); }
            set { base.SetValue(TitleProperty, value); }
        }

        #endregion Public Vars

        /// <summary>
        /// 
        /// </summary>
        public GoalMarker()
        {
            InitializeComponent();
        }
    }
}

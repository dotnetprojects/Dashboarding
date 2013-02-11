using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Codeplex.Dashboarding;
using Demos.Common.Util;

namespace Demos.Common.Demonstrators
{
    /// <summary>
    /// Interaction logic for ColorRangeExperimenter.xaml
    /// </summary>
    public partial class ColorRangeExperimenter : UserControl
    {

        public ColorRangeExperimenter()
        {
            InitializeComponent();

        }

        public string Title
        {
            get { return _rangeName.Text; }
            set { _rangeName.Text = value; }
        }


        public ColorPointCollection Points
        {
            get { return (ColorPointCollection)GetValue(PointsProperty); }
            set { SetValue(PointsProperty, value); _lister.ItemsSource = value; }
        }

        // Using a DependencyProperty as the backing store for Points.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty PointsProperty =
            DependencyProperty.Register("Points", typeof(ColorPointCollection), typeof(ColorRangeExperimenter), new PropertyMetadata(new ColorPointCollection(), new PropertyChangedCallback(PointsPropertyChanged)));

        private static void PointsPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            ColorRangeExperimenter instance = dependancy as ColorRangeExperimenter;
            if (instance != null)
            {
                instance.Points = (ColorPointCollection)args.NewValue;
            }
       }

        


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            double maxValue = Points.Count > 0 ? Points.Max(o => o.Value) : -1;
            ColorPoint col = new ColorPoint { Value = maxValue + 1, LowColor = Colors.Black, HiColor = Colors.White };
            Points.Add(col);
            _lister.SelectedItem = col;
        }

        private ColorPoint _editingColorPoint;


        private void piclLowColor_Click(object sender, RoutedEventArgs e)
        {
            Button b = sender as Button;

            _editingColorPoint = b.DataContext as ColorPoint;
            PopupColorPicker.Instance.SelectedColor = _editingColorPoint.LowColor;
            PopupColorPicker.Instance.ColorChanged += new PopupColorPicker.ColorChangedEventHandler(LowColorChanged);
            PopupColorPicker.Instance.Show();
        }

        void LowColorChanged(object sender, ColorSelectedEventargs e)
        {
            _editingColorPoint.LowColor = e.Color;
        }

        private void PickHighColor_Click(object sender, RoutedEventArgs e)
        {
            Button b = sender as Button;
            _editingColorPoint = b.DataContext as ColorPoint;
            PopupColorPicker.Instance.SelectedColor = _editingColorPoint.HiColor;
            PopupColorPicker.Instance.ColorChanged += new PopupColorPicker.ColorChangedEventHandler(HighColorChanged);
            PopupColorPicker.Instance.Show();
        }

        void HighColorChanged(object sender, ColorSelectedEventargs e)
        {   
            _editingColorPoint.HiColor = e.Color;
        }

        private void _deletePoint_Click(object sender, RoutedEventArgs e)
        {
            Button b = sender as Button;
            _editingColorPoint = b.DataContext as ColorPoint;
            Points.Remove(_editingColorPoint);
        }
    }
}

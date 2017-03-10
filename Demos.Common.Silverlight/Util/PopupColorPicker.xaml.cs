using System;
using System.Windows;
using System.Windows.Media;

namespace Demos.Common.Util
{
    public partial class PopupColorPicker 
    {
        public delegate void ColorChangedEventHandler(object sender, ColorSelectedEventargs e);

        private ColorChangedEventHandler _lastMethod;

        private Color _selectedColor;

        public PopupColorPicker()
        {
            InitializeComponent();
            Loaded += AmLoaded;
        }

        public static PopupColorPicker Instance { get; set; }

        public Color SelectedColor
        {
            get { return _selectedColor; }
            set
            {
                _selectedColor = value;
                _picker.BaseHue = new SolidColorBrush(value);
            }
        }

        private void AmLoaded(object sender, RoutedEventArgs e)
        {
            if (_picker != null)
                _picker.ColorChanged += PickerColorChanged;
        }

        private void PickerColorChanged(object sender, ColorChangedEventArgs e)
        {
            _selectedColor = e.NewColor.Color;
        }

        public event EventHandler<EventArgs> Closed;

        // ReSharper disable once UnusedMember.Local
        private void OnClose()
        {
            Closed?.Invoke(this, EventArgs.Empty);
        }

        private void ButtonOk_Click(object sender, RoutedEventArgs e)
        {
            Visibility = Visibility.Collapsed;
            OnColorSelected(_picker.SelectedColor.Color);
        }

        private void ButtonCancel_Click(object sender, RoutedEventArgs e)
        {
            Visibility = Visibility.Collapsed;
            if (ColorChangedEvent != null)
            {
                ColorChangedEvent -= _lastMethod;
            }
        }

        private event ColorChangedEventHandler ColorChangedEvent;


        public event ColorChangedEventHandler ColorChanged
        {
            add
            {
                ColorChangedEvent += value;
                _lastMethod = value;
            }
            remove { ColorChangedEvent -= value; }
        }

        protected virtual void OnColorSelected(Color c)
        {
            if (ColorChangedEvent != null)
            {
                ColorChangedEvent(this, new ColorSelectedEventargs {Color = c});
                ColorChangedEvent -= _lastMethod;
            }
        }


        public void Show()
        {
            Visibility = Visibility.Visible;
        }
    }
}
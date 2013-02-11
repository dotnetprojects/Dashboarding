using System.Windows;
using System.Windows.Controls;
using Demos.Common.Util;
using System;

namespace Demos.Common.Demonstrators
{
    /// <summary>
    /// Interaction logic for Experimenter.xaml
    /// </summary>
    public partial class Experimenter : UserControl
    {
        public Experimenter()
        {
            InitializeComponent();

        }

        #region firest color range visibility
        public static readonly DependencyProperty FirstColorRangeVisibilityProperty =
     DependencyProperty.Register("FirstColorRangeVisibility", typeof(Visibility), typeof(Experimenter), new PropertyMetadata(Visibility.Visible, new PropertyChangedCallback(FirstColorRangeVisibilityPropertyChanged)));


        private static void FirstColorRangeVisibilityPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            Experimenter instance = dependancy as Experimenter;
            if (instance != null)
            {
                instance._colorRange1.Visibility = instance.FirstColorRangeVisibility;
            }
        }

        public Visibility FirstColorRangeVisibility
        {
            get { return (Visibility)GetValue(FirstColorRangeVisibilityProperty); }
            set { SetValue(FirstColorRangeVisibilityProperty, value); }
        }
        #endregion

        #region firest color range title
        public static readonly DependencyProperty FirstColorRangeTitleProperty =
     DependencyProperty.Register("FirstColorRangeTitle", typeof(string), typeof(Experimenter), new PropertyMetadata(String.Empty, new PropertyChangedCallback(FirstColorRangeTitlePropertyChanged)));


        private static void FirstColorRangeTitlePropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            Experimenter instance = dependancy as Experimenter;
            if (instance != null)
            {
                instance._colorRange1.Title = instance.FirstColorRangeTitle;
            }
        }

        public string FirstColorRangeTitle
        {
            get { return (string)GetValue(FirstColorRangeTitleProperty); }
            set { SetValue(FirstColorRangeTitleProperty, value); }
        }
        #endregion


        #region second color range visibility
        public static readonly DependencyProperty SecondColorRangeVisibilityProperty =
     DependencyProperty.Register("SecondColorRangeVisibility", typeof(Visibility), typeof(Experimenter), new PropertyMetadata(Visibility.Visible, new PropertyChangedCallback(SecondColorRangeVisibilityPropertyChanged)));


        private static void SecondColorRangeVisibilityPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            Experimenter instance = dependancy as Experimenter;
            if (instance != null)
            {
                instance._colorRange2.Visibility = instance.SecondColorRangeVisibility;
            }
        }

        public Visibility SecondColorRangeVisibility
        {
            get { return (Visibility)GetValue(SecondColorRangeVisibilityProperty); }
            set { SetValue(SecondColorRangeVisibilityProperty, value); }
        }
        #endregion

        #region firest color range title
        public static readonly DependencyProperty SecondColorRangeTitleProperty =
     DependencyProperty.Register("SecondColorRangeTitle", typeof(string), typeof(Experimenter), new PropertyMetadata(String.Empty, new PropertyChangedCallback(SecondColorRangeTitlePropertyChanged)));


        private static void SecondColorRangeTitlePropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
        {
            Experimenter instance = dependancy as Experimenter;
            if (instance != null)
            {
                instance._colorRange1.Title = instance.SecondColorRangeTitle;
            }
        }

        public string SecondColorRangeTitle
        {
            get { return (string)GetValue(SecondColorRangeTitleProperty); }
            set { SetValue(SecondColorRangeTitleProperty, value); }
        }
        #endregion



        private void _buttonClangeFaceTextColor_Click(object sender, RoutedEventArgs e)
        {
            BoundObject bo = DataContext as BoundObject;
            PopupColorPicker.Instance.SelectedColor = bo.FaceTextColor;
            PopupColorPicker.Instance.ColorChanged += new PopupColorPicker.ColorChangedEventHandler(FaceColorChanged);
            PopupColorPicker.Instance.Show();
        }

        void FaceColorChanged(object sender, ColorSelectedEventargs e)
        {
            BoundObject bo = DataContext as BoundObject;
            bo.FaceTextColor = e.Color;
        }


        private void _buttonClangeValueTextColor_Click(object sender, RoutedEventArgs e)
        {
            BoundObject bo = DataContext as BoundObject;
            PopupColorPicker.Instance.SelectedColor = bo.ValueTextColor;
            PopupColorPicker.Instance.ColorChanged += new PopupColorPicker.ColorChangedEventHandler(ValueColorChanged);
            PopupColorPicker.Instance.Show();
        }

        void ValueColorChanged(object sender, ColorSelectedEventargs e)
        {
            BoundObject bo = DataContext as BoundObject;
            bo.ValueTextColor = e.Color;
        }
    }
}

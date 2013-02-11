using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Data;
using System.Windows;

namespace Demos.Common.Demonstrators
{
    public class VisibilityToBooleanConverter : IValueConverter
    {
        #region IValueConverter Members

        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            Visibility? b = (Visibility)value;
            if (b.HasValue && b.Value == Visibility.Visible)
            {
                return true;
            }
            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            bool? b = (bool)value;
            if (b.HasValue && b.Value == true)
            {
                return Visibility.Visible;
            }
            return Visibility.Collapsed;
        }

        #endregion
    }
}

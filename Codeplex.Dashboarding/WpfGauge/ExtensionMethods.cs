using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

namespace WpfGauge
{
    /// <summary>
    /// 
    /// </summary>
    public static class ExtensionMethods
    {
        internal static void SetBinding(this DependencyObject sourceObject, DependencyObject targetObject, DependencyProperty sourceProperty, DependencyProperty targetProperty)
        {
            Binding b = new Binding();
            b.Source = sourceObject;
            b.Path = new PropertyPath(sourceProperty);
            BindingOperations.SetBinding(targetObject, targetProperty, b);
        }

        internal static double GetGaugeTop(this double input)
        {
            var value = input;
            bool isNegative = false;
            // Determine if the value is +/-
            if (value < 0)
                isNegative = true;

            value = Math.Abs(value);

            var values = Global.GaugeTopValues;

            int result = Array.BinarySearch(values, value);
            if (result < 0)
                result = ~result;
            
            if (isNegative)
                return (-1) * values[result];
            return values[result];
        }
    }
}

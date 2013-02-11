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
using Demos.Common.Demonstrators;
using Demos.Common.Util;
using System.Reflection;

namespace Demo.App.Wpf
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        List<IDemonstrateDials> _demonstrations = new List<IDemonstrateDials>();

        /// <summary>
        /// Initializes a new instance of the <see cref="Window1"/> class.
        /// </summary>
        public Window1()
        {
            InitializeComponent();
            _demonstrations = DemonstratorDiscovery.FindDemonstrators();
            InitializeDemonstaratorSelection();
            PopupColorPicker.Instance = _colorPicker;
        }

        /// <summary>
        /// Initializes the demonstrator selection control.
        /// </summary>
        private void InitializeDemonstaratorSelection()
        {
            _select.ItemsSource = _demonstrations;
            _select.SelectionChanged += new SelectionChangedEventHandler(DemoSelected);
            _select.SelectedIndex = 0;
        }

        /// <summary>
        /// A demo has been selected display it
        /// /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="System.Windows.Controls.SelectionChangedEventArgs"/> instance containing the event data.</param>
        void DemoSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.AddedItems.Count > 0)
            {

                _contentPanel.Children.Clear();
                _contentPanel.Children.Add(((IDemonstrateDials)e.AddedItems[0]).Create());
            }
        }

    }
}

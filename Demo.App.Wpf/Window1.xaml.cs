using System.Collections.Generic;
using System.Windows.Controls;
using Demos.Common.Demonstrators;
using Demos.Common.Util;

namespace Demo.App.Wpf
{
    /// <summary>
    ///     Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1
    {
        private readonly List<IDemonstrateDials> _demonstrations;

        /// <summary>
        ///     Initializes a new instance of the <see cref="Window1" /> class.
        /// </summary>
        public Window1()
        {
            InitializeComponent();
            _demonstrations = DemonstratorDiscovery.FindDemonstrators();
            InitializeDemonstaratorSelection();
            PopupColorPicker.Instance = _colorPicker;
        }

        /// <summary>
        ///     Initializes the demonstrator selection control.
        /// </summary>
        private void InitializeDemonstaratorSelection()
        {
            _select.ItemsSource = _demonstrations;
            _select.SelectionChanged += DemoSelected;
            _select.SelectedIndex = 0;
        }

        /// <summary>
        ///     A demo has been selected display it
        ///     ///
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">
        ///     The <see cref="System.Windows.Controls.SelectionChangedEventArgs" /> instance containing the event
        ///     data.
        /// </param>
        private void DemoSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.AddedItems.Count > 0)
            {
                _contentPanel.Children.Clear();
                _contentPanel.Children.Add(((IDemonstrateDials) e.AddedItems[0]).Create());
            }
        }
    }
}
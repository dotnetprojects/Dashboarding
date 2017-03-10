/* •——————————————————————————————————————————————————————————————————————————————————————————•
   | This really useful color picker was sourced from the blog:                               |
   |    Matthias Shapiro’s WPF & Silverlight Blog - Because Developers Get All The Good Blogs |
   |    at: http://www.designerwpf.com/category/colorpicker/                                  |
   | and is copyright 2008-2009 Matthias Shapiro.                                             |
   •——————————————————————————————————————————————————————————————————————————————————————————• */


using System;
using System.Diagnostics.CodeAnalysis;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace Demos.Common.Util
{
    [SuppressMessage("ReSharper", "UnusedMember.Local")]
    public partial class ColorPicker 
    {
        private SolidColorBrush _baseHueProperty;
        private double _colorCanvasXProperty;
        private double _colorCanvasYProperty;
        private bool _isCompactProperty;
        private bool _isMouseDownOnCanvas;
        private bool _isMouseDownOnRainbow;

        private SolidColorBrush _selectedColorProperty;


        public ColorPicker()
        {
            InitializeComponent();

            _colorCanvasXProperty = 1;
            ColorCanvasY = 1;
            _isMouseDownOnCanvas = false;
            UpdateLayout();
            if (RainbowBorder.ActualWidth > 1)
                RainbowHandle.Width = RainbowBorder.ActualWidth - 1;
        }

        private void TurnEverythingOff(object sender, MouseButtonEventArgs e)
        {
            _isMouseDownOnRainbow = false;
            _isMouseDownOnCanvas = false;
        }

        #region ColorChanged Event code

        private event ColorChangedEventHandler ColorChangedEvent;

        public event ColorChangedEventHandler ColorChanged
        {
            add { ColorChangedEvent += value; }
            remove { ColorChangedEvent -= value; }
        }

        protected virtual void OnColorChanged(ColorChangedEventArgs e)
        {
            ColorChangedEvent?.Invoke(this, e);
        }

        #endregion

        #region Dependency Properties

        private double ColorCanvasX
        {
            get { return _colorCanvasXProperty; }
            set
            {
                _colorCanvasXProperty = value;
                UpdateSelectedColor();
            }
        }

        private double ColorCanvasY
        {
            get { return _colorCanvasYProperty; }
            set
            {
                _colorCanvasYProperty = value;
                UpdateSelectedColor();
            }
        }

        internal SolidColorBrush BaseHue
        {
            get { return _baseHueProperty; }
            set
            {
                _baseHueProperty = value;
                UpdateSelectedColor();
                if (BackgroundCanvas != null)
                {
                    BackgroundCanvas.Background = _baseHueProperty;
                }
            }
        }

        public bool IsCompact
        {
            get { return _isCompactProperty; }
            set
            {
                _isCompactProperty = value;
                if (LayoutRoot != null)
                {
                    CompactLayoutChange(value);
                }
            }
        }

        private void CompactLayoutChange(bool compactChange)
        {
            var oldColorPosition = new Point(Canvas.GetLeft(FinalColor),
                Canvas.GetTop(FinalColor));
            var oldHuePosition = new Point(0.0,
                Canvas.GetTop(RainbowHandle));
            var oldColorCanvasSize = new Size(ColorCanvas.ActualWidth,
                ColorCanvas.ActualHeight);
            var oldHueCanvasSize = new Size(HueCanvas.ActualWidth,
                HueCanvas.ActualHeight);

            if (compactChange)
            {
                LargePanel.Visibility = Visibility.Collapsed;
                CompactPanel.Visibility = Visibility.Visible;
                rightColumn.MinWidth = 0;
                RootControl.MinHeight = 0;
                RootControl.MinWidth = 0;
                RootControl.Width = 130;
                RootControl.Height = 200;
            }
            else
            {
                LargePanel.Visibility = Visibility.Visible;
                CompactPanel.Visibility = Visibility.Collapsed;
                rightColumn.MinWidth = 90;
                RootControl.Height = double.NaN;
                RootControl.Width = double.NaN;
                RootControl.MinHeight = 190;
                RootControl.MinWidth = 240;
            }
            UpdateLayout();

            RealignElement(oldColorPosition,
                oldColorCanvasSize,
                new Size(ColorCanvas.ActualWidth, ColorCanvas.ActualHeight),
                FinalColor);
            RealignElement(oldHuePosition,
                oldHueCanvasSize,
                new Size(HueCanvas.ActualWidth, HueCanvas.ActualHeight),
                RainbowHandle);

            if (RainbowBorder.ActualWidth > 1)
                RainbowHandle.Width = RainbowBorder.ActualWidth - 1;
        }

        private void RealignElement(Point oldPosition,
            Size oldCanvasSize,
            Size newCanvasSize,
            UIElement elementToRealign)
        {
            //OK... so we find the old size and the old position, turn them into a
            // percentage an apply the new position based on the new size
            if ((Math.Abs(oldCanvasSize.Width) > 0.01) && (Math.Abs(oldCanvasSize.Height) > 0.01))
            {
                var relativeX = oldPosition.X/oldCanvasSize.Width;
                var relativeY = oldPosition.Y/oldCanvasSize.Height;

                Canvas.SetLeft(elementToRealign, newCanvasSize.Width*relativeX);
                Canvas.SetTop(elementToRealign, newCanvasSize.Height*relativeY);
            }
        }

        public SolidColorBrush SelectedColor
        {
            get { return _selectedColorProperty; }
            set
            {
                _selectedColorProperty = value;

                if (resultCanvas != null)
                {
                    resultCanvas.Background = _selectedColorProperty;
                }
            }
        }

        #endregion

        #region Update Color methods

        protected void UpdateSelectedColor()
        {
            if (_baseHueProperty == null)
            {
                UpdateColorCanvas(150, 0);
            }

            if (_baseHueProperty != null)
            {
                var baseColor = _baseHueProperty.Color;

                var newColor = new Color();
                if (_colorCanvasXProperty > 1.0)
                {
                    _colorCanvasXProperty = 1.0;
                }

                if (_colorCanvasYProperty > 1.0)
                {
                    _colorCanvasYProperty = 1.0;
                }

                newColor.R = Convert.ToByte(_colorCanvasYProperty*(baseColor.R + (255 - baseColor.R)*_colorCanvasXProperty));
                newColor.G = Convert.ToByte(_colorCanvasYProperty*(baseColor.G + (255 - baseColor.G)*_colorCanvasXProperty));
                newColor.B = Convert.ToByte(_colorCanvasYProperty*(baseColor.B + (255 - baseColor.B)*_colorCanvasXProperty));

                newColor.A = 255;

                var updatedColor = new SolidColorBrush(newColor);

                OnColorChanged(new ColorChangedEventArgs(SelectedColor, updatedColor));

                SelectedColor = new SolidColorBrush(newColor);

                if (CopyColorText != null)
                {
                    RedText.Text = newColor.R.ToString();
                    GreenText.Text = newColor.G.ToString();
                    BlueText.Text = newColor.B.ToString();
                    CopyColorText.Text = CompactRGBText.Text = "" + newColor.R + "," + newColor.G + "," + newColor.B;
                    CopyHexText.Text = CompactHexText.Text = newColor.ToString();
                }
            }
        }

        //private void UpdateColorCanvas(object sender, RoutedEventArgs e)
        private void UpdateColorCanvas(double max, double position)
        {
            var targetColor = new Color();

            if (position > max)
                position = max;

            targetColor.R = GetRedValue(max, position);
            targetColor.G = GetGreenValue(max, position);
            targetColor.B = GetBlueValue(max, position);
            targetColor.A = 255;

            BaseHue = new SolidColorBrush(targetColor);
        }

        #endregion

        #region Color Calculations

        private byte GetRedValue(double range, double value)
        {
            var percentage = value/range;
            var redValue = 0;

            if (percentage <= .3333)
            {
                redValue = percentage <= .16666 ? 255 : Convert.ToInt32(255*(Math.Abs(.3333 - percentage)/.16666));
            }
            else if (percentage >= .66666)
            {
                redValue = percentage >= .83333 ? 255 : Convert.ToInt32(255*(Math.Abs(percentage - .6666)/.16666));
            }

            return Convert.ToByte(redValue);
        }

        private byte GetBlueValue(double range, double value)
        {
            var percentage = value/range;
            var blueValue = 0;

            if (percentage >= .66666)
            {
                blueValue = 0;
            }
            else if (percentage <= .16666)
            {
                blueValue = Convert.ToInt32(255*(Math.Abs(percentage)/.16666));
            }
            else if (percentage <= .5)
            {
                blueValue = 255;
            }
            else if (percentage >= .5)
            {
                blueValue = Convert.ToInt32(255*(Math.Abs(.66666 - percentage)/.16666));
            }

            return Convert.ToByte(blueValue);
        }

        private byte GetGreenValue(double range, double value)
        {
            var percentage = value/range;
            var greenValue = 0;

            if (percentage <= .3333)
            {
                greenValue = 0;
            }
            else if (percentage >= .8333)
            {
                greenValue = Convert.ToInt32(255*(Math.Abs(1 - percentage)/.16666));
            }
            else if (percentage >= .5)
            {
                greenValue = 255;
            }
            else if (percentage <= .5)
            {
                greenValue = Convert.ToInt32(255*(Math.Abs(.3333 - percentage)/.16666));
            }

            return Convert.ToByte(greenValue);
        }

        #endregion

        #region Color Canvas Mouse Event Handlers

        private void Canvas_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            _isMouseDownOnCanvas = false;
        }

        private void Canvas_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            //Let the dragging issue begin
            _isMouseDownOnCanvas = true;
            var backgroundCanvas = sender as Canvas;

            //move the little circular canvas thingy
            var newGridPoint = e.GetPosition(backgroundCanvas);
            Canvas.SetTop(FinalColor, newGridPoint.Y - 6);
            Canvas.SetLeft(FinalColor, newGridPoint.X - 6);

            //Set the new Brush
            if (backgroundCanvas != null)
            {
                _colorCanvasXProperty = Math.Abs(backgroundCanvas.ActualWidth - newGridPoint.X)/backgroundCanvas.ActualWidth;
                ColorCanvasY = Math.Abs(newGridPoint.Y - backgroundCanvas.ActualHeight)/backgroundCanvas.ActualHeight;
            }
        }

        private void Canvas_MouseMove(object sender, MouseEventArgs e)
        {
            if (_isMouseDownOnCanvas)
            {
                var backgroundCanvas = sender as Canvas;

                var newGridPoint = e.GetPosition(backgroundCanvas);
                Canvas.SetTop(FinalColor, newGridPoint.Y - 6);
                Canvas.SetLeft(FinalColor, newGridPoint.X - 6);

                //Set the new Brush
                if (backgroundCanvas != null)
                {
                    _colorCanvasXProperty = Math.Abs(backgroundCanvas.ActualWidth - newGridPoint.X)/
                                            backgroundCanvas.ActualWidth;
                    ColorCanvasY = Math.Abs(newGridPoint.Y - backgroundCanvas.ActualHeight)/backgroundCanvas.ActualHeight;
                }
            }
        }

        private void Canvas_MouseLeave(object sender, MouseEventArgs e)
        {
            //find out which side the mouse left
            if (_isMouseDownOnCanvas)
            {
                if (_colorCanvasXProperty - 1 > -.1)
                {
                    _colorCanvasXProperty = 1;
                }
                else if (_colorCanvasXProperty - .1 < 0)
                {
                    _colorCanvasXProperty = 0;
                }

                if (_colorCanvasYProperty - 1 > -.1)
                {
                    _colorCanvasYProperty = 1;
                }
                else if (_colorCanvasYProperty - .1 < 0)
                {
                    _colorCanvasYProperty = 0;
                }

                ColorCanvasY = _colorCanvasYProperty;
            }
        }

        private void ColorCanvas_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            RealignElement(new Point(Canvas.GetLeft(FinalColor),
                Canvas.GetTop(FinalColor)),
                e.PreviousSize,
                e.NewSize,
                FinalColor);
        }

        #endregion

        #region Rainbow Border Event Handlers

        private void RainbowBorder_TurnOn(object sender, MouseButtonEventArgs e)
        {
            _isMouseDownOnRainbow = true;

            var thisRainbowBorder = (FrameworkElement) sender;
            var mousePosInRainbow = e.GetPosition(thisRainbowBorder);
            UpdateColorCanvas(thisRainbowBorder.ActualHeight, thisRainbowBorder.ActualHeight - mousePosInRainbow.Y);
            Canvas.SetTop(RainbowHandle, mousePosInRainbow.Y - RainbowHandle.ActualHeight/2);
        }

        private void RainbowBorder_TurnOff(object sender, MouseButtonEventArgs e)
        {
            _isMouseDownOnRainbow = false;
        }

        private void RainbowBorder_UpdateHue(object sender, MouseEventArgs e)
        {
            if (_isMouseDownOnRainbow)
            {
                var thisRainbowBorder = (FrameworkElement) sender;
                var mousePosInRainbow = e.GetPosition(thisRainbowBorder);
                if ((mousePosInRainbow.Y < RainbowBorder.ActualHeight) && (mousePosInRainbow.Y > 0))
                {
                    UpdateColorCanvas(thisRainbowBorder.ActualHeight,
                        thisRainbowBorder.ActualHeight - mousePosInRainbow.Y);
                    Canvas.SetTop(RainbowHandle, mousePosInRainbow.Y - RainbowHandle.ActualHeight/2);
                }
            }
        }

        private void HueCanvas_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            RealignElement(new Point(0.0,
                Canvas.GetTop(RainbowHandle)),
                e.PreviousSize,
                e.NewSize,
                RainbowHandle);

            if (RainbowBorder.ActualWidth > 1)
                RainbowHandle.Width = RainbowBorder.ActualWidth - 1;

            if (e.NewSize.Height < 100)
            {
                RainbowHandle.Height = 10;
            }
            else if (e.NewSize.Height > 300)
            {
                RainbowHandle.Height = 30;
            }
            else
            {
                RainbowHandle.Height = e.NewSize.Height/10;
            }
        }

        #endregion
    }

    #region ColorChangedEvent stuff

    public delegate void ColorChangedEventHandler(object sender, ColorChangedEventArgs e);

    public class ColorChangedEventArgs : EventArgs
    {
        public SolidColorBrush NewColor;

        // The fire event will have two pieces of information--
        // 1) Where the fire is, and 2) how "ferocious" it is.

        public SolidColorBrush OldColor;

        public ColorChangedEventArgs(SolidColorBrush oldColor, SolidColorBrush newColor)
        {
            OldColor = oldColor;
            NewColor = newColor;
        }
    }

    #endregion

    #region ClickTextBox class

    public class ClickTextBox : TextBox
    {
        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonDown(e);
            e.Handled = false;
            SelectAll();
        }

        protected override void OnMouseLeftButtonUp(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonUp(e);
            e.Handled = false;
        }
    }

    #endregion    }
}
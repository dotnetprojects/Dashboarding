
/* •——————————————————————————————————————————————————————————————————————————————————————————•
   | This really useful color picker was sourced from the blog:                               |
   |    Matthias Shapiro’s WPF & Silverlight Blog - Because Developers Get All The Good Blogs |
   |    at: http://www.designerwpf.com/category/colorpicker/                                  |
   | and is copyright 2008-2009 Matthias Shapiro.                                             |
   •——————————————————————————————————————————————————————————————————————————————————————————• */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Demos.Common.Util
{
    public partial class ColorPicker : UserControl
    {
        private bool isMouseDownOnCanvas;
        private bool isMouseDownOnRainbow;
        private double colorCanvasXProperty;
        private double colorCanvasYProperty;
        private SolidColorBrush baseHueProperty;
        private bool isCompactProperty;

        private SolidColorBrush selectedColorProperty;



        public ColorPicker()
        {
            InitializeComponent();

            colorCanvasXProperty = 1;
            ColorCanvasY = 1;
            isMouseDownOnCanvas = false;
            this.UpdateLayout();
            if (RainbowBorder.ActualWidth > 1)
                RainbowHandle.Width = RainbowBorder.ActualWidth - 1;
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
            if (ColorChangedEvent != null)
            {
                ColorChangedEvent(this, e);
            }
        }
        #endregion

        #region Dependency Properties

        private double ColorCanvasX
        {
            get { return colorCanvasXProperty; }
            set
            {
                colorCanvasXProperty = value;
                UpdateSelectedColor();
            }
        }

        private double ColorCanvasY
        {
            get { return colorCanvasYProperty; }
            set
            {
                colorCanvasYProperty = value;
                UpdateSelectedColor();
            }
        }

        internal SolidColorBrush BaseHue
        {
            get { return baseHueProperty; }
            set
            {
                baseHueProperty = value;
                UpdateSelectedColor();
                if (BackgroundCanvas != null)
                {
                    BackgroundCanvas.Background = baseHueProperty;
                }
            }
        }

        public bool IsCompact
        {
            get { return isCompactProperty; }
            set
            {
                isCompactProperty = value;
                if (LayoutRoot != null)
                {
                    CompactLayoutChange(value);
                }
            }
        }

        private void CompactLayoutChange(bool compactChange)
        {
            Point oldColorPosition = new Point(Canvas.GetLeft(FinalColor),
                                                Canvas.GetTop(FinalColor));
            Point oldHuePosition = new Point(0.0,
                                                Canvas.GetTop(RainbowHandle));
            Size oldColorCanvasSize = new Size(this.ColorCanvas.ActualWidth,
                                                this.ColorCanvas.ActualHeight);
            Size oldHueCanvasSize = new Size(this.HueCanvas.ActualWidth,
                                                this.HueCanvas.ActualHeight);

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
            this.UpdateLayout();

            RealignElement(oldColorPosition,
                            oldColorCanvasSize,
                            new Size(this.ColorCanvas.ActualWidth, this.ColorCanvas.ActualHeight),
                            (UIElement)this.FinalColor);
            RealignElement(oldHuePosition,
                            oldHueCanvasSize,
                            new Size(this.HueCanvas.ActualWidth, this.HueCanvas.ActualHeight),
                            (UIElement)this.RainbowHandle);

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
            if ((oldCanvasSize.Width != 0) && (oldCanvasSize.Height != 0))
            {

                double relativeX = oldPosition.X / oldCanvasSize.Width;
                double relativeY = oldPosition.Y / oldCanvasSize.Height;

                Canvas.SetLeft(elementToRealign, (newCanvasSize.Width * relativeX));
                Canvas.SetTop(elementToRealign, (newCanvasSize.Height * relativeY));
            }
        }

        public SolidColorBrush SelectedColor
        {
            get { return selectedColorProperty; }
            set
            {
                selectedColorProperty = value;

                if (resultCanvas != null)
                {
                    resultCanvas.Background = selectedColorProperty;
                }
            }
        }

        #endregion

        #region Update Color methods
        protected void UpdateSelectedColor()
        {
            if (baseHueProperty == null)
            {
                UpdateColorCanvas(150, 0);
            }

            Color baseColor = ((System.Windows.Media.SolidColorBrush)(baseHueProperty)).Color;

            Color newColor = new Color();
            if (colorCanvasXProperty > 1.0)
            {
                colorCanvasXProperty = 1.0;
            }

            if (colorCanvasYProperty > 1.0)
            {
                colorCanvasYProperty = 1.0;
            }

            newColor.R = System.Convert.ToByte(colorCanvasYProperty * (baseColor.R + ((255 - baseColor.R) * colorCanvasXProperty)));
            newColor.G = System.Convert.ToByte(colorCanvasYProperty * (baseColor.G + ((255 - baseColor.G) * colorCanvasXProperty)));
            newColor.B = System.Convert.ToByte(colorCanvasYProperty * (baseColor.B + ((255 - baseColor.B) * colorCanvasXProperty)));

            newColor.A = 255;

            SolidColorBrush updatedColor = new SolidColorBrush(newColor);

            OnColorChanged(new ColorChangedEventArgs(SelectedColor, updatedColor));

            SelectedColor = new SolidColorBrush(newColor);

            if (CopyColorText != null)
            {
                RedText.Text = newColor.R.ToString();
                GreenText.Text = newColor.G.ToString();
                BlueText.Text = newColor.B.ToString();
                CopyColorText.Text = CompactRGBText.Text = "" + newColor.R.ToString() + "," + newColor.G.ToString() + "," + newColor.B.ToString();
                CopyHexText.Text = CompactHexText.Text = newColor.ToString();
            }
        }

        //private void UpdateColorCanvas(object sender, RoutedEventArgs e)
        private void UpdateColorCanvas(double max, double position)
        {
            Color targetColor = new Color();

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
            double percentage = value / range;
            int redValue = 0;

            if (percentage <= .3333)
            {
                if (percentage <= .16666)
                {
                    redValue = 255;
                }
                else
                {
                    redValue = System.Convert.ToInt32(255 * (Math.Abs(.3333 - percentage) / .16666));
                }
            }
            else if (percentage >= .66666)
            {
                if (percentage >= .83333)
                {
                    redValue = 255;
                }
                else
                {
                    redValue = System.Convert.ToInt32(255 * (Math.Abs(percentage - .6666) / .16666));
                }
            }

            return System.Convert.ToByte(redValue);
        }

        private byte GetBlueValue(double range, double value)
        {
            double percentage = value / range;
            int blueValue = 0;

            if (percentage >= .66666)
            {
                blueValue = 0;
            }
            else if (percentage <= .16666)
            {
                blueValue = System.Convert.ToInt32(255 * (Math.Abs(percentage) / .16666));
            }
            else if (percentage <= .5)
            {
                blueValue = 255;
            }
            else if (percentage >= .5)
            {
                blueValue = System.Convert.ToInt32(255 * (Math.Abs(.66666 - percentage) / .16666));
            }

            return System.Convert.ToByte(blueValue);
        }

        private byte GetGreenValue(double range, double value)
        {
            double percentage = value / range;
            int greenValue = 0;

            if (percentage <= .3333)
            {
                greenValue = 0;
            }
            else if (percentage >= .8333)
            {
                greenValue = System.Convert.ToInt32(255 * (Math.Abs(1 - percentage) / .16666));
            }
            else if (percentage >= .5)
            {
                greenValue = 255;
            }
            else if (percentage <= .5)
            {
                greenValue = System.Convert.ToInt32(255 * (Math.Abs(.3333 - percentage) / .16666));
            }

            return System.Convert.ToByte(greenValue);
        }

        #endregion

        #region Color Canvas Mouse Event Handlers

        private void Canvas_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            isMouseDownOnCanvas = false;
        }

        private void Canvas_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            //Let the dragging issue begin
            isMouseDownOnCanvas = true;
            Canvas backgroundCanvas = sender as Canvas;

            //move the little circular canvas thingy
            Point newGridPoint = e.GetPosition(backgroundCanvas);
            Canvas.SetTop(this.FinalColor, (newGridPoint.Y - 6));
            Canvas.SetLeft(this.FinalColor, (newGridPoint.X - 6));

            //Set the new Brush
            colorCanvasXProperty = (Math.Abs(backgroundCanvas.ActualWidth - newGridPoint.X)) / backgroundCanvas.ActualWidth;
            ColorCanvasY = (Math.Abs(newGridPoint.Y - backgroundCanvas.ActualHeight)) / backgroundCanvas.ActualHeight;
        }

        private void Canvas_MouseMove(object sender, MouseEventArgs e)
        {
            if (isMouseDownOnCanvas)
            {
                Canvas backgroundCanvas = sender as Canvas;

                Point newGridPoint = e.GetPosition(backgroundCanvas);
                Canvas.SetTop(this.FinalColor, (newGridPoint.Y - 6));
                Canvas.SetLeft(this.FinalColor, (newGridPoint.X - 6));

                //Set the new Brush
                colorCanvasXProperty = (Math.Abs(backgroundCanvas.ActualWidth - newGridPoint.X)) / backgroundCanvas.ActualWidth;
                ColorCanvasY = (Math.Abs(newGridPoint.Y - backgroundCanvas.ActualHeight)) / backgroundCanvas.ActualHeight;
            }
        }

        private void Canvas_MouseLeave(object sender, MouseEventArgs e)
        {
            //find out which side the mouse left
            if (isMouseDownOnCanvas)
            {
                if ((colorCanvasXProperty - 1) > -.1)
                {
                    colorCanvasXProperty = 1;
                }
                else if ((colorCanvasXProperty - .1) < 0)
                {
                    colorCanvasXProperty = 0;
                }

                if ((colorCanvasYProperty - 1) > -.1)
                {
                    colorCanvasYProperty = 1;
                }
                else if ((colorCanvasYProperty - .1) < 0)
                {
                    colorCanvasYProperty = 0;
                }

                ColorCanvasY = colorCanvasYProperty;
            }
        }

        private void ColorCanvas_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            RealignElement(new Point(Canvas.GetLeft(FinalColor),
                                     Canvas.GetTop(FinalColor)),
                         e.PreviousSize,
                         e.NewSize,
                         (UIElement)FinalColor);
        }

        #endregion

        #region Rainbow Border Event Handlers

        private void RainbowBorder_TurnOn(object sender, MouseButtonEventArgs e)
        {
            isMouseDownOnRainbow = true;

            FrameworkElement thisRainbowBorder = (FrameworkElement)sender;
            Point mousePosInRainbow = e.GetPosition(thisRainbowBorder);
            UpdateColorCanvas(thisRainbowBorder.ActualHeight, (thisRainbowBorder.ActualHeight - mousePosInRainbow.Y));
            Canvas.SetTop(this.RainbowHandle, (mousePosInRainbow.Y - (this.RainbowHandle.ActualHeight / 2)));

        }

        private void RainbowBorder_TurnOff(object sender, MouseButtonEventArgs e)
        {
            isMouseDownOnRainbow = false;

        }

        private void RainbowBorder_UpdateHue(object sender, MouseEventArgs e)
        {
            if (isMouseDownOnRainbow)
            {
                FrameworkElement thisRainbowBorder = (FrameworkElement)sender;
                Point mousePosInRainbow = e.GetPosition(thisRainbowBorder);
                if ((mousePosInRainbow.Y < this.RainbowBorder.ActualHeight) && (mousePosInRainbow.Y > 0))
                {
                    UpdateColorCanvas(thisRainbowBorder.ActualHeight, (thisRainbowBorder.ActualHeight - mousePosInRainbow.Y));
                    Canvas.SetTop(this.RainbowHandle, (mousePosInRainbow.Y - (this.RainbowHandle.ActualHeight / 2)));
                }
            }
        }

        private void HueCanvas_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            RealignElement(new Point(0.0,
                                     Canvas.GetTop(RainbowHandle)),
                         e.PreviousSize,
                         e.NewSize,
                         (UIElement)RainbowHandle);

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
                RainbowHandle.Height = e.NewSize.Height / 10;
            }

        }

        #endregion

        private void TurnEverythingOff(object sender, MouseButtonEventArgs e)
        {
            isMouseDownOnRainbow = false;
            isMouseDownOnCanvas = false;
        }


    }





    #region ColorChangedEvent stuff

    public delegate void ColorChangedEventHandler(object sender, ColorChangedEventArgs e);

    public class ColorChangedEventArgs : EventArgs
    {
        public ColorChangedEventArgs(SolidColorBrush oldColor, SolidColorBrush newColor)
        {
            this.oldColor = oldColor;
            this.newColor = newColor;
        }

        // The fire event will have two pieces of information--
        // 1) Where the fire is, and 2) how "ferocious" it is.

        public SolidColorBrush oldColor;
        public SolidColorBrush newColor;

    }
    #endregion

    #region ClickTextBox class

    public class ClickTextBox : TextBox
    {
        public ClickTextBox()
        {

        }
        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonDown(e);
            e.Handled = false;
            this.SelectAll();
        }

        protected override void OnMouseLeftButtonUp(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonUp(e);
            e.Handled = false;
        }
    }
    #endregion    }
}

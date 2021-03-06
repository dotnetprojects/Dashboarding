﻿//-----------------------------------------------------------------------
// <copyright file="Knob360.xaml.cs" company="David Black">
//      Copyright 2008 David Black
//
//      Licensed under the Apache License, Version 2.0 (the "License");
//      you may not use this file except in compliance with the License.
//      You may obtain a copy of the License at
//    
//          http://www.apache.org/licenses/LICENSE-2.0
//    
//      Unless required by applicable law or agreed to in writing, software
//      distributed under the License is distributed on an "AS IS" BASIS,
//      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//      See the License for the specific language governing permissions and
//      limitations under the License.
// </copyright>
//-----------------------------------------------------------------------
namespace Codeplex.Dashboarding
{
    using System;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Media;
    using System.Windows.Media.Animation;
    using System.Windows.Shapes;

    /// <summary>
    /// Dial 360 with a control knob to drag not a needle
    /// </summary>
    public partial class Knob360 : BidirectionalDial
    {
        #region Constructors

        /// <summary>
        /// Initializes a new instance of the <see cref="Knob360"/> class.
        /// </summary>
        public Knob360()
        {
            InitializeComponent();
            SetValue(ValueTextColorProperty, Colors.White);
            RegisterGrabHandle(_indicator);
        }

        #endregion Constructors

        #region Properties

        /// <summary>
        /// Return the shape used to highlight the grab control
        /// </summary>
        protected override Shape GrabHighlight
        {
            get { return _grabHighlight; }
        }

        /// <summary>
        /// Gets the resource root. This allow us to access the Storyboards in a Silverlight/WPf
        /// neutral manner
        /// </summary>
        /// <value>The resource root.</value>
        protected override FrameworkElement ResourceRoot
        {
            get { return LayoutRoot; }
        }

        #endregion Properties

        #region Methods

        /// <summary>
        /// Animates the dial moving the grab knob and needle
        /// </summary>
        protected override void Animate()
        {
            this.UpdateFaceColor();
            this.UpdateNeedleColor();

            _txt11.Text = FormattedValue;

            if (!IsBidirectional || (IsBidirectional && !IsGrabbed))
            {
                this.SetPointerByAnimationOverSetTime(NormalizedValue, Value, AnimationDuration);
            }
            else
            {
                this.SetPointerByAnimationOverSetTime(CurrentNormalizedValue, CurrentValue, TimeSpan.Zero);
            }
        }

        /// <summary>
        /// Determines the angle of the needle based on the mouse 
        /// position.
        /// </summary>
        /// <param name="currentPoint">Mouse position</param>
        /// <returns>The angle in degrees</returns>
        protected override double CalculateRotationAngle(Point currentPoint)
        {
            double opposite = currentPoint.Y - (ActualHeight / 2);
            double adjacent = currentPoint.X - (ActualWidth / 2);
            double tan = opposite / adjacent;
            double angleInDegrees = Math.Atan(tan) * (180.0 / Math.PI);

            if (currentPoint.X >= (ActualWidth / 2) && currentPoint.Y <= (ActualHeight / 2))
            {
                angleInDegrees = 180 + angleInDegrees;
            }
            else if (currentPoint.X < (ActualWidth / 2) && currentPoint.Y <= (ActualHeight / 2))
            {
                // already done
            }
            else if (currentPoint.X >= (ActualWidth / 2) && currentPoint.Y > (ActualHeight / 2))
            {
                angleInDegrees = 180 + angleInDegrees;
            }
            else
            {
                // no-op
            }

            angleInDegrees = (angleInDegrees - 90) % 360;
            return angleInDegrees;
        }

        /// <summary>
        /// Requires that the control hounours all appearance setting as specified in the
        /// dependancy properties (at least the supported ones). No dependancy property handling
        /// is performed until all dependancy properties are set and the control is loaded.
        /// </summary>
        protected override void ManifestChanges()
        {
            this.UpdateFaceColor();
            this.UpdateNeedleColor();
            this.UpdateTextColor();
            this.UpdateTextFormat();
            this.UpdateTextVisibility();
            this.UpdateFontStyle();
        }

        /// <summary>
        /// Based on the rotation angle, set the normalized current value
        /// </summary>
        /// <param name="cv">rotation angle</param>
        protected override void SetCurrentNormalizedValue(double cv)
        {
            if (cv < -150)
            {
                cv = -150;
            }

            if (cv > 150)
            {
                cv = 150;
            }

            CurrentNormalizedValue = (cv + 150) / 300;
        }

        /// <summary>
        /// Set the face color from the range
        /// </summary>
        protected override void UpdateFaceColor()
        {
            ColorPoint c = FaceColorRange.GetColor(Value);
            if (c != null)
            {
                this._colourRangeStart.Color = c.HiColor;
                this._colourRangeEnd.Color = c.LowColor;
            }
        }

        /// <summary>
        /// Set the needle color from the range
        /// </summary>
        protected override void UpdateNeedleColor()
        {
            ColorPoint c = this.NeedleColorRange.GetColor(Value);
            if (c != null)
            {
                this._needle.Fill = new SolidColorBrush(c.HiColor);
            }
        }

        /// <summary>
        /// Set our text color to that of the TextColor property
        /// </summary>
        protected override void UpdateTextColor()
        {
            for (int i = 0; i <= 10; i++)
            {
                TextBlock tb = LayoutRoot.FindName("_txt" + i) as TextBlock;
                if (tb != null)
                {
                    tb.Foreground = new SolidColorBrush(FaceTextColor);
                }
            }

            if (_txt11 != null)
            {
                _txt11.Foreground = new SolidColorBrush(ValueTextColor);
            }
        }

        /// <summary>
        /// Updates the font style for both face and value text.
        /// </summary>
        protected override void UpdateFontStyle()
        {
            for (int i = 0; i <= 12; i++)
            {
                TextBlock tb = ResourceRoot.FindName("_txt" + i) as TextBlock;
                CopyFontDetails(tb);
            }
        }

        /// <summary>
        /// The format string for the value has changed
        /// </summary>
        protected override void UpdateTextFormat()
        {
            for (int i = 0; i <= 10; i++)
            {
                TextBlock tb = LayoutRoot.FindName("_txt" + i) as TextBlock;
                if (tb != null && FaceTextFormat != null)
                {
                    tb.Text = String.Format(FaceTextFormat, RealMinimum + (i * ((RealMaximum - RealMinimum) / 10)));
                }
            }

            if (_txt11 != null)
            {
                _txt11.Text = IsGrabbed ? FormattedCurrentValue : FormattedValue;
            }
        }

        /// <summary>
        /// Sets the text visibility to that of the TextVisibility property
        /// </summary>
        protected override void UpdateTextVisibility()
        {
            for (int i = 0; i <= 10; i++)
            {
                TextBlock tb = LayoutRoot.FindName("_txt" + i) as TextBlock;
                if (tb != null)
                {
                    tb.Visibility = FaceTextVisibility;
                }
            }

            if (_txt11 != null)
            {
                _txt11.Visibility = ValueTextVisibility;
            }
        }

        /// <summary>
        /// Sets the pointer animation to execute and sets the time to animate. This allow the same
        /// code to handle normal operation using the Dashboard.AnimationDuration or for dragging the
        /// needle during bidirectional operation (TimeSpan.Zero)
        /// </summary>
        /// <param name="normalizedValue">The normalized Value.</param>
        /// <param name="value">The value.</param>
        /// <param name="duration">The duration.</param>
        private void SetPointerByAnimationOverSetTime(double normalizedValue, double value, TimeSpan duration)
        {
            this.UpdateTextFormat();

            SplineDoubleKeyFrame needle = SetFirstChildSplineDoubleKeyFrameTime(AnimateIndicatorStoryboard, (-150 + (300 * normalizedValue)) - 2);
            needle.KeyTime = KeyTime.FromTimeSpan(duration);
            Start(AnimateIndicatorStoryboard);

            SplineDoubleKeyFrame handle = SetFirstChildSplineDoubleKeyFrameTime(AnimateGrabHandleStoryboard, (300 * normalizedValue) - 10);
            handle.KeyTime = KeyTime.FromTimeSpan(duration);
            Start(AnimateGrabHandleStoryboard);
        }

        #endregion Methods
    }
}
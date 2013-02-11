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

using SilverlightApplication.SingleGuages;
using SilverlightApplication.SingleGuages.dec;

namespace SilverlightApplication
{
    internal enum Tab { Dials, Booleans, Home };

    public partial class App : Application
    {
       

        public App()
        {
            this.Startup += this.Application_Startup;
            this.Exit += this.Application_Exit;
            this.UnhandledException += this.Application_UnhandledException;

            InitializeComponent();
        }

        private void Application_Startup(object sender, StartupEventArgs e)
        {
            this.RootVisual = GetRootVisual(e.InitParams["demo"], e);
        }

        private UIElement GetRootVisual(string page, StartupEventArgs e)
        {
            

            switch (page)
            {
                case "TopStrip": return new TopStrip(e.InitParams);
                case "FirstStep": return new FirstStep();
                case "SecondStep": return new SecondStep();
                case "ThirdStep": return new ThirdStep();
                case "FourthStep": return new FourthStep();
                case "FifthStep": return new FifthStep();
                case "SixthStep": return new SixthStep();
                case "SeventhStep": return new SeventhStep();
                case "DecadeBorder": return new DecadeBorderColor(e.InitParams);
                case "Dial360": return new Dial360(e.InitParams);

                case "DecadeVduMeter": return new AspNetDecadeVduMeter(e.InitParams);
                case "RoundLedBase": return new RoundLedBase();
                case "TickCrossBase": return new TickCrossBase();
                case "RoundLedCustom": return new RoundLedCustom();
                case "RoundLedHr": return new RoundLedHr();
                case "TickCrossCustom": return new TickCrossCustom();
                case "PerformanceMonitorBasic": return new PerformanceMonitorBasic();
                case "PerformanceMonitor": return new PerformanceMonitor();
                case "FiveStarBasic": return new FiveStarBasic();
                case "FiveStarColors": return new FiveStarColors();
                case "SixteenBase": return new SixteenBase();
                case "SixteenEx": return new SixteenEx();
                case "Odd1": return new Odd1();
                case "Odd2": return new Odd2();
                case "Odd3": return new Odd3();
                case "Odd4": return new Odd4();
                case "Odd5": return new Odd5();
                case "Odd6": return new Odd6();
                case "Therm1": return new Therm1();
                case "Therm2": return new Therm2();
                case "Therm3": return new Therm3();
                case "Wall1": return new Wall1();
                case "Wall2": return new Wall2();
                case "Wall3": return new Wall3();
                case "Prog1": return new Prog1();
                case "Prog2": return new Prog2();
                case "Diam1": return new Diam1();
                case "Diam2": return new Diam2();
                case "Dial180_1": return new Dial180_1();
                case "Dial180_2": return new Dial180_2();
                case "Mat1": return new Mat1();
                case "Mat2": return new Mat2();
                case "Mat3": return new Mat3();
                case "Mat4": return new Mat4();
                case "Mat5": return new Mat5();
                case "Mat6": return new Mat6();
                case "BiDiamond1": return new BiDiamond1();
                case "BiDiamond2": return new BiDiamond2();
                case "BiDiamond3": return new BiDiamond3();
                case "BiDiamond4": return new BiDiamond4();

                case "Knob360": return new Knob360();
                case "Dial90": return new Dial90();


                case "FontEditor": return new FontEditor.FontEditor();
            }
            return null;
        }

        internal void switchToTab(Tab tab)
        {
            
        }


        private void Application_Exit(object sender, EventArgs e)
        {

        }
        private void Application_UnhandledException(object sender, ApplicationUnhandledExceptionEventArgs e)
        {
            // If the app is running outside of the debugger then report the exception using
            // the browser's exception mechanism. On IE this will display it a yellow alert 
            // icon in the status bar and Firefox will display a script error.
            if (!System.Diagnostics.Debugger.IsAttached)
            {

                // NOTE: This will allow the application to continue running after an exception has been thrown
                // but not handled. 
                // For production applications this error handling should be replaced with something that will 
                // report the error to the website and stop the application.
                e.Handled = true;

                try
                {
                    string errorMsg = e.ExceptionObject.Message + e.ExceptionObject.StackTrace;
                    errorMsg = errorMsg.Replace('"', '\'').Replace("\r\n", @"\n");

                    System.Windows.Browser.HtmlPage.Window.Eval("throw new Error(\"Unhandled Error in Silverlight 2 Application " + errorMsg + "\");");
                }
                catch (Exception)
                {
                }
            }
        }
    }
}

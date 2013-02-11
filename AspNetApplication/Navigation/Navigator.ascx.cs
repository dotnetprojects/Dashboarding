using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.UI.MobileControls;
using System.Collections.Generic;

namespace AspNetApplication.Navigation
{
    public partial class Navigator : System.Web.UI.UserControl
    {
        #region Navigation items

        List<NavigationItem> controlPages = new List<NavigationItem> 
        {
            new NavigationItem("DecadeVuMeter","~/Pages/DecadeVuMeter.aspx"),
//            new NavigationItem("Dial360", "~/Pages/Dial360.aspx"),
            new NavigationItem("Dial180", "~/Pages/Dial180.aspx"),
            new NavigationItem("RoundLed","~/Pages/RoundLed.aspx"),
            new NavigationItem("TickCross","~/Pages/TickCross.aspx"),
            new NavigationItem("PerformanceMonitor", "~/Pages/PerformanceMonitor.aspx"),
//            new NavigationItem("FiveStarRanking", "~/Pages/FiveStarRanking.aspx"),
            new NavigationItem("SixteenSegmentLED", "~/Pages/SixteenSegmentLED.aspx"),
            new NavigationItem("Odometer", "~/Pages/Odometer.aspx"),
//            new NavigationItem("PlainThermometer", "~/Pages/PlainThermometer.aspx"),
//            new NavigationItem("WallThermometer", "~/Pages/WallThermometer.aspx"),
//            new NavigationItem("ProgressBar", "~/Pages/ProgressBar.aspx"),
//            new NavigationItem("DiamondSlider", "~/Pages/DiamondSlider.aspx"),
//            new NavigationItem("MatrixLedMarquee", "~/Pages/MatrixLedMarquee.aspx"),
//            new NavigationItem("Knob360", "~/Pages/Knob360.aspx"),
//            new NavigationItem("Dial90", "~/Pages/Dial90.aspx"),

        };
        
        #endregion

        #region Navigation items

        List<NavigationItem> extrasPages = new List<NavigationItem> 
        {
//            new NavigationItem("Contacts and pages","~/Extras/Contacts.aspx"),
            new NavigationItem("Matrix font editor","~/Extras/FontEditor.aspx"),
//            new NavigationItem("Bidirectional operation","~/Extras/Bidirection.aspx"),

        };

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            controlPages.Sort((a, b) => a.Title.CompareTo(b.Title));
            _controls.DataSource = controlPages;
            _controls.DataBind();


            extrasPages.Sort((a, b) => a.Title.CompareTo(b.Title));
            _extras.DataSource = extrasPages;
            _extras.DataBind();
        
        
        }
    }
}
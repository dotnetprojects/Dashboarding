using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace AspNetApplication.Navigation
{
    public class NavigationItem
    {

        public NavigationItem(string title, string href)
        {
            Title = title;
            Href = VirtualPathUtility.ToAbsolute(href);
        }

        public string Title { get; private set; }

        public string Href { get; private set; }

    }
}

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DecadeVuMeter.aspx.cs" Inherits="AspNetApplication.Pages.DecadeVuMeter" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>DecadeVduMeter</h2>

<p>The decade VDU meter is a modeled on the meters on good old cassette players of the eighties. It is
shown in it's basic form below</p>

<div style="text-align: center;">
<object type="application/x-silverlight" height="100">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=DecadeVduMeter,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
     </div>           
<p>The display consists of ten individual LEDs that are animated to show the current value
and a text indicator of the value. The 
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">main page</asp:HyperLink> contains a description of how to set the value in code, markup or via a 
data binding.</p>
<p>The meter can be configured via C# code or XAML to set colours. There are three main colors to
speficy</p>
<ul>
<li>The border around an LED, this is the same color regardless of the on / off state of the LED</li>
<li>The on color of the LED (Default bright green)</li>
<li>The off color of a LED (Default dark green)</li>
</ul>

<p>
    Let&#39;s look at setting the three colours
</p>

<p>
<table>
<tr>
<td><div style="text-align: center;">
<object type="application/x-silverlight" height="100">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=DecadeBorder,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
     </div>  </td>
<td><p>We can set the border color using the unsurprisingly named <code>BorderColor</code> property. The Led on and off color
properties (in a similar vein of creativity) are name <code>LedOnColor</code> and <code>LedOffColor</code>. In XAML this is marked up as: </p>

<pre class="csharpcode">
                <span class="kwrd">&lt;</span><span class="html">db:DecadeVuMeter</span>  
                    <span class="attr">BorderColor</span><span class="kwrd">="#FF412B6D"</span> 
                    <span class="attr">LedOnColor</span>= <span class="kwrd">"#FF614B8D"</span>
                    <span class="attr">LedOffColor</span><span class="kwrd">="#FF110B3D"</span>
                <span class="kwrd">/&gt;</span>
</pre>
</td>
</tr>
</table>
<p>And there you have it: not the worlds most complex control. But useful all the same</p>
</p>



</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SixteenSegmentLED.aspx.cs" Inherits="AspNetApplication.Pages.SixteenSegmentLED" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<H2>SixteenSegmentLED</H2>

<p>The <code>SixteenSegmentLED</code> shows a single LED digit / letter on a 16 segment style display. There are inbuilt representations of the letters 
A to Z (caps) and the digits 0 to 9.</p>


<p>Support for support for punctuation and non-english characters can be added later</p>

<p>Unlike most of the other Dashboards in the collection this control does not vale
a <code>Value</code> property of type double, it has a DisplayCharacter property of type
string (only set one character).</p>

<p>Supported characters are</p>



<center><object type="application/x-silverlight" height="240" width="400">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=SixteenBase,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></center>

The <code>SixteenSegmentLED</code> control has the following properties that can be set

<ul>
<li>DisplayCharacter</li>
<li>LedOnColor</li>
<li>LedOffColor</li>
</ul>

<p>The markup for a single digit is shown below. Note: If you are packing several of these controls either add a margin to
seperate the characters or use a <code>SixteenSegmentLEDStrip</code> helper class</p>


<table>
<tr>
<td>
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:SixteenSegmentLED</span> 
            <span class="attr">DisplayCharacter</span><span class="kwrd">="8"</span>     
            <span class="attr">LedOnColor</span>= <span class="kwrd">"#FF614B8D"</span> 
            <span class="attr">LedOffColor</span><span class="kwrd">="#33614b8d"</span> 
        <span class="kwrd">/&gt;</span> </pre>
</td>

<td>
<center><object type="application/x-silverlight" height="60" width="60">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=SixteenEx,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</center>
                    
</td>
</center>
</tr>
</table>

<p>In the above case made the Led Off color to be a transparent version of the led on color.</p>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlainThermometer.aspx.cs" Inherits="AspNetApplication.Pages.PlainThermometer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>PlainThermometer</h2>

<p>In this case plain means unadorned not (at least I hope) Ugly. A plain thermometer 
has a text field for the value and an animated mercury representaion of the value</p>
<p>Like the Dial360 and DecadeVduMeter controls , the PlainThermometer can vary
color according to value. In this case it is the color of the mercury. </p>

<table>
<tr>
<td colspan="2"><p>Declare a basic thermometer in XAML,set the value and you will get</p>
</td>
</tr>
<tr>
<td valign="top"> 
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:PlainThermometer</span> 
            <span class="attr">Value</span><span class="kwrd">="50"</span> <span class="kwrd">/&gt;</span>
</pre>
</td>
<td>  

<object type="application/x-silverlight" height="140" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Therm1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></td>
</tr>
<tr>

<td colspan="2">
<p>Apart from Value there are properties to specify</p>
<ul>
<li>The color of the text</li>
<li>The color range for thr thermometer mercury</li>
</ul>

<p>For a full description of  color ranges please see the
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Dial360.aspx">Dial360</asp:HyperLink> control.</p>

<p>The following example shows the standard example of a gauge set to show green at 33% or less,
yellow between 34% and 66% and red there after. The documentation for the <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Pages/Dial360.aspx">Dial360</asp:HyperLink> control will show how
to change the mercury to a fixed color for all values.</p>

<p>We will only show the XAML for one guage, but display 3 controls to show the colors at various values. In
all cases the text is colored a slightly hideous Aquamarine</p>

</td>
</tr>
<tr>
<td valign="top">

<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:PlainThermometer</span> <span class="attr">x:Name</span><span class="kwrd">="_ther2"</span> <span class="attr">TextColor</span><span class="kwrd">="Aquamarine"</span> <span class="attr">Value</span><span class="kwrd">="22"</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:PlainThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">db:PlainThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:PlainThermometer</span><span class="kwrd">&gt;</span></pre>

</td>
<td>
<object type="application/x-silverlight" height="140" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Therm2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
</tr>


<tr>
<td colspan="2"><p>Finally we can hide the text value of the thermometer by
using the TextVisibility property of the control and setting it to Collapsed.
Something we will do for the WallMountedThermometer.</p>
<p>Here we set the text to invisible and we set the color to green at all levels (ie 0 and above)</p>
</td>
</tr>
<tr>
<td>

<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:PlainThermometer</span> <span class="attr">TextVisibility</span><span class="kwrd">="Collapsed"</span> <span class="attr">TextColor</span><span class="kwrd">="Aquamarine"</span> <span class="attr">Value</span><span class="kwrd">="55"</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:PlainThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:PlainThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:PlainThermometer</span><span class="kwrd">&gt;</span>
</pre>

</td>
<td>

<object type="application/x-silverlight" height="140" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Therm3,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>

</table>




</asp:Content>

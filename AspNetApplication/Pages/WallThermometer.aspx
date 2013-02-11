<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WallThermometer.aspx.cs" Inherits="AspNetApplication.Pages.WallThermometer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>WallThermometer</h2>

<p>A wall thermometer is a decorator around a plain thermometer. It has all of
the properties of a plain thermometer, plus some of its own.</p>
<p>Like the Dial360 and DecadeVduMeter controls , the WallThermometer can vary
color according to value. In this case it is the color of the mercury. </p>

<table>
<tr>
<td colspan="2"><p>Declare a basic WallThermometer in XAML,set the value and you will get</p>
</td>
</tr>
<tr>
<td valign="top"> 
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:WallThermometer</span> 
            <span class="attr">Value</span><span class="kwrd">="50"</span> <span class="kwrd">/&gt;</span>
</pre>
</td>
<td>  

<object type="application/x-silverlight" height="160" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Wall1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></td>
</tr>
<tr>

<td colspan="2">
<p>Apart from Value there are properties to specify</p>
<ul>
<li>The color range for thr thermometer mercury</li>
<li>The visibility of the text representation of the Value</li>
</ul>

<p>For a full description of  color ranges please see the
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Dial360.aspx">Dial360</asp:HyperLink> control.</p>

<p>The following example shows the standard example of a gauge set to show green at 33% or less,
yellow between 34% and 66% and red there after. The documentation for the <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Pages/Dial360.aspx">Dial360</asp:HyperLink> control will show how
to change the mercury to a fixed color for all values.</p>

<p>We will only show the XAML for one guage, but display 3 controls to show the colors at various values. </p>

</td>
</tr>
<tr>
<td valign="top">

<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:WallThermometer</span> <span class="attr">x:Name</span><span class="kwrd">="_ther2"</span> <span class="attr">TextColor</span><span class="kwrd">="Aquamarine"</span> <span class="attr">Value</span><span class="kwrd">="22"</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:WallThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">db:WallThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:WallThermometer</span><span class="kwrd">&gt;</span></pre>

</td>
<td>
<object type="application/x-silverlight" height="140" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Wall2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
</tr>


<tr>
<td colspan="2"><p>Finally we can hide the text value of the thermometer by
using the TextVisibility property of the control and setting it to Collapsed.</p>
</td>
</tr>
<tr>
<td>

<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:WallThermometer</span> <span class="attr">TextVisibility</span><span class="kwrd">="Collapsed"</span> <span class="attr">Value</span><span class="kwrd">="55"</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:WallThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:WallThermometer.MercuryColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:WallThermometer</span><span class="kwrd">&gt;</span>
</pre>

</td>
<td>

<object type="application/x-silverlight" height="140" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Wall3,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>

</table>


</asp:Content>

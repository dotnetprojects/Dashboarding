<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dial360.aspx.cs" Inherits="AspNetApplication.Pages.Dial360" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<h2>Dial360</h2>

<p>The <code>Dial360</code> control is as conventional a control as you could ever image, it's round, it has a needle, 
it wouldn't look out of place in front of you in the drivers seat of a car. Nuff said.</p>

<p>In addition to the value property (see the <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">main page</asp:HyperLink> for a desctiption,
this control has properties to specify:</p>
<ul>
<li>The dial face color</li>
<li>The needle color</li>
<li>The TextColor</li>
<li>The TextVisibility</li>
</ul>

<h3>Color ranges</h3>

<p>The face and needle color properties for the dial are color ranges. A color range specifies the color used
to render an item based on its current value. Color ranges are dependancy properties and are specifed
in line in the XAML.
</p>

<p>If you set a color range to a single value, you get a single color. Here is the markup to show the
Dial face as a magenta color</p>

            <pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial"</span> <span class="attr">Value</span><span class="kwrd">="32"</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:Dial360</span><span class="kwrd">&gt;</span>
            </pre>

<p>The <code>ColorRange</code> is a collection of <code>ColorPoint</code>s. Each <code>ColorPoint</code> consists of a <code>LowColor</code>, <code>HighColor</code> and a <code>Value</code>. The Low and High Colors specify the
two ends of a gradient fill. You need to experiment to see what values look good. The Value specifies the start point of the color range. In the previous example the color starts at 0 and therefore is constant across all values</p>

<p>Let's assume that we want a dial for engine temperature and that above 90<sup>o</sup> the engine begins to fail. To help the driver we want the dial background to change
to red above 85<sup>o</sup> The following peace of XAL specifies a color range with a base color from 0..84 and red from 
    85 on wards.</p>

            <pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial"</span> <span class="attr">Value</span><span class="kwrd">="32"</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0000"</span> <span class="attr">Value</span><span class="kwrd">="85"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:Dial360</span><span class="kwrd">&gt;</span></pre>

<p>The preceding code assumes that two namespaces are declared to allow the XAML to 
    function, these are definied on the  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Default.aspx">main page</asp:HyperLink>.</p>

<p>TextColor takes a standard silverlight color and TextVisibility can be Visibility.Collapsed or Visibility.Visible</p>


<p>Showing is better than telling so here are the color ranges in action</p>

<table>
<tr>
<td><object type="application/x-silverlight" height="611">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Dial360,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></td>


<td>

<p>First here is our example changing the back ground of the dial to red above 55<sup>o</sup> and the Text color to Yellow</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial0"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="0"</span><span class="kwrd">  <span class="attr">TextColor</span><span class="kwrd">="Yellow"</span> &gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0000"</span> <span class="attr">Value</span><span class="kwrd">="55"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Dial360</span><span class="kwrd">&gt;</span></pre>

<br />
<br />
<br />
<p>Ladies and gentlemen, for my next gauge... We change the needle color to be green 0..32, yellow 33..64 and red 65+, and hold the text</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial1"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="1"</span><span class="kwrd">  <span class="attr">TextVisibility</span><span class="kwrd">="Collapsed"</span>  &gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial360.NeedleColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Dial360.NeedleColorRange</span><span class="kwrd">&gt;</span>  
<span class="kwrd">&lt;/</span><span class="html">db:Dial360</span><span class="kwrd">&gt;</span>
</pre>
<br />
<br />
<br />

<p>And finally. If you really want to harm and confuse your users, you can modify both</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial2"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="2"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#220000"</span> <span class="attr">Value</span><span class="kwrd">="55"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Dial360.FaceColorRange</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial360.NeedleColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Dial360.NeedleColorRange</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Dial360</span><span class="kwrd">&gt;</span>
</pre>


</td>
</tr>
</table>

<p>That's it for the 360 degree dial for now.</p>

</asp:Content>

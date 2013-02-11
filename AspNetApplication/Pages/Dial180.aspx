<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dial180.aspx.cs" Inherits="AspNetApplication.Pages.Dial180" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<h2>Dial180</h2>

<p>The <code>Dial180</code> control is as conventional a control as you could ever image, it's round, it has a needle, 
it wouldn't look out of place in front of you in the drivers seat of a car. Nuff said.</p>

<p>Sans an other markup the default appearance of a Dial180 is</p>

<table>
<tr>
<td>

</td>
<td>
<object type="application/x-silverlight" height="100">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Dial180_1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
</tr>
</table>

<p>In addition to the value property (see the <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">main page</asp:HyperLink> for a desctiption,
this control has properties to specify:</p>
<ul>
<li>The dial face color</li>
<li>The needle color</li>
<li>The TextColor</li>
<li>The TextVisibility</li>
</ul>

<h3>Color ranges</h3>

<p>Both of the color properties for the dial are color ranges. A color range specifies the color used
to render an item based on its current value. Color ranges are dependancy properties and are specifed
in line in the XAML. The 
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Dial360.aspx">Dial360</asp:HyperLink> documentation details the process.
</p>

<p>TextColor takes a standard silverlight color and TextVisibility can be Visibility.Collapsed or Visibility.Visible</p>

<table>
<tr>
<td><object type="application/x-silverlight" height="611">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Dial180_2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></td>


<td>

<p>First here is our example changing the back ground of the dial to red above 55<sup>o</sup> and setting the TextColor to Chocolate</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Dial180</span> <span class="attr">x:Name</span><span class="kwrd">="_dial0"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="0"</span><span class="kwrd"> <span class="attr">TextColor</span><span class="kwrd">="Chocolate"</span> &gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial180.FaceColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0000"</span> <span class="attr">Value</span><span class="kwrd">="55"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Dial180.FaceColorRange</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Dial180</span><span class="kwrd">&gt;</span></pre>

<br />
<br />
<br />
<p>Ladies and gentlemen, for my next gauge... We change the needle color to be green 0..32, yellow 33..64 and red 65+, and hold the Text</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Dial180</span> <span class="attr">x:Name</span><span class="kwrd">="_dial1"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="1"</span><span class="kwrd"> <span class="attr">TextVisibility</span><span class="kwrd">="Collapsed"</span> &gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial180.NeedleColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Dial180.NeedleColorRange</span><span class="kwrd">&gt;</span>  
<span class="kwrd">&lt;/</span><span class="html">db:Dial180</span><span class="kwrd">&gt;</span>
</pre>
<br />
<br />
<br />

<p>And finally. If you really want to harm and confuse your users, you can modify both</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Dial180</span> <span class="attr">x:Name</span><span class="kwrd">="_dial2"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="2"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial180.FaceColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#220000"</span> <span class="attr">Value</span><span class="kwrd">="55"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Dial180.FaceColorRange</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Dial180.NeedleColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Dial180.NeedleColorRange</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Dial180</span><span class="kwrd">&gt;</span>
</pre>


</td>
</tr>
</table>




</asp:Content>

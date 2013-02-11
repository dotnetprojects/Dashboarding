<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Knob360.aspx.cs" Inherits="AspNetApplication.Pages.Knob360" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<h2>Knob360</h2>

<p>The <code>Knob360</code> is similar to the Dial360 but has a circular grab knob instead of a needle. Like the Dial360 control
the Knob360 control is .<asp:HyperLink
        ID="HyperLink3" runat="server" NavigateUrl="~/Extras/Bidirection.aspx">bidirectional</asp:HyperLink> </p>

<p>In addition to the value property (see the <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">main page</asp:HyperLink> for a desctiption,
this control has properties to specify:</p>
<ul>
<li>The dial face color</li>
<li>The needle color</li>
<li>The TextColor</li>
<li>The TextVisibility</li>
</ul>

<p>For a detailed descriptions of color ranges please see the documentaion for the 
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/Pages/Dial360.aspx">Dial360</asp:HyperLink>. Otherwise we will stick with XAML and pixels...
    </p>

<table>
<tr>
<td><object type="application/x-silverlight" height="611">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Knob360,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></td>


<td>

<p>First here is our example changing the back ground of the dial to red above 55<sup>o</sup> and the Text color to Yellow</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Knob360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial0"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="0"</span><span class="kwrd">  <span class="attr">TextColor</span><span class="kwrd">="Yellow"</span> &gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Knob360.FaceColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0000"</span> <span class="attr">Value</span><span class="kwrd">="55"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Knob360.FaceColorRange</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Knob360</span><span class="kwrd">&gt;</span></pre>

<br />
<br />
<br />
<p>Ladies and gentlemen, for my next gauge... We change the needle color to be green 0..32, yellow 33..64 and red 65+, and hold the text</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Knob360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial1"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="1"</span><span class="kwrd">  <span class="attr">TextVisibility</span><span class="kwrd">="Collapsed"</span>  &gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Knob360.NeedleColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Knob360.NeedleColorRange</span><span class="kwrd">&gt;</span>  
<span class="kwrd">&lt;/</span><span class="html">db:Knob360</span><span class="kwrd">&gt;</span>
</pre>
<br />
<br />
<br />

<p>And finally. If you really want to harm and confuse your users, you can modify both</p>

<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Knob360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial2"</span> <span class="attr">Grid</span>.<span class="attr">Row</span><span class="kwrd">="2"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Knob360.FaceColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#6C0680"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#2A242C"</span> <span class="attr">LowColor</span><span class="kwrd">="#220000"</span> <span class="attr">Value</span><span class="kwrd">="55"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Knob360.FaceColorRange</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:Knob360.NeedleColorRange</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#009900"</span> <span class="attr">LowColor</span><span class="kwrd">="#44DD00"</span> <span class="attr">Value</span><span class="kwrd">="0"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#9DC800"</span> <span class="attr">LowColor</span><span class="kwrd">="#DDCC00"</span> <span class="attr">Value</span><span class="kwrd">="33"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#660000"</span> <span class="attr">LowColor</span><span class="kwrd">="#BB3300"</span> <span class="attr">Value</span><span class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">db:Knob360.NeedleColorRange</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">db:Knob360</span><span class="kwrd">&gt;</span>
</pre>


</td>
</tr>
</table>

<p>That's it for the 360 degree knob for now.</p>

</asp:Content>

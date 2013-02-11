<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DiamondSlider.aspx.cs" Inherits="AspNetApplication.Pages.DiamondSlider" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>DiamondSlider</h2>

<table>
<tr>
<td colspan="2">
<p>The <code>DiamondSlider</code> is another eample of a progress / degree of completeion gauge. In its
default state it looks like the following</p>
</td>
</tr>
<tr>
<td valign="top">

<pre class="csharpcode"> 
        <span class="kwrd">&lt;</span><span class="html">db:DiamondSlider</span> <span class="attr">Value</span><span class="kwrd">=&quot;50&quot;</span> <span class="kwrd">/&gt;</span></pre>

</td>
<td>
<object type="application/x-silverlight" height="35" width="140">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Diam1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
</tr>
<tr>
<td colspan="2">
<p>By default the background is a gradient with green as the left color, yellow at the mid pont and red at the right. These
colors can of course be modified via markup or code.</p>

<p>THe following propertes exist</p>
<ul>
<li>DiamondColor - the fill color of the diamond, SlateBlue in the example above</li>
<li>LeftGradient (Green by default)</li>
<li>MidGradient (Yellow by default)</li>
<li>RightGradient (Red by default)</li>
</ul>

<p>Here is an example that shows all of the properties in action. We only show the markup for a single 
instance but show three to allow you to see the effect of the gradient range. My freezer has a thermometer
that looks just like this. </p>

</td>
</tr>


<tr>
<td valign="top">
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:DiamondSlider</span> <span class="attr">Value</span><span class="kwrd">="0"</span> 
            <span class="attr">DiamondColor</span><span class="kwrd">="AntiqueWhite"</span>
            <span class="attr">LeftGradient</span><span class="kwrd">="AliceBlue"</span>
            <span class="attr">MidGradient</span><span class="kwrd">="Beige"</span>
            <span class="attr">RightGradient</span><span class="kwrd">="CornflowerBlue"</span>
        <span class="kwrd">/&gt;</span></pre>
</td>

<td>
<object type="application/x-silverlight" height="140" width="140">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Diam2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
</tr>


 </table>



</asp:Content>

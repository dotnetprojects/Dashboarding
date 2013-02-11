<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TickCross.aspx.cs" Inherits="AspNetApplication.Pages.TickCross" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>TickCross</h2>



<p>A <code>TickCross</code> control is a binary control. A binary control is initialized via
the <code>IsTrue</code> property. Internally boolean controls still used the Value property
and handle the value as 0 == false , and 100 == true. </p>

<p> Boolean controls show as green in their true state and red in their false view. These
colors are of course customizable as true is not always good, and neither is false always bad (dead == false, works for me every time).</p>

<p>The default view is as follows</p>

<center><object type="application/x-silverlight" height="32" width="400">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=TickCrossBase,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></center>

<p>In common with all booleans controls <code>TickCross</code> has the following properties that can be set</p>

<ul>
<li>IsTrue</li>
<li>FalseColor</li>
<li>TrueColor</li>
</ul>

<!-- DB - this should be a color range, reuse stuff from Dial360 -->

<p>As already mentioned the <code>IsTrue</code> property is a convienience property for setting the <code>Value</code>, The <code>TrueColor</code> and <code>FalseColor</code>s are 
Color points as described here 
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Pages/Dial360.aspx">see Dial360</asp:HyperLink>. </p>

<p>We set the colors for true and false in the same way that we did for the RoundLed 
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Pages/RoundLed.aspx">so check that out</asp:HyperLink>.</p>

<p>Here we will limit ourselves to presenting the XAML and the corresponding visuals</p>


<Table>
<tr>
<td >

        <pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:TickCross</span> <span class="attr">Width</span><span class="kwrd">="16"</span> <span class="attr">Height</span><span class="kwrd">="16"</span> <span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:BinaryDashboard.TrueColor</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#777777"</span> <span class="attr">LowColor</span><span class="kwrd">="#33ff33"</span> <span class="attr">Value</span><span class="kwrd">="9"</span> <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:BinaryDashboard.TrueColor</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:BinaryDashboard.FalseColor</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#666666"</span> <span class="attr">LowColor</span><span class="kwrd">="#999999"</span> <span class="attr">Value</span><span class="kwrd">="9"</span> <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:BinaryDashboard.FalseColor</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:TickCross</span><span class="kwrd">&gt;</span></pre>

</td>
<td>
<object type="application/x-silverlight" height="96" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=TickCrossCustom,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
                </td>
</tr>
</Table>

</asp:Content>

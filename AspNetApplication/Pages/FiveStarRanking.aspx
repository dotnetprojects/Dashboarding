<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FiveStarRanking.aspx.cs" Inherits="AspNetApplication.Pages.FiveStarRanking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<H2>FiveStarRanking</H2>

<p>The <code>FiveStarRanking</code> control is one of those classics you see em everywhere on the net these days . 
I first remember seeing one on my iPod years ago.</p>

<p>In normal operation the control maps values 0..100 into fractional star rankings.</p>

<center><object type="application/x-silverlight" height="110" width="400">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=FiveStarBasic,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></center>

<p>The <code>FiveStarRanking</code> control has two visual properties that the user an set</p>
<ul>
<li>the <code>InRankColor</code></li>
<li>the <code>OutRankColor</code></li>
</ul>

<p>The <code>InRankColor</code> is the color of a star (or part of a star) that is in the rank (the gold color in the
example above). The <code>OutRankColor</code> is the color of stars that are not in the rank (black in the example above).</p>

<p>Both the <code>InRankColor</code> and the <code>OutRankColor</code> properties are <code>ColorPoint</code> take values, describing
the start and end colors of a gradient fill. Here is an example</p>

<table>
<tr>
<td>
            
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking</span> <span class="attr">Value</span><span class="kwrd">="50"</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking.InRankColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#999999"</span> <span class="attr">LowColor</span><span class="kwrd">="#FFFFFF"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:FiveStarRanking.InRankColor</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking.OutRankColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#000000"</span> <span class="attr">LowColor</span><span class="kwrd">="#222222"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:FiveStarRanking.OutRankColor</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:FiveStarRanking</span><span class="kwrd">&gt;</span>


        <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking</span>  <span class="attr">Value</span><span class="kwrd">="50"</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking.InRankColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#440044"</span> <span class="attr">LowColor</span><span class="kwrd">="#FF00FF"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:FiveStarRanking.InRankColor</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking.OutRankColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#000000"</span> <span class="attr">LowColor</span><span class="kwrd">="#330033"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:FiveStarRanking.OutRankColor</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:FiveStarRanking</span><span class="kwrd">&gt;</span>
</pre>            
            
            
            
            
            
            
</td>

<td width="300">



<center><object type="application/x-silverlight" height="300" width="120">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=FiveStarColors,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object></center>

</td>

</tr>

</table>


</asp:Content>

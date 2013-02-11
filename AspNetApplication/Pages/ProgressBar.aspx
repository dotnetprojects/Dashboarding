<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgressBar.aspx.cs" Inherits="AspNetApplication.Pages.ProgressBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>ProgressBar</h2>


<table>
<tr>
<td colspan="2">
<p>The progress bar show the percentage complete status os an item as a horizontal
bar</p>
<p>Unadorned the PorgressBar has the following appearance</p>
</td>
</tr>

<tr>
<td valign="top">

<pre class="csharpcode"> 
        <span class="kwrd">&lt;</span><span class="html">db:ProgressBar</span> <span class="attr">Value</span><span class="kwrd">=&quot;50&quot;</span> <span class="kwrd">/&gt;</span></pre>

</td>
<td>

<object type="application/x-silverlight" height="40" width="120">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Prog1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>


<tr>
<td colspan="2">

<p>There are three properties that change the visuals</p>

<ul>
<li>OutlineColor</li>
<li>InProgressColor</li>
<li>OutOfProgressColor</li>
</ul>

<p>Progress that is complete is displayed in the <code>InProgressColo</code>r, parts of the
gauge representing territory yet to be covered is shown in the <code>OutOfProgressColor</code>. The 
<code>Outline</code> color is the border around the boxes that make up the gauge</p>

<p>In the above gauge the <code>InProgressColor</code> is cyan, the <code>OutOfProgressColor</code> is light gray
and the <code>OutlineColor</code> is Black.</p>

<p>The actual values are not colors but ColorPoints which allow us to specify
gradients for the color. For a description of color points look at the Dial360 control</p>

<p>Here are two example gauges showing the full range of possibilities, the second
is deliberately garish to highlight what color effects what visuals</p>

</td>

</tr>


<tr>
<td>

<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:ProgressBar</span> <span class="attr">OutlineColor</span><span class="kwrd">="Gray"</span> 
            <span class="kwrd">&lt;</span><span class="html">db:ProgressBar.InProgressColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#440044"</span> <span class="attr">LowColor</span><span class="kwrd">="#FF00FF"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:ProgressBar.InProgressColor</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:ProgressBar.OutOfProgressColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="#000000"</span> <span class="attr">LowColor</span><span class="kwrd">="#330033"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:ProgressBar.OutOfProgressColor</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:ProgressBar</span><span class="kwrd">&gt;</span>


        <span class="kwrd">&lt;</span><span class="html">db:ProgressBar</span> <span class="attr">OutlineColor</span><span class="kwrd">="Red"</span> 
            <span class="kwrd">&lt;</span><span class="html">db:ProgressBar.InProgressColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="Yellow"</span> <span class="attr">LowColor</span><span class="kwrd">="Pink"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:ProgressBar.InProgressColor</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:ProgressBar.OutOfProgressColor</span> <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:ColorPoint</span> <span class="attr">HiColor</span><span class="kwrd">="Blue"</span> <span class="attr">LowColor</span><span class="kwrd">="Green"</span>  <span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">db:ProgressBar.OutOfProgressColor</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">db:ProgressBar</span><span class="kwrd">&gt;</span></pre>

</td>
<td>

<object type="application/x-silverlight" height="350" width="120">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Prog2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>




</table>


</asp:Content>

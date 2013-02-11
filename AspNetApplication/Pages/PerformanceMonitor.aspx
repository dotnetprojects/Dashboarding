<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceMonitor.aspx.cs" Inherits="AspNetApplication.Pages.PerformanceMonitor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>PerformanceMonitor</h2>

<p>The <code>PerformanceMonitor</code> dashbard control was inspired by the Windows Task Manager performance
graph for CPU usage. Out of the box this control has the following appearance:</p>

<center>

<object type="application/x-silverlight" height="120" width="300">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=PerformanceMonitorBasic,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</center>

<p>The <code>PerformanceMonitor</code> control has the following configuarble properties</p>
<ul>
<li><code>GridLine</code>: Color of the lines in the background grid</li>
<li><code>GraphLine</code>: Color of the graph line</li>
<li><code>TextColor</code>: Color of the min/max text</li>
<li><code>Axis</code>: Color of the horizontal and vertical axes</li>
<li><code>GraphFillFrom</code>The control fills the space between the line and the base with a gradient fill, this sets the color at one end</li>
<li><code>GraphFillTo</code>The control fills the space between the line and the base with a gradient fill, this sets the color at one end</li>
</ul>

<p>The first example below shows what can be done with a little XAML loving. The second example uses garish
colors to highlight what mark up effects which areas of the chart, the third example shows how setting the graph
fill colors to 100% transparent allow you to display only the line</p>

<table>
<tr>
<td valign="top">
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:PerformanceMonitor</span> <span class="attr">x:Name</span><span class="kwrd">="_l"</span> 
            <span class="attr">GridLine</span><span class="kwrd">="AntiqueWhite"</span>
            <span class="attr">GraphLine</span><span class="kwrd">="White"</span>
            <span class="attr">Axis</span><span class="kwrd">="Bisque"</span>
            <span class="attr">TextColor</span><span class="kwrd">="BlanchedAlmond"</span>
            <span class="attr">GraphFillFrom</span><span class="kwrd">="Gray"</span>
            <span class="attr">GraphFillTo</span><span class="kwrd">="DarkGray"</span><span class="kwrd">/&gt;</span>

            <span class="kwrd">&lt;</span><span class="html">db:PerformanceMonitor</span> <span class="attr">x:Name</span><span class="kwrd">="_l2"</span> 
            <span class="attr">GridLine</span><span class="kwrd">="White"</span>
            <span class="attr">GraphLine</span><span class="kwrd">="LightGreen"</span>
            <span class="attr">Axis</span><span class="kwrd">="Red"</span>
            <span class="attr">TextColor</span><span class="kwrd">="Yellow"</span>
            <span class="attr">GraphFillFrom</span><span class="kwrd">="Blue"</span>
            <span class="attr">GraphFillTo</span><span class="kwrd">="Magenta"</span><span class="kwrd">/&gt;</span>

            <span class="kwrd">&lt;</span><span class="html">db:PerformanceMonitor</span> <span class="attr">x:Name</span><span class="kwrd">="_l3"</span> 
            <span class="attr">GridLine</span><span class="kwrd">="BlueViolet"</span>
            <span class="attr">GraphLine</span><span class="kwrd">="Magenta"</span>
            <span class="attr">Axis</span><span class="kwrd">="LightSteelBlue"</span>
            <span class="attr">TextColor</span><span class="kwrd">="Lavender"</span>
            <span class="attr">GraphFillFrom</span><span class="kwrd">="#00000000"</span>
            <span class="attr">GraphFillTo</span><span class="kwrd">="#00000000"</span><span class="kwrd">/&gt;</span> </pre>

</td>
<td>
<object type="application/x-silverlight" height="460" width="300">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=PerformanceMonitor,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>
</table>

</asp:Content>



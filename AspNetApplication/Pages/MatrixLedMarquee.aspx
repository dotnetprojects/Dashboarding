<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MatrixLedMarquee.aspx.cs" Inherits="AspNetApplication.Pages.MatrixLedMarquee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>MatrixLedMarquee</h2>

<table>
<tr>
<td colspan="2">
<p>The <code>MatrixLedMarquee</code> control is a scrolling LED  display. It is modelled on the early 
monochrome versions. As usual on the Silverlight Dashboard project the mode is fully go-retro.
</p>

<p>As usual we start with a basic example to get us going. </p>

<p>The marquee in code (as in real life) is constructed from multiple panels
that are 5 wide by seven high. in code we specify this via the Panels property,
the message can be specified in XAML by the Text property</p>
</td>
</tr>


<tr>
<td>
<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span> 
                <span class="attr">Panels</span><span class="kwrd">="10"</span> 
                <span class="attr">Text</span><span class="kwrd">="Hello Silverlight."</span><span class="kwrd">/&gt;</span>
</pre>
</td>
<td>

<object type="application/x-silverlight" height="50" width="270">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Mat1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>

<tr>
<td colspan="2"><p> There are properties to specified the on and off colors of the LEDS
<code>LedOnColor</code> and not unsurprisingly <code>LedOffColor</code> 
You can also specify the interval between steps for the anination using the 
<code>TimerDuration</code> property.</p>

<p>Which gives us:</p>

</td>
</tr>

<tr>
<td>

<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span> 
                <span class="attr">TimerDuration</span><span class="kwrd">="00:00:0.1"</span>
                <span class="attr">LedOnColor</span><span class="kwrd">="#FFFF00FF"</span>
                <span class="attr">LedOffColor</span><span class="kwrd">="#22FF00FF"</span>
                <span class="attr">Panels</span><span class="kwrd">="10"</span> 
                <span class="attr">Text</span><span class="kwrd">="Hello Silverlight."</span><span class="kwrd">/&gt;</span></pre>


</td>
<td>
<object type="application/x-silverlight" height="50" width="270">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Mat2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
</tr>

<tr>
<td colspan="2">
<h3>Modes</h3>
<p>As you will see when the above animation completes, the marquee is empty. That's because the default mode for the 
<code>MatrixLedMarquee</code> is SingleShot and we don't supply additional text.</p>
<p>The three modes that the <code>MatrixLedMarquee</code> supports are:</p>
<ul>
<li>SingleShot</li>
<li>Continuous</li>
<li>Motionless</li>
</ul>

<p><b><i>SingleShot</i></b>: The text is scrolled once, whe the last digit is fully rendered on the 
panel, the <code>MatrixLedMarquee</code> will raise an event allowing you to set the next piece of text. </p>

<p><b><i>Continuous</i></b>: The text is scrolled, when it comes to an end the text is started again.</p>

<p><b><i>Motionless</i></b>: The Text is not scrolled, it is rendered in place and alligned according to
the TextAlign property. </p>

<p>For SingleShot and Continuous modes: the new text goes straight on after the 
previous one, it is up to the caller to pad with spaces as required.</p>

</td>

</tr>

<tr>
<td></td>
<td></td>
</tr>

<tr>
<td colspan="2">
<br />
<h4>SingleShot</h4>

<p>Single shot can be fire and forget, but it can also be useful for a news ticker, where after a headline has finished 
scrolling, you retrieve the next one and start it away.</p>

</td>
</tr>

<tr>
<td>

<p>The XAML for the control initializes it and sets up the event handler</p>

<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span> <span class="attr">Panels</span><span class="kwrd">="10"</span> <span class="attr">TimerDuration</span><span class="kwrd">="00:00:0.1"</span>
                <span class="attr">Mode</span><span class="kwrd">="SingleShot"</span> <span class="attr">x:Name</span><span class="kwrd">="_marq"</span>
                <span class="attr">MarqueeFinished</span><span class="kwrd">="_marq_MarqueeFinished"</span>
                <span class="kwrd">/&gt;</span></pre>
    


</td>
<td valign="top">

<object type="application/x-silverlight" height="50" width="270">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Mat3,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>


<tr>
<td colspan="2">

<p>Our user control that hosts the marquee initializes the first text
on load and then the next one after each message finishes.</p>

<p>In reality the list would come from a web service</p>

<pre class="csharpcode">
         <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> Mat3 : UserControl
            {
                <span class="rem">/// &lt;summary&gt;</span>
                <span class="rem">/// Our messages, we will continuously rotate through them</span>
                <span class="rem">/// &lt;/summary&gt;</span>
                List&lt;<span class="kwrd">string</span>&gt; Messages = <span class="kwrd">new</span> List&lt;<span class="kwrd">string</span>&gt;
                {
                    <span class="str">"Message one"</span>,
                    <span class="str">"Message two"</span>,
                    <span class="str">"Message three"</span>
                };

                <span class="rem">/// &lt;summary&gt;</span>
                <span class="rem">/// Constructs a Mat3</span>
                <span class="rem">/// &lt;/summary&gt;</span>
                <span class="kwrd">public</span> Mat3()
                {
                    InitializeComponent();

                    Loaded += <span class="kwrd">new</span> RoutedEventHandler(IAmLoaded);
                }

                <span class="rem">/// &lt;summary&gt;</span>
                <span class="rem">/// Control is loaded set the first message</span>
                <span class="rem">/// &lt;/summary&gt;</span>
                <span class="kwrd">void</span> IAmLoaded(<span class="kwrd">object</span> sender, RoutedEventArgs e)
                {
                    SetNextMessage();
                }

                <span class="rem">/// &lt;summary&gt;</span>
                <span class="rem">/// Marquee has finished animating, get the next message going</span>
                <span class="rem">/// &lt;/summary&gt;</span>
                <span class="kwrd">private</span> <span class="kwrd">void</span> _marq_MarqueeFinished(<span class="kwrd">object</span> sender, EventArgs e)
                {
                    SetNextMessage();
                }

                <span class="kwrd">int</span> _message = 0;
                <span class="rem">/// &lt;summary&gt;</span>
                <span class="rem">/// Sets the next message and puts a little place holder between em</span>
                <span class="rem">/// &lt;/summary&gt;</span>
                <span class="kwrd">private</span> <span class="kwrd">void</span> SetNextMessage()
                {
                    _marq.Text = Messages[_message] + <span class="str">" * "</span>;
                    _message += 1;
                    <span class="kwrd">if</span> (_message &gt; Messages.Count -1 )
                    {
                        _message = 0;
                    }
                }
            }</pre>


</td>
</tr>


<tr>
<br />
<td colspan="2">
<h4>Continuous</h4>

<p>Continuous operation is as simple as setting the text and the mode to Continious. Note that
the Text defintion has an space at the end to sperate the next copy from the previous one</p>

</td>
</tr>


<tr>
<td>

<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span> 
                <span class="attr">Panels</span><span class="kwrd">="10"</span> 
                <span class="attr">TimerDuration</span><span class="kwrd">="00:00:0.1"</span>                             
                <span class="attr">Mode</span><span class="kwrd">="Continuous"</span>
                <span class="attr">Text</span><span class="kwrd">="David Black "</span><span class="kwrd">/&gt;</span></pre>
            </td>
<td>

<object type="application/x-silverlight" height="50" width="270">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Mat4,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>


<tr>
<td colspan="2">
<br />
<h4>Motionless</h4>

<p>For motonless text we set the text, the Model to motionless and !
nothing much else happens :-). Seen here with text left, right and center justified</p>

</td>
</tr>


<tr>
<td valign="top">

<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span> <span class="attr">Panels</span><span class="kwrd">="10"</span> <span class="attr">Mode</span><span class="kwrd">="Motionless"</span>
                <span class="attr">TextAlignment</span><span class="kwrd">="Left"</span> <span class="attr">Text</span><span class="kwrd">="lft"</span> <span class="kwrd">/&gt;</span>

            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span>  <span class="attr">Panels</span><span class="kwrd">="10"</span> <span class="attr">Mode</span><span class="kwrd">="Motionless"</span>
                <span class="attr">TextAlignment</span><span class="kwrd">="Right"</span> <span class="attr">Text</span><span class="kwrd">="rgt"</span> <span class="kwrd">/&gt;</span>       
                
            <span class="kwrd">&lt;</span><span class="html">db:MatrixLedMarquee</span>  <span class="attr">Panels</span><span class="kwrd">="10"</span> <span class="attr">Mode</span><span class="kwrd">="Motionless"</span>
                <span class="attr">TextAlignment</span><span class="kwrd">="Center"</span> <span class="kwrd"> <span class="attr">Text</span><span class="kwrd">="cent"</span> /&gt;</span>
            </pre>


</td>
<td>

<object type="application/x-silverlight" height="150" width="300">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Mat5,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>

<tr>
<td colspan="2">
<br />
<h3>Character set</h3>

<p>The current release supports the most common characters for English. Further support will be added
if an when requested. Please note this control is very low resolution and as such will not
support Japanese or Chinese characters. I would need to create a 24 by 16 matrix for that to be possible</p>

<p>There is a very basic font editor available on the demo site I will include instructions on how to
ue it later if required.</p>

<p>Current character support is </p>
<center>
<object type="application/x-silverlight" height="360" width="340">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Mat6,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</center>

</td>
</tr>

<tr>
<td></td>
<td></td>
</tr>

<tr>
<td></td>
<td></td>
</tr>

<tr>
<td></td>
<td></td>
</tr>

</table>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Odometer.aspx.cs" Inherits="AspNetApplication.Pages.Odometer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>Odometer</h2>

<p>Yet another control that belongs at the heart of a car dashboard as well an executive one! The <code>Odometer</code>
is a flexible control with quite a lot of operational options but curently few visual ones.</p>
<p>An <code>Odometer</code> can show between one and ten digits and is based on an <code>Int32</code> so it has
a maximum of 2,147,483,647. There is no indicator for negative values yet, so it is only usable on natural numbers.</p>

<p>I read the other day that there are 4.4 babies born every second. Our first example shows how many babies have been born
since the Silverlight control loaded. The example shows is an <code>Odometer</code> with an initial value of 0 configured to show 5 digits
and to auto-increment every 0.22 seconds. I also think this is a quite scary example :-)</p>



<center>
<table>
<tr>
<td align="left" width="40%">
<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:Odometer</span> 
<span class="attr">Digits</span><span class="kwrd">="5"</span> 
<span class="attr">InitialValue</span><span class="kwrd">="0"</span> 
<span class="attr">Interval</span><span class="kwrd">="0.22"</span> 
<span class="attr">MeterMode</span><span class="kwrd">="AutoIncrement"</span> <span class="kwrd">/&gt;</span>
</pre>

</td>

<td width="40%">

<object type="application/x-silverlight" height="100" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Odd1,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>


</tr>

</table>
</center>

<p>Lets examine the proprties of the <code>Odometer</code></p>

    <ul>
        <li>Digits</li>
        <ul>
            <li>Sets the number of digits to display</li>
            <li>Will be overridden if the <code>InitialValue</code> requires more digits</li>
            <li>Is optional for controls with an <code>InitialValue</code> set (<code>Digits</code> takes preference if it is larger than the number of digits in <code>InitialValue</code>.</li>
        </ul>

        <li>MeterMode (enum)</li>
        <ul>
            <li>AutoIncrement</li>
                <ul>
                    <li>Starting from the value of <code>InitialValue</code> add one to the value of the control every <code>Interval</code> seconds</li>
                    <li>Will wrap over after it runs out of digits so if <code>Digits == 3</code>, then 999 rolls over to 000 and then increments from there</li>
                </ul>
            <li>AutoDecrement</li>
                <ul>
                    <li>Starting from the value of <code>InitialValue</code> subtract one from the value of the control every <code>Interval</code> seconds</li>
                    <li>Will wrap over after it runs out of digits so if <code>Digits == 3</code> then 000 rolls over to 999 and then decrements from there</li>
                </ul>
            <li>InitialToFinal</li>
                <ul>
                    <li>Starting from the value of <code>InitialValue</code> move one increment/decrement towards <code>FinalValue</code> every <code>Interval</code> seconds</li>
                    <li>Stops when it reaches final value</li>
                    <li>Decrement or increments Based on which value is the higher (<code>InitialValue</code> or <code>FinalValue</code>)</li>
                </ul>
            <li>Static</li>
                <ul>
                    <li>Sets the InitialValue into the control and doe no further processing</li>
                    <li>The user may call the <code>Odometer</code> functions <code>Increment</code> and <code>Decrement</code> to change the value manually</li>
                    <li>This is the mode for your retro page visit counter (go on, I dare ya)</li>
                </ul>
        </ul>

        <li>Interval</li>
        <ul>
            <li>Sets the update freqency in fractional seconds for automatically driven <code>Odometer</code>s (See <code>MeterMode</code>)</li>
        </ul>
        
    </ul>

<p>Here are a few quick examples, here we are setting the values in XAML you could also set the values in code.</p>

<table >
<tr>
<td colspan="2"><h3>Digits</h3></td>
</tr>
<tr>
<td valign="top" >

<pre class="csharpcode">
        <span class="rem">&lt;!-- Digits inferred from InitialValue --&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:Odometer</span>  <span class="attr">InitialValue</span><span class="kwrd">="123"</span> <span class="attr">MeterMode</span><span class="kwrd">="Static"</span> <span class="kwrd">/&gt;</span>



      
        <span class="rem">&lt;!-- Digits larger than digits in InitialValue, Digits overrides InitialValue --&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">Digits</span><span class="kwrd">="4"</span> <span class="attr">InitialValue</span><span class="kwrd">="123"</span>  <span class="attr">MeterMode</span><span class="kwrd">="Static"</span> <span class="kwrd">/&gt;</span>



      
        <span class="rem">&lt;!-- Digits less than digits in InitialValue, InitialValue overrides Digits--&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">Digits</span><span class="kwrd">="3"</span> <span class="attr">InitialValue</span><span class="kwrd">="1234"</span> <span class="attr">MeterMode</span><span class="kwrd">="Static"</span> <span class="kwrd">/&gt;</span>
</pre>


</td>
<td  >

                <object type="application/x-silverlight" height="136" width="40">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Odd2,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>

</tr>


<tr>
<td colspan="2"><h3>Autoincrement,AutoDecrement and Interval</h3></td>
</tr>
<tr>
<td valign="top"  >
<pre class="csharpcode">
            <span class="rem">&lt;!-- Start at 1901 and up you go two ticks per second--&gt;</span>
            <span class="rem">&lt;!-- Because InitialValue has only one digit, we use Digits to force the width--&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">Digits</span><span class="kwrd">="4"</span> <span class="attr">InitialValue</span><span class="kwrd">="0"</span> <span class="attr">MeterMode</span><span class="kwrd">="AutoIncrement"</span> <span class="attr">Interval</span><span class="kwrd">="0.5"</span><span class="kwrd">/&gt;</span>


            <span class="rem">&lt;!-- start at 9999 and start reducing one tick every two seconds--&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:Odometer</span>  <span class="attr">InitialValue</span><span class="kwrd">="9999"</span>  <span class="attr">MeterMode</span><span class="kwrd">="AutoDecrement"</span> <span class="attr">Interval</span><span class="kwrd">="2.0"</span><span class="kwrd">/&gt;</span></pre>


</td>
<td  >

                <object type="application/x-silverlight" height="160" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Odd3,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>

</tr>


<tr>
<td colspan="2"><h3>InitialToFinal</h3></td>
</tr>
<tr>
<td valign="top"  >

<pre class="csharpcode">
        <span class="rem">&lt;!-- Start at 1901 and up you go to 2001, then stop--&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">InitialValue</span><span class="kwrd">="1901"</span> <span class="attr">FinalValue</span><span class="kwrd">="2001"</span> <span class="attr">MeterMode</span><span class="kwrd">="InitialToFinal"</span> <span class="kwrd">/&gt;</span>



        <span class="rem">&lt;!-- Start at 2001 and down you go to 1901, then stop--&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">InitialValue</span><span class="kwrd">="2001"</span> <span class="attr">FinalValue</span><span class="kwrd">="1901"</span> <span class="attr">MeterMode</span><span class="kwrd">="InitialToFinal"</span> <span class="kwrd">/&gt;</span>

  </pre>

</td>
<td  >

                <object type="application/x-silverlight" height="160" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Odd4,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>

</tr>


<tr><td Colspan="2">
<h3>Programatic access</h3>
</td></tr>

<tr>
<td>
<p>We want to use two buttons to programatically update the <code>Odometer</code></p>
<p>XAML to declare two buttons and an <code>Odometer</code></p>

<pre class="csharpcode">
             <span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Horizontal"</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="up"</span> <span class="attr">Width</span><span class="kwrd">="25"</span> <span class="attr">Content</span><span class="kwrd">="^"</span> <span class="attr">Click</span><span class="kwrd">="up_Click"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">x:Name</span><span class="kwrd">="_od"</span> <span class="attr">Digits</span><span class="kwrd">="3"</span> <span class="attr">MeterMode</span><span class="kwrd">="Static"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="down"</span> <span class="attr">Width</span><span class="kwrd">="25"</span> <span class="attr">Content</span><span class="kwrd">="v"</span> <span class="attr">Click</span><span class="kwrd">="down_Click"</span><span class="kwrd">/&gt;</span>
             <span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span></pre>

<p>Here is the code behind for the two buton click methods</p>

            <pre class="csharpcode">
            <span class="kwrd">private</span> <span class="kwrd">void</span> up_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e)
            {
                _od.Increment();
            }

            <span class="kwrd">private</span> <span class="kwrd">void</span> down_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e)
            {
                _od.Decrement();
            }</pre>

<p>Try clicking on the buttons</p>
</td>
<td valign="top">

                <object type="application/x-silverlight" height="50" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Odd5,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>



</td>

</tr>

<tr>
<td colspan="2">
<p>You arn't just restricted to updating the least significant digit, any digit can be manipulated</p>
<p>The idea behind this is: if you are using a <code>Odomiter</code> as a current score control
in a game, calling increment 1000 times if a mothership is hit would be a pain!</p>
<p>Increment() has an overload that takes an <code>IncrementDecrementDigit</code> that
specifies which digit to increment (list is included at the end of the article) </p>
<p>The markup for the control is</p>
</td>

<tr>
<td>
<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Vertical"</span><span class="kwrd">&gt;</span>
               <span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Horizontal"</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="_inc3"</span> <span class="attr">Height</span><span class="kwrd">="20"</span> <span class="attr">Width</span><span class="kwrd">="40"</span> <span class="attr">Content</span><span class="kwrd">="^"</span> <span class="attr">Click</span><span class="kwrd">="_inc3_Click"</span><span class="kwrd">/&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="_inc2"</span> <span class="attr">Height</span><span class="kwrd">="20"</span> <span class="attr">Width</span><span class="kwrd">="40"</span>  <span class="attr">Content</span><span class="kwrd">="^"</span> <span class="attr">Click</span><span class="kwrd">="_inc2_Click"</span><span class="kwrd">/&gt;</span> 
                    <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="_inc1"</span> <span class="attr">Height</span><span class="kwrd">="20"</span> <span class="attr">Width</span><span class="kwrd">="40"</span>  <span class="attr">Content</span><span class="kwrd">="^"</span> <span class="attr">Click</span><span class="kwrd">="_inc1_Click"</span><span class="kwrd">/&gt;</span> 
                <span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">db:Odometer</span> <span class="attr">x:Name</span><span class="kwrd">="_od"</span> <span class="attr">Digits</span><span class="kwrd">="3"</span> <span class="attr">MeterMode</span><span class="kwrd">="Static"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Horizontal"</span><span class="kwrd">&gt;</span>
                     <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="_dec3"</span> <span class="attr">Height</span><span class="kwrd">="20"</span> <span class="attr">Width</span><span class="kwrd">="40"</span> <span class="attr">Content</span><span class="kwrd">="v"</span> <span class="attr">Click</span><span class="kwrd">="_dec3_Click"</span><span class="kwrd">/&gt;</span>
                     <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="_dec2"</span> <span class="attr">Height</span><span class="kwrd">="20"</span> <span class="attr">Width</span><span class="kwrd">="40"</span>  <span class="attr">Content</span><span class="kwrd">="v"</span> <span class="attr">Click</span><span class="kwrd">="_dec2_Click"</span><span class="kwrd">/&gt;</span>
                     <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">="_dec1"</span> <span class="attr">Height</span><span class="kwrd">="20"</span> <span class="attr">Width</span><span class="kwrd">="40"</span>  <span class="attr">Content</span><span class="kwrd">="v"</span> <span class="attr">Click</span><span class="kwrd">="_dec1_Click"</span><span class="kwrd">/&gt;</span>
                 <span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span></pre>
<p>The code behind for each button click just calls the corresponding Incrememt / Decrement call</p>


            <pre class="csharpcode">
            <span class="kwrd">private</span> <span class="kwrd">void</span> _inc3_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e){
                _od.Increment(Odometer.IncrementDecrementDigit.Hundreds);
            }

            <span class="kwrd">private</span> <span class="kwrd">void</span> _inc2_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e){
                _od.Increment(Odometer.IncrementDecrementDigit.Tens);
            }

            <span class="kwrd">private</span> <span class="kwrd">void</span> _inc1_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e){
                _od.Increment(Odometer.IncrementDecrementDigit.Units);
            }

            <span class="kwrd">private</span> <span class="kwrd">void</span> _dec3_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e){
                _od.Decrement(Odometer.IncrementDecrementDigit.Hundreds);
            }

            <span class="kwrd">private</span> <span class="kwrd">void</span> _dec2_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e){
                _od.Decrement(Odometer.IncrementDecrementDigit.Tens);
            }

            <span class="kwrd">private</span> <span class="kwrd">void</span> _dec1_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e){
                _od.Decrement(Odometer.IncrementDecrementDigit.Units);
            }</pre>


</td>

<td valign="top">

                <object type="application/x-silverlight" height="130" width="200">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Odd6,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>



</td>

</tr>
</table>


<p>Ok, if you read this far and paid attention to the content, scroll back up to the first example and have a look at how many people have been
born since you started reading this. Its quite a sobering fact, unless you manufacture cigars that is :-)</p>

<p>Just for reference here is the defintion of the  <code>IncrementDecrementDigit</code> enum </p>


<pre class="csharpcode">
 <span class="kwrd">public</span> <span class="kwrd">enum</span> IncrementDecrementDigit
        {

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 1, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            Units = 1,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 10, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            Tens = 2,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 100, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            Hundreds = 3,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 1000, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            Thousands = 4,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 10000, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            TensOfThousands = 5,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 100000, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            HundredsOfThousands = 6,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 1000000, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            Millions = 7,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 10000000, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            TensOfMillions = 8,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 100000000, the control will automatically roll over if necessary</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            HundredsOfMillions = 9,

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Increment the value by 10000000000, the control will automatically roll over </span>
            <span class="rem">/// if necessary. Pleas note: We are based on an Int32 at the moment so the tenth</span>
            <span class="rem">/// digit can  only be 0,1 or 2</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            Billions = 10,
        };
</pre>

</asp:Content>

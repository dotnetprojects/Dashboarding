<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultOld.aspx.cs"
    Inherits="AspNetApplication.Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        Welcome</h2>
    <p>
        There are <em>19</em> dials and gauges in the Codeplex.Dashboarding library. This tutorial
        will show you how to embed the Silverlight guages and dials into your own silverlight
        applications.</p>
    
    <p>Get the latest version of the controls from the Codeplex project 
    <asp:HyperLink ID="HyperLink2" NavigateUrl="http://www.codeplex.com/dashboarding" runat="server">David's Silverlight Dashboards</asp:HyperLink>.
</p>

    <p>
        Before we start here is a little gratuitous eye-candy to show you where we are going
        :-) (Hover over a control to see the control name)</p>
    <br />
    <object type="application/x-silverlight" height="200" width="800">
        <param name="source" value="ClientBin/SilverlightApplication.xap" />
        <!-- startPage key can have values Page1 or Page2 -->
        <param name="initParams" value="demo=TopStrip" />
        <param name="background" value="Transparent" />
        <param name="windowless" value="True" />
    </object>   
    <br />
    <p>
        The above example shows the following controls:</p>
    <ul>
        <li>Scrolling MetrixLedMarquee</li>
        <li>Dial360, Dial180North, Knob360, Dial90NorthWest, Dial90NorthEast, Dial90SouthWest, Dial90SouthEast</li>
        <li>DecadeVuMeter</li>
        <li>RoundLed, TickCross</li>
        <li>PerformanceMonitor</li>
        <li>FiveStarRanking, ProgressBar, DiamondSlider</li>
        <li>SixteenSegmentLed</li>
        <li>Odometer</li>
        <li>WallThermometer, Thermometer</li>
        
    </ul>
    <p>
        New dials and gauges will be added as time goes by, so check back here ocassionally
        or visit the <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.codeplex.com/dashboarding">Codeplex project</asp:HyperLink> to see whats new.</p>
    <h2>
        Getting started</h2>
    <p>
        Before we wade in to the XAML for declaring dashboard controls, we need to look
        at the requirements for creating a project using them. The controls are declared
        in an assembly named <code>Codeplex.Dashboarding.dll</code> you can find the assembly
        in the xap file shiped with the example .NET solution (rename.xap to .zip and extract).
    </p>
    <p>
        As time goes by we may move the assembly into an easier to find location! Once you
        have the assembly from the xap file, add it as a reference to your Silverlight application</p>
    <p>
        To add controls to a XAML file you need to create a namespace, to make the samples
        consistant we will use the following:</p>
    <p>
        <code>xmlns:db="clr-namespace:Codeplex.Dashboarding;assembly=Codeplex.Dashboarding"
 
        </code>
    </p>
    <p>
        The namespace with the prefix <code>db</code> contains all dashboard controls.</p>
    <p>
        If you prefer using Expression Blend over hacking XAML then Blend will add a namespace
        declaration automatically for the <code>Codeplex.Dashboarding</code>
        namespace when you drag a control on to the design surface. </p>
    <h3>
        First steps
    </h3>
    <p>
        Once you have added the reference to <code>Codeplex.Dashboarding</code> to your
        project and added the two namespace declarations to the top of a control try declaring
        a single dial ( <code>&lt;db:Dial360/&gt;</code>) and see what happens:
    </p>
    <table height="180">
        <tr>
            <td>
                <pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span
                class="kwrd">="SilverlightApplication.SingleGuages.FirstStep"</span>
                <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
                <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span> 
                <span class="attr">xmlns:db</span><span class="kwrd">="clr-namespace:Codeplex.Dashboarding;assembly=Codeplex.Dashboarding"</span>
                    class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">Grid</span> <span class="attr">x:Name</span><span
                    class="kwrd">="LayoutRoot"</span> <span class="attr">Background</span><span class="kwrd">="Transparent"</span><span
                        class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">Grid</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">UserControl</span><span class="kwrd">&gt;</span></pre>
            </td>
            <td>
                <object type="application/x-silverlight" height="160">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=FirstStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                    <param name="EnableFrameRateCounter" value="True" />
                </object>
            </td>
        </tr>
    </table>
    <p>
        Quite unsurprisingly you get a single dial with the default color and no value set.
        We can set a value two ways, using the value attribute in XAML or by setting the
        Value property in the code behind. The value should be in the range 0..100 for now,
        in a subsequent release we will more add Minimum, Maximum properties to allow any
        range to be set..</p>
    <p>
        In markup the value can be set as</p>
    <table height="180">
        <tr>
            <td>
        <pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span
                class="kwrd">="SilverlightApplication.SingleGuages.SecondStep"</span>
               <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
                <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span> 
                <span class="attr">xmlns:db</span><span class="kwrd">="clr-namespace:Codeplex.Dashboarding;assembly=Codeplex.Dashboarding"</span>
                    class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">Grid</span> <span class="attr">x:Name</span><span
                    class="kwrd">="LayoutRoot"</span> <span class="attr">Background</span><span class="kwrd">="Transparent"</span><span
                        class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">Value</span><span
                        class="kwrd">="66"</span> <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">Grid</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">UserControl</span><span class="kwrd">&gt;</span></pre>
            </td>
            <td>
                <object type="application/x-silverlight" height="160">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=SecondStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
            </td>
        </tr>
    </table>
    <p>
        Doing this in the code behind is hardly difficult (except this time we added an
        x:Name attribute to the dial)</p>
    <table height="180">
        <tr>
            <td>
                <pre class="csharpcode">
                 <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> ThirdStep : UserControl
                    {
                        <span class="kwrd">public</span> ThirdStep()
                        {
                            InitializeComponent();
                            Loaded += <span class="kwrd">new</span> RoutedEventHandler(IamLoaded);
                        }

                        <span class="kwrd">void</span> IamLoaded(<span class="kwrd">object</span> sender, RoutedEventArgs e)
                        {
                            Random random = <span class="kwrd">new</span> Random();
                            _dial.Value = random.Next(100);
                        }
                    }</pre>
            </td>
            <td>
                <object type="application/x-silverlight" height="160">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=ThirdStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
            </td>
        </tr>
    </table>
    
    <p>So far we have set the value for the gauge directy in markup and then in code. The
    final appreach to setting the value is data binding. In the next and final demo
    we data bind the value property to the <code>MilesPerHour</code> property of a
    <code>Car</code> class.</p>
    <p>I don't know the <code>Car</code> class says about its author, but the only interesting
    item about a car appears to be how fast it is going :-)</p>
    
    <pre class="csharpcode"> <span class="kwrd">            public</span> <span class="kwrd">class</span> Car
            {
                <span class="kwrd">public</span> <span class="kwrd">double</span> MilesPerHour { get; set; }
            }</pre>

<p>Next we need to crate a new control in mark up and declarativly bind the
<code>Value</code> property to the cars <code>MilesPerHour</code> property</p>
    
<pre class="csharpcode">
            <span class="kwrd">&lt;</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="SilverlightApplication.SingleGuages.FourthStep"</span>
               <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
                <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span> 
                <span class="attr">xmlns:db</span><span class="kwrd">="clr-namespace:Codeplex.Dashboarding;assembly=Codeplex.Dashboarding"</span>
                <span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span> <span class="attr">Background</span><span class="kwrd">="Transparent"</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">db:Dial360</span> <span class="attr">x:Name</span><span class="kwrd">="_dial"</span>  <span class="attr">Value</span><span class="kwrd">="{Binding MilesPerHour, Mode=OneWay}"</span>  <span class="kwrd">/&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">Grid</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">UserControl</span><span class="kwrd">&gt;</span></pre>    
                
<p>Finally in our code behind we set the controls DataContext to an instance of a new
car.</p>
    
    
  <pre class="csharpcode">
             Car porsche = <span class="kwrd">new</span> Car { MilesPerHour = 99 };
             _dial.DataContext = porsche;
             </pre>  
    
    <table height="180">
  
  
     
        <tr>
        <td>                <object type="application/x-silverlight" height="160">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=FourthStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</td>
        <td>et viola! (Which is a French expression - I believe - about musical instruments)</td>

        </tr>
    </table>
<h3>Minimum and Maximum values</h3>
            <p>All of the examples so far have used the default minimum and maximum value range
            of 0 <= n <= 100, which if fine for some cases not so for others. The base <code>Dashboard</code>
            class supports the properties Minimum and Maximum which allow you to specify the range
            of acceptable values. It's very simple to use:</p>
            
<table>
<tr>
<td>
<pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">db:Dial180</span> 
            <span class="attr">Minimum</span><span class="kwrd">="-10"</span> 
            <span class="attr">Maximum</span><span class="kwrd">="10"</span> 
            <span class="attr">Value</span><span class="kwrd">="-7"</span> 
        <span class="kwrd">/&gt;</span>
        </pre>

</td>
<td>

    <object type="application/x-silverlight" Width="520" Height="100">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=FifthStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>
</table>            
<p>As usual we only show thw markup for the first one, the second is set to 2 and the third to 7.</p>   

<p>Controls that have text values on the face such as the Dial360 will alter their face text according
to the mimimum and maximum values. In the example below the first dial has the Minumum and maximum values set to 
-100 and 100 respectivly.</p>         
            
            
<p>The dials normally can only show a small number of digits, if the mimimum and maximum values
are -10000 and 10000 for example the dial is going to look awful. There are two approaches to
fixing this: Use the FaceTextFormat property or set FaceTextVisibility = false.</p></p>            

<p>The face text format property is a standard .NET format string and is applied to the face number
as it is rendered (the parameter number 0 must be supplied). For example assuming -100 .. 100 as the range</p>            
            
<table align="center">
<tr><td>Format</td><td>Displayed as</td></tr>
<tr><td>{0}</td><td>-100, -90, -80 .. 0 .. 90 100</td></tr>
<tr><td>{0:000}</td><td>-100, -090, -080 .. 000 .. 090 100</td></tr>
<tr><td>{0}c</td><td>-100c, -90c, -80c .. 0c .. 90c 100c</td></tr>
</table>            
            
<h3>Two way data binding</h3>            

<p>Previously we created a quick and dirty car class to show one way data binding. Before we can show two
way binding we need to equip the car class for the 21st century and ake it a dependancy object.</p>

<pre class="csharpcode">
        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Class representing a car  and its velocity</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="kwrd">public</span> <span class="kwrd">class</span> Car : DependencyObject, INotifyPropertyChanged
        {
            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// raised when a property changed</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="kwrd">public</span> <span class="kwrd">event</span> PropertyChangedEventHandler PropertyChanged;

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// dependancy property for MilesPerHour</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">readonly</span> DependencyProperty MilesPerHourProperty =
                DependencyProperty.Register(<span class="str">"MilesPerHour"</span>,
                                            <span class="kwrd">typeof</span>(<span class="kwrd">double</span>), <span class="kwrd">typeof</span>(Car),
                                            <span class="kwrd">new</span> PropertyMetadata(<span class="kwrd">new</span> PropertyChangedCallback(MilesPerHourPropertyChanged)));

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Speed in Miles per hour </span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="kwrd">public</span> <span class="kwrd">double</span> MilesPerHour
            {
                get { <span class="kwrd">return</span> (<span class="kwrd">double</span>)GetValue(MilesPerHourProperty); }
                set { SetValue(MilesPerHourProperty, <span class="kwrd">value</span>); }
            }

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Dependancy property changed, raise the PropertyChanged event</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="dependancy"&gt;&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="args"&gt;&lt;/param&gt;</span>
            <span class="kwrd">private</span> <span class="kwrd">static</span> <span class="kwrd">void</span> MilesPerHourPropertyChanged(DependencyObject dependancy, DependencyPropertyChangedEventArgs args)
            {
                Car instance = dependancy <span class="kwrd">as</span> Car;
                <span class="kwrd">if</span> (instance != <span class="kwrd">null</span>)
                {
                    instance.OnPropertyChanged(<span class="str">"MilesPerHour"</span>);
                }
            }

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Property has changed lets inform the waiting world</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="prop"&gt;&lt;/param&gt;</span>
            <span class="kwrd">private</span> <span class="kwrd">void</span> OnPropertyChanged(<span class="kwrd">string</span> prop)
            {
                <span class="kwrd">if</span> (PropertyChanged != <span class="kwrd">null</span>)
                {
                    PropertyChanged(<span class="kwrd">this</span>, <span class="kwrd">new</span> PropertyChangedEventArgs(prop));
                }
            }
        }</pre>

<p>In our next example we are going to create an instance of a car in the code behind and initialize the controls <code>DataContext</code>
to that value.</p>
<p>The markup below shows a slider and a Dashboard cmponent (FiveStarRanking) bound to the same property of the DataContext in
a TwoWay mode. Move the slider and you will see the FiveStarRanking update to show the new value</p>     
     
            
<table>
<tr>
<td>

        <pre class="csharpcode">
        <span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Vertical"</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking</span> <span class="attr">Value</span><span class="kwrd">="{Binding MilesPerHour, Mode=TwoWay}"</span><span class="kwrd">/&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">Slider</span> <span class="attr">Value</span><span class="kwrd">="{Binding MilesPerHour, Mode=TwoWay}"</span> <span class="attr">Minimum</span><span class="kwrd">="0"</span> <span class="attr">Maximum</span><span class="kwrd">="100"</span>  <span class="attr">Width</span><span class="kwrd">="100"</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span>
        </pre>

</td>
<td>

    <object type="application/x-silverlight" height="160">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=SixthStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>
</table>            
            
            
  <h3>Accepting user input</h3>          
  
  <p>Traditionally executive dashboard have presented information and not taken input. Increasingly
  however dashboards are becoming more about control than presentation, users want to move the
  needle of a gauge to increase the budget of a department.</p>          
            
  <p>Starting with build 007 of the Dashboard library certain compoents are capable of being set
  as well as showing data.
  </p>
  
  <p>These controls present the IsBidirectional property which allows the user to specify that
  the control takes input. In the example below grab and move the triangular shaped handle
  and see that the sider updates to reflect the new value</p>
  
  
            <table>
<tr>
<td valign="top">

<pre class="csharpcode">
    <span class="kwrd">&lt;</span><span class="html">db:FiveStarRanking</span> <span class="attr">Value</span><span class="kwrd">="{Binding MilesPerHour, Mode=TwoWay}"</span> <span class="attr">IsBidirectional</span><span class="kwrd">="True"</span><span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">Slider</span> <span class="attr">Minimum</span><span class="kwrd">="0"</span> <span class="attr">Maximum</span><span class="kwrd">="100"</span> <span class="attr">Value</span><span class="kwrd">="{Binding MilesPerHour, Mode=TwoWay}"</span> <span class="kwrd">&gt;&lt;/</span><span class="html">Slider</span><span class="kwrd">&gt;</span>
       
</pre>

</td>
<td>

    <object type="application/x-silverlight" height="100">
                    <param name="source" value="ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=SeventhStep" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</td>
</tr>
</table>            
                        
<p>You can see all of the Bidirectional controls in action 
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Extras/Bidirection.aspx">on this page</asp:HyperLink></p>            


    <p>
        That's the end of this general overview of the <code>Codeplex.Dashboarding</code>
        assembly. Please select a control from the list on the left to get a more detailed
        description.</p>
</asp:Content>

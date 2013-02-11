<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Bidirection.aspx.cs" Inherits="AspNetApplication.Extras.Bidirection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        Bidirectional control</h2>
    <p>
        In these modern times dashboards aren't just about displaying information, oh no,
        they're about gathering and manipulating it too. Certain controls in the collection
        support bidirectional operation.</p>
    <p>
        To make a control by directional you set the IsBidirectionalFlag to true and the
        ShowFocus property as required</p>
    <center>
        <pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">db:DiamondSlider</span>  <span
            class="attr">IsBidirectional</span><span class="kwrd">="True"</span>  <span class="attr">Width</span><span class="kwrd">="125"</span>  <span
                    class="kwrd">/&gt;</span>
          
</pre>
    </center>
    <p>
        Which gives the following operation (mouse over the diamond and drag it to set the
        value)</p>
    <center>
        <object type="application/x-silverlight" height="40" width="400">
            <param name="source" value="../ClientBin/SilverlightApplication.xap" />
            <param name="initParams" value="demo=BiDiamond1,IsRandom=true" />
            <param name="background" value="Transparent" />
            <param name="windowless" value="True" />
        </object>
    </center>
    
    
    <p> Currently the following controls can operate in a bidirectional manner (change any slider
    and the others will update through a TwoWay databinding)</p>
    <center>
        <object type="application/x-silverlight" height="360" width="750">
            <param name="source" value="../ClientBin/SilverlightApplication.xap" />
            <param name="initParams" value="demo=BiDiamond4,IsRandom=true" />
            <param name="background" value="Transparent" />
            <param name="windowless" value="True" />
        </object>
    </center>
    
    
    
    <p>
        You can deal with the value changing in one of two easy ways, through events, or
        through two way data binding. Lets deal with events first.</p>
    <h3>Event driven action</h3>
    <p>
        The <code>Dashboard</code> base class fires the Value changed event when the value
        changes (not a trick name then, is it?). Let's register an event on our slider</p>
   
    <div style="text-align: left; margin-left: 90px;">
<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Horizontal"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">TextBlock</span> <span class="attr">x:Name</span><span class="kwrd">="_t"</span> <span class="attr">Text</span>="<span class="attr">000</span> <span class="attr">-</span><span class="kwrd">&gt;</span> 000" VerticalAlignment="Center" 
                    TextAlignment="Right" Width="70" Foreground="AntiqueWhite"<span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:DiamondSlider</span> <span class="attr">Value</span><span class="kwrd">="50"</span> <span class="attr">IsBidirectional</span><span class="kwrd">="True"</span>   
                    <span class="attr">ValueChanged</span><span class="kwrd">="DiamondSlider_ValueChanged"</span> <span class="attr">x:Name</span><span class="kwrd">="_ds"</span><span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span>
</pre>
</div>

    <p>
        And in the code behind we handle the event and show the values in a message box</p>
    <div style="text-align: left; margin-left: 90px;">
<pre class="csharpcode">
<span class="kwrd">private</span> <span class="kwrd">void</span> DiamondSlider_ValueChanged(<span class="kwrd">object</span> sender, DashboardValueChangedEventArgs e)
{
    <span class="kwrd">if</span> (_t != <span class="kwrd">null</span>)
    {
        _t.Text = String.Format(<span class="str">"{0} -&gt; {1} "</span>, e.OldValue, e.NewValue);
    }
}</pre>
    </div>
 <p>The value changed event is fired when the value is initialized in XAML. At 
     this point the local variable _t has not been set to point to the text block. So 
     we test for null to catch this case. I am investigating if there is a flag 
     supported by the runtime to determine if we are initializing from XAML or not.</p>   
<p>Here it is our example running live    </p>
    
    <center>
        <object type="application/x-silverlight" height="40" width="200">
            <param name="source" value="../ClientBin/SilverlightApplication.xap" />
            <param name="initParams" value="demo=BiDiamond2,IsRandom=true" />
            <param name="background" value="Transparent" />
            <param name="windowless" value="True" />
        </object>
    </center>
   <h3>Two way data binding</h3> 
<p>In this example we are going to tie a text block and a slider together using data bindings. The text block will data
bind its text property to the CurrentValue propert of its DataContext in a one way manner. The Slider will bind its value property to
the same property but in a two way mode. Updates to the slider will be placed in the object and reflected in the TextBlock without
any explicit event handling.</p> 

<p>Here is the XAML</p>   

<div style="margin-left:90px">
<pre class="csharpcode">
<span class="kwrd">&lt;</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">="Horizontal"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">TextBlock</span> <span class="attr">Text</span><span class="kwrd">="{Binding CurrentValue}"</span> <span class="attr">VerticalAlignment</span><span class="kwrd">="Center"</span> 
               <span class="attr">TextAlignment</span><span class="kwrd">="Right"</span> <span class="attr">Width</span><span class="kwrd">="40"</span> <span class="attr">Foreground</span><span class="kwrd">="AntiqueWhite"</span><span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">db:DiamondSlider</span> <span class="attr">Value</span><span class="kwrd">="{Binding CurrentValue, Mode=TwoWay}"</span> <span class="attr">IsBidirectional</span><span class="kwrd">="True"</span>   <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">Button</span> <span class="attr">Content</span><span class="kwrd">="Set To 50"</span> <span class="attr">Click</span><span class="kwrd">="Button_Click"</span><span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">StackPanel</span><span class="kwrd">&gt;</span></pre>
</div>

<p>In the code behind we initialize the DataContext of the control to an instance of a class that implements INotifyPropertyChange</p>   

<div style="margin-left:90px">

<pre class="csharpcode">
    <span class="rem">/// &lt;summary&gt;</span>
    <span class="rem">/// Class used to demonstrate two way data binding</span>
    <span class="rem">/// &lt;/summary&gt;</span>
    <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> BiDiamond3 : UserControl
    {
        <span class="kwrd">public</span> BiDiamond3()
        {
            InitializeComponent();
            BoundObject bo = <span class="kwrd">new</span> BoundObject { CurrentValue = 25 };
            DataContext = bo;
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Show we are two way</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="kwrd">private</span> <span class="kwrd">void</span> Button_Click(<span class="kwrd">object</span> sender, RoutedEventArgs e)
        {
            BoundObject bo = DataContext <span class="kwrd">as</span> BoundObject;
            bo.CurrentValue = 50;
        }
    }

    <span class="rem">/// &lt;summary&gt;</span>
    <span class="rem">/// Class to do an example binding</span>
    <span class="rem">/// &lt;/summary&gt;</span>
    <span class="kwrd">public</span> <span class="kwrd">class</span> BoundObject : INotifyPropertyChanged
    {
        <span class="kwrd">private</span> <span class="kwrd">double</span> _currentValue;

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Current vlaue property, raises the on property changed event</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="kwrd">public</span> <span class="kwrd">double</span> CurrentValue
        {
            get { <span class="kwrd">return</span> _currentValue; }
            set 
            { 
                _currentValue = <span class="kwrd">value</span>;
                OnPropertyChanged(<span class="str">"CurrentValue"</span>);
            }
        }
            
        <span class="preproc">#region</span> INotifyPropertyChanged Members

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// One of my properties has changed</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="kwrd">public</span> <span class="kwrd">event</span> PropertyChangedEventHandler PropertyChanged;

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Notify any listeners that a property has changed</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="propName"&gt;Name of the property&lt;/param&gt;</span>
        <span class="kwrd">protected</span> <span class="kwrd">virtual</span> <span class="kwrd">void</span> OnPropertyChanged(<span class="kwrd">string</span> propName)
        {
            <span class="kwrd">if</span> (PropertyChanged != <span class="kwrd">null</span>)
            {
                PropertyChanged(<span class="kwrd">this</span>, <span class="kwrd">new</span> PropertyChangedEventArgs(propName));
            }
        }

        <span class="preproc">#endregion</span>
    }</pre>

</div>

<p>Which gives us a similar result to before but with a better feel. Click the button to set the value to 50 and see two way binding in action, Neat :-)</p>
    
     <center>
        <object type="application/x-silverlight" height="40" width="400">
            <param name="source" value="../ClientBin/SilverlightApplication.xap" />
            <param name="initParams" value="demo=BiDiamond3,IsRandom=true" />
            <param name="background" value="Transparent" />
            <param name="windowless" value="True" />
        </object>
    </center>
    
</asp:Content>

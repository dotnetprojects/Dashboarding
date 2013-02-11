using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Demos.Common.Demonstrators
{
    public class Dial360Demo : IDemonstrateDials
    {

      
        public string DemoName
        {
            get { return "* Dial360"; }
        }


        public UserControl Create()
        {
            return new Dial360Demonstrator();
        }

   
    }

    /// <summary>
    /// Interaction logic for Dial180.xaml
    /// </summary>
    public partial class Dial360Demonstrator : UserControl
    {
        private BoundObject _object = BoundObject.Create(Colors.White);

        public Dial360Demonstrator()
        {
            InitializeComponent();
            DataContext = _object;
            _exp.DataContext = _object;

        }




    }
}

/*
 
        <TextBlock Grid.Row="1" Grid.Column="1" Foreground="AntiqueWhite">Should show a changed text color of yellow and a face color range</TextBlock>

        <db:Dial360 Value="{Binding Path=CurrentValue, Mode=TwoWay}" x:Name="_dial1" Grid.Row="2" ValueTextVisibility="Collapsed">
            <db:Dial360.NeedleColorRange>
                <db:ColorPoint HiColor="#009900" LowColor="#44DD00" Value="0" />
                <db:ColorPoint HiColor="#9DC800" LowColor="#DDCC00" Value="33" />
                <db:ColorPoint HiColor="#660000" LowColor="#BB3300" Value="66" />
            </db:Dial360.NeedleColorRange>
        </db:Dial360>

        <TextBlock Grid.Row="2" Grid.Column="1" Foreground="AntiqueWhite">Should show no text and a needle color range</TextBlock>

        <db:Dial360 Value="{Binding Path=CurrentValue, Mode=TwoWay}" x:Name="_dial2" Grid.Row="3">
            <db:Dial360.FaceColorRange>
                <db:ColorPoint HiColor="#2A242C" LowColor="#6C0680" Value="0" />
                <db:ColorPoint HiColor="#2A242C" LowColor="#220000" Value="55" />
            </db:Dial360.FaceColorRange>
            <db:Dial360.NeedleColorRange>
                <db:ColorPoint HiColor="#009900" LowColor="#44DD00" Value="0" />
                <db:ColorPoint HiColor="#9DC800" LowColor="#DDCC00" Value="33" />
                <db:ColorPoint HiColor="#660000" LowColor="#BB3300" Value="66" />
            </db:Dial360.NeedleColorRange>
        </db:Dial360>

        <TextBlock Grid.Row="3" Grid.Column="1" Foreground="AntiqueWhite">Should show default text and both a needle and face color range</TextBlock>


        <db:Dial360 IsBidirectional="True" Value="{Binding Path=CurrentValue, Mode=TwoWay}"  Grid.Row="4">
            <db:Dial360.FaceColorRange>
                <db:ColorPoint HiColor="#2A242C" LowColor="#6C0680" Value="0" />
                <db:ColorPoint HiColor="#2A242C" LowColor="#220000" Value="55" />
            </db:Dial360.FaceColorRange>
            <db:Dial360.NeedleColorRange>
                <db:ColorPoint HiColor="#009900" LowColor="#44DD00" Value="0" />
                <db:ColorPoint HiColor="#9DC800" LowColor="#DDCC00" Value="33" />
                <db:ColorPoint HiColor="#660000" LowColor="#BB3300" Value="66" />
            </db:Dial360.NeedleColorRange>
        </db:Dial360>

        <TextBlock Grid.Row="4" Grid.Column="1" Foreground="AntiqueWhite">I am bi-directional change me and watch the others move</TextBlock>

*/




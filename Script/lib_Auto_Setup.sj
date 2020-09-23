//USEUNIT lib_ChangeIP
//USEUNIT lib_CodeSetup
//USEUNIT lib_common
//USEUNIT lib_connection
//USEUNIT lib_const
//USEUNIT lib_deviceInfo
//USEUNIT lib_DeviceSelectedDetail
//USEUNIT lib_OpenJob
//USEUNIT lib_SaveIMG
//USEUNIT lib_SaveJob
//USEUNIT lib_validate
//USEUNIT lib_UserRole
//USEUNIT lib_label
//USEUNIT lib_SaveIMG
//USEUNIT simulator_common
//USEUNIT lib_QuickSetup
//USEUNIT lib_DataFormatting
function clickDataFortmating_Collection()
{

//function GoodReadSetup  

  var arrPro = ["ClrFullClassName", "WPFControlText"];
  var arrVal = ["System.Windows.Documents.Run", "Good Read Setup"];
  var GoodReadSetup = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
  GoodReadSetup = GoodReadSetup.Parent;
  GoodReadSetup.Click();
  var CodeCollection= Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("ResultAnalysisJobContent", "", 1).WPFObject("AddCollectionActionButton", "", 1).WPFObject("image")
  CodeCollection.Click();
        
        
// Chosse DataFormatting
  //Click Formatting
  arrPro = ["ClrFullClassName", "WPFControlText"];
  arrVal = ["System.Windows.Documents.Run", "Data Formatting"];
  FormattingObj = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
  FormattingObj = FormattingObj.Parent;
  FormattingObj.Click();
  Initization_DLcode();

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function clickDataFortmating_Default()
{
  aqTestCase.Begin("tc_quickSetup");
         if ( ! lib_validate.isDLCODERunning())
           lib_common.launchUI(); 
         var ip = lib_deviceInfo.const_Device_IP_Adress;
         if (lib_common.connectToDevice(ip) == lib_err.err_FUNC_SUCCESS)
         {                       
                if (lib_OpenJob.openOnDevice( lib_const.const_DefaultJob,lib_const.const_isDefaultJob_Y,lib_const.const_isOpenViaButton_Y) == true)
                { 
                      
                      Indicator.PushText("perform Smart Quick Setup 1D & 2D : WHITE + BLACK");
                      Indicator.PopText();
                      //QSU_30, QSU_32, QSU_76
                      //1D  & 2D : only M220 has Polarized
                      Log.Message(quickSetup(true,true,false , true , false));//Static
                      
                }  
        }  
        //lib_common.terminateUI();
        aqTestCase.End();
        Result_Click();

var path =Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("StatisticResult", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Expander", "Code Settings", 2).WPFObject("Border", "", 1).WPFObject("DataGrid", "", 1).WPFObject("DataGridRow", "", 1).WPFObject("DataGridCell", "", 3).WPFObject("ContentPresenter", "", 1).WPFObject("ItemsControl", "", 1);

var ReadCode = "";
var ChildCount = path.ChildCount;

                Log.Message(ChildCount);

                for (i=1; i<= ChildCount; i++)
                {
                  
                  var txt = path.WPFObject("ContentPresenter", "", i).WPFObject("TextBlock", "*", 1).WPFControlText;  
                  ReadCode = ReadCode + txt;
                  //Log.Message("ReadCode :" + ReadCode);
                  //Log.Message(txt);
                  }

  //Click Formatting
  arrPro = ["ClrFullClassName", "WPFControlText"];
  arrVal = ["System.Windows.Documents.Run", "Data Formatting"];
  FormattingObj = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
  FormattingObj = FormattingObj.Parent;
  FormattingObj.Click();
  Initization_DLcode();

}
function Click_Play_Pause(){
  playBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Play", 1000);
  pauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Pause", 1000);
  if(playBtn.Exists) playBtn.Click();   
  else Log.Message("Can't find Play button");
  delay(5000);
  if(pauseBtn.Exists) pauseBtn.Click(); 
  else Log.Message("Can't find Play button");
}

function Click_Console()
{
    var ProCentralBorder = ["ClrFullClassName","WPFControlName"];
    var ValCentralBorder = ["System.Windows.Controls.Border","CentralBorder"];
    var CentralBorder = Sys.Process("DL.CODE").FindChild(ProCentralBorder, ValCentralBorder, 2000);
    if (CentralBorder.Exists)
    {
      //Log.Message(CentralBorder.FullName)
      var ProBottomBorder = ["ClrFullClassName","WPFControlName"];
      var ValBottomBorder = ["System.Windows.Controls.Grid","BottomBorder"];
      var BottomBorder = Sys.Process("DL.CODE").FindChild(ProBottomBorder, ValBottomBorder, 2000);
      if (BottomBorder.Exists)
      {
        //Log.Message(BottomBorder.FullName)
        var ProBottomTabItem4 = ["ClrFullClassName","WPFControlText"];
        var ValBottomTabItem4 = ["System.Windows.Controls.TabItem","Console"];
        var BottomTabItem4 = Sys.Process("DL.CODE").FindChild(ProBottomTabItem4, ValBottomTabItem4, 2000);
        if (BottomTabItem4.Exists)
        {
         //Log.Message(BottomTabItem4.FullName)
         BottomTabItem4.Click();
        }
      }
    }
}


function Result_Click()
{
    var ProCentralBorder = ["ClrFullClassName","WPFControlName"];
    var ValCentralBorder = ["System.Windows.Controls.Border","CentralBorder"];
    var CentralBorder = Sys.Process("DL.CODE").FindChild(ProCentralBorder, ValCentralBorder, 2000);
    if (CentralBorder.Exists)
    {
      //Log.Message(CentralBorder.FullName)
      var ProBottomBorder = ["ClrFullClassName","WPFControlName"];
      var ValBottomBorder = ["System.Windows.Controls.Grid","BottomBorder"];
      var BottomBorder = CentralBorder.FindChild(ProBottomBorder, ValBottomBorder, 2000);
      if (BottomBorder.Exists)
      {
        //Log.Message(BottomBorder.FullName)
        var ProBottomTabItem4 = ["ClrFullClassName","WPFControlText"];
        var ValBottomTabItem4 = ["System.Windows.Controls.TabItem","Result"];
        var Result = BottomBorder.FindChild(ProBottomTabItem4, ValBottomTabItem4, 2000);
        if (Result.Exists)
        {
         //Log.Message(BottomTabItem4.FullName)
         Result.Click();
        }
      }
    }
}
function Events_Click()
{
    var ProCentralBorder = ["ClrFullClassName","WPFControlName"];
    var ValCentralBorder = ["System.Windows.Controls.Border","CentralBorder"];
    var CentralBorder = Sys.Process("DL.CODE").FindChild(ProCentralBorder, ValCentralBorder, 2000);
    if (CentralBorder.Exists)
    {
      //Log.Message(CentralBorder.FullName)
      var ProBottomBorder = ["ClrFullClassName","WPFControlName"];
      var ValBottomBorder = ["System.Windows.Controls.Grid","BottomBorder"];
      var BottomBorder = CentralBorder.FindChild(ProBottomBorder, ValBottomBorder, 2000);
      if (BottomBorder.Exists)
      {
        //Log.Message(BottomBorder.FullName)
        var ProBottomTabItem4 = ["ClrFullClassName","WPFControlText"];
        var ValBottomTabItem4 = ["System.Windows.Controls.TabItem","Events"];
        var EventsClick = BottomBorder.FindChild(ProBottomTabItem4, ValBottomTabItem4, 2000);
        if (EventsClick.Exists)
        {
         //Log.Message(BottomTabItem4.FullName)
         EventsClick.Click();
        }
      }
    }
}




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
function Compare_Code()
{
    var arrPro = ["ClrFullClassName" , "WPFControlText"];
    var arrVal = ["System.Windows.Controls.TabItem", "Console"];
    var consoleTab  = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 2000) ;  
    if (consoleTab.Exists)
      {
        if (consoleTab.IsSelected == false)
             TC_DataFormatting.Click_Console();
        if (consoleTab.IsSelected == true)
        {
             var itemControlPro = ["ClrFullClassName"];  
             var itemControlVal = ["System.Windows.Controls.ItemsControl"];
             var itemControlObj = consoleTab.Parent.FindChild(itemControlPro, itemControlVal, 2000);
             //Log.Message(itemControlObj.FullName);
             if (itemControlObj.Exists)
               { 
                 var ChildCount = itemControlObj.childCount;
                 ChildCount = aqConvert.VarToStr(ChildCount)
                 Log.Message("ChildCount is "+ ChildCount);
  //                       var ProContentPresenter = ["Name"];
  //                       var ValContentPresenter = ["WPFObject(\"ContentPresenter\", \"\","+ChildCount+")"];
                 var ProContentPresenter = ["ClrFullClassName","WPFControlOrdinalNo"];
                 var ValContentPresenter = ["System.Windows.Controls.ContentPresenter",ChildCount];
                 var ContentPresenter = itemControlObj.Parent.FindChild(ProContentPresenter, ValContentPresenter, 2000);
                 if (ContentPresenter.Exists)
                  {
                     //ShowCode = ShowCode.Text
                     //Log.Message(ContentPresenter.FullName)
                     var ProTextBlockCode = ["ClrFullClassName","WPFControlOrdinalNo"];
                     var ValTextBlockCode = ["System.Windows.Controls.TextBlock",2];
                     var TextBlockCode = itemControlObj.Parent.FindChild(ProTextBlockCode, ValTextBlockCode, 2000);
                     if (TextBlockCode.Exists)
                     {
                      // Log.Message(TextBlockCode.FullName)
                       Log.Message(TextBlockCode.Text)
                     }
                  }
              } 
        }       
    }

             //Get Data Was Set In DataFormatting

var ProHeaderC1 = ["ClrFullClassName"];
var ValHeaderC1 = ["IVS_UI.Views.PropertyViews.OutputMessagePropertiesView"];
var HeaderC1 = Sys.Process("DL.CODE").FindChild(ProHeaderC1, ValHeaderC1, 2000);
if (HeaderC1.Exists)
{
  //Log.Message(HeaderC1.FullName)
var ProHeaderC2 = ["ClrFullClassName"];
var ValHeaderC2 = ["System.Windows.Controls.StackPanel"];
var HeaderC2 = HeaderC1.FindChild(ProHeaderC2, ValHeaderC2, 2000);
if (HeaderC2.Exists)
{
//Log.Message(HeaderC2.FullName)
  var ProHeaderC3 = ["ClrFullClassName","WPFControlOrdinalNo"];
  var ValHeaderC3 = ["IVSControls.Controls.PropertyViewControls.ParamControl",2];
  var HeaderC3 = HeaderC2.FindChild(ProHeaderC3, ValHeaderC3, 2000);
  if (HeaderC3.Exists)
  {
    //Log.Message(HeaderC3.FullName)
    var ProHeaderC4 = ["ClrFullClassName"];
    var ValHeaderC4 = ["IVSControls.Controls.NonterminalSymbol.AsciiTable"];
    var HeaderC4 = HeaderC3.FindChild(ProHeaderC4, ValHeaderC4, 2000);
      if (HeaderC4.Exists)
    {
      //Log.Message(HeaderC4.FullName)
      var ProHeaderC5 = ["ClrFullClassName"];
      var ValHeaderC5 = ["System.Windows.Documents.FlowDocument"];
      var HeaderC5 = HeaderC4.FindChild(ProHeaderC5, ValHeaderC5, 2000);
      if (HeaderC5.Exists)
      {
        //Log.Message(HeaderC5.FullName)
        var ProHeader = ["ClrFullClassName"];
        var ValHeader = ["System.Windows.Controls.TextBlock"];
        var Header = HeaderC5.FindChild(ProHeader, ValHeader, 2000);
        if (Header.Exists)
        {
          //Log.Message(Header.FullName)
          Log.Message(Header.Text)
                
        }
      }
    }
  }
      
}
}

    var ProItemsControl = ["ClrFullClassName","ScrollViewer_VerticalScrollBarVisibility"];
    var ValItemsControl = ["System.Windows.Controls.ItemsControl","Disabled"];
    var ItemsControl = Sys.Process("DL.CODE").FindChild(ProItemsControl, ValItemsControl, 2000);
    if (ItemsControl.Exists)
    {
        //Log.Message(ItemsControl.FullName)
        var ProContentControl = ["ClrFullClassName","WPFControlOrdinalNo"];
        var ValContentControl = ["System.Windows.Controls.ContentControl",1];
        var ContentControl = ItemsControl.FindChild(ProContentControl, ValContentControl, 2000);
        if (ContentControl.Exists)
        {
          //Log.Message(ContentControl.FullName)
          var ProParagraph = ["ClrFullClassName"];
          var ValParagraph = ["System.Windows.Documents.Paragraph"];
          var CustomString = ContentControl.FindChild(ProParagraph, ValParagraph, 2000);
          if (CustomString.Exists)
          {
            //Log.Message(CustomString.FullName)
            Log.Message(CustomString.WPFControlText)
      
          }
      
        }
      
    }

    var ProItemsControl = ["ClrFullClassName","ScrollViewer_VerticalScrollBarVisibility"];
    var ValItemsControl = ["System.Windows.Controls.ItemsControl","Disabled"];
    var ItemsControl = Sys.Process("DL.CODE").FindChild(ProItemsControl, ValItemsControl, 2000);
    if (ItemsControl.Exists)
    {
      //Log.Message(ItemsControl.FullName)
      //Log.Message("ContentControl "+ContentControl.FullName)
      var ProStackPanel = ["ClrFullClassName"];
      var ValStackPanel = ["System.Windows.Controls.StackPanel"];
      var StackPanel = ItemsControl.FindChild(ProStackPanel, ValStackPanel, 2000);
      if (StackPanel.Exists)
      {
        //Log.Message("StackPanel "+StackPanel.FullName)
        var ProParamControl = ["ClrFullClassName","WPFControlOrdinalNo"];
        var ValParamControl = ["IVSControls.Controls.PropertyViewControls.ParamControl",2];
        var ParamControl = StackPanel.FindChild(ProParamControl, ValParamControl, 2000);
        if (ParamControl.Exists)
        {
          //Log.Message("ParamControl "+ParamControl.FullName)
          var ProContentControl = ["ClrFullClassName"];
          var ValContentControl = ["System.Windows.Controls.ContentControl"];
          var ContentControl = ParamControl.FindChild(ProContentControl, ValContentControl, 2000);
            if (ContentControl.Exists)
            {
              //Log.Message("ContentControl "+ContentControl.FullName)
              var ProWatermarkTextBox = ["ClrFullClassName"];
              var ValWatermarkTextBox = ["Microsoft.Windows.Controls.WatermarkTextBox"];
              var LengthNum = ContentControl.FindChild(ProWatermarkTextBox, ValWatermarkTextBox, 2000);
                if (LengthNum.Exists)
              {
                //Log.Message("LengthNum "+LengthNum.FullName)
                Log.Message(LengthNum.Text)
      
              }     
            }
        }
      }
    }

    var ProItemsControl = ["ClrFullClassName","ScrollViewer_VerticalScrollBarVisibility"];
    var ValItemsControl = ["System.Windows.Controls.ItemsControl","Disabled"];
    var ItemsControl = Sys.Process("DL.CODE").FindChild(ProItemsControl, ValItemsControl, 2000);
    if (ItemsControl.Exists)
    {
      //Log.Message(ItemsControl.FullName)
      //Log.Message("ContentControl "+ContentControl.FullName)
      var ProStackPanel = ["ClrFullClassName"];
      var ValStackPanel = ["System.Windows.Controls.StackPanel"];
      var StackPanel = ItemsControl.FindChild(ProStackPanel, ValStackPanel, 2000);
      if (StackPanel.Exists)
      {
        //Log.Message("StackPanel "+StackPanel.FullName)
        var ProParamControl = ["ClrFullClassName","WPFControlOrdinalNo"];
        var ValParamControl = ["IVSControls.Controls.PropertyViewControls.ParamControl",3];
        var ParamControl = StackPanel.FindChild(ProParamControl, ValParamControl, 2000);
        if (ParamControl.Exists)
        {
          //Log.Message("ParamControl "+ParamControl.FullName)
          var ProContentControl = ["ClrFullClassName"];
          var ValContentControl = ["System.Windows.Controls.ContentControl"];
          var ContentControl = ParamControl.FindChild(ProContentControl, ValContentControl, 2000);
            if (ContentControl.Exists)
            {
              //Log.Message("ContentControl "+ContentControl.FullName)
              var ProParagraph = ["ClrFullClassName"];
              var ValParagraph = ["System.Windows.Documents.Paragraph"];
              var FillingPattern = ContentControl.FindChild(ProParagraph, ValParagraph, 2000);
                if (FillingPattern.Exists)
              {
               // Log.Message(FillingPattern.FullName)
                Log.Message(FillingPattern.WPFControlText)
      
              }    
            }
        }
      }
    }



Header = Header.WPFControlText;
Header =aqConvert.VarToStr(Header);
Log.Message("The Header is " + Header)
Log.Message("The Header is " + aqString.GetLength(Header) + " character(s) long.");


//CustomString = CustomString.Text
//Log.Message("The CustomString is " + aqString.GetLength(CustomString) + " character(s) long.");
CustomString = CustomString.WPFControlText;
//ValueType
//Log.Message("The CustomString1 : " + CustomString);
//Log.Message("The CustomString1 Convert is " + aqConvert.VarToStr(CustomString));
CustomString =aqConvert.VarToStr(CustomString);
Log.Message("The CustomString is " + CustomString)
Log.Message("The CustomString is " + aqString.GetLength(CustomString) + " character(s) long.");
//Log.Message("The CustomString2 ValueType : " + CustomString.ValueType);
LengthNum = LengthNum.Text
//Log.Message("The LengthNum is " + aqString.GetLength(LengthNum) + " character(s) long.");
LengthNum = aqConvert.StrToInt(LengthNum);
Log.Message("The Value LengthNum is " + LengthNum );


FillingPattern = FillingPattern.WPFControlText;
FillingPattern =aqConvert.VarToStr(FillingPattern);
Log.Message("The FillingPattern is " + FillingPattern)
Log.Message("The FillingPattern is " + aqString.GetLength(FillingPattern) + " character(s) long.");





TextBlockCode =TextBlockCode.Text
Log.Message("The TextBlockCode is"+  TextBlockCode);
//Log.Message("The TextBlockCode 1 is"+  TextBlockCode[1]);

Log.Message("The TextBlockCode is "+ aqString.GetLength(TextBlockCode) + " character(s) long.");

var Pattern="";
TextBlockCodeLength = aqString.GetLength(TextBlockCode)
//Log.Message(TextBlockCode)
Log.Message("Text Code is " +TextBlockCodeLength + " character(s) long.")
FillingPatternLength = aqString.GetLength(FillingPattern)
Log.Message("FillingPatternLength"+ FillingPatternLength )
CustomStringLength = aqString.GetLength(FillingPattern)
TextBlockCode = aqConvert.VarToStr(TextBlockCode)
 for (var i=0; i<TextBlockCodeLength; i++)
     {
      if (TextBlockCode[i] == FillingPattern )
         Pattern= Pattern + FillingPattern;
         Pattern2= FillingPattern
         //Log.Message("Filling Pattern is"+  Pattern )
//         Log.Message("Filling Pattern is" + aqString.GetLength(Pattern) + " character(s) long.");
      }

Log.Message("Filling Pattern is "+Pattern )
Log.Message("Filling Pattern is " + aqString.GetLength(Pattern) + " character(s) long.");
//Log.Message("CustomString is "+CustomString )
//Log.Message("CustomString is " + aqString.GetLength(CustomString) + " character(s) long.");
CustomStringTextBlockCode= CustomString + Pattern
//Log.Message("CustomStringTextBlockCode is "+CustomStringTextBlockCode )
CustomStringTextBlockCode = aqString.GetLength(CustomStringTextBlockCode)
//Log.Message("CustomStringTextBlockCode is " + CustomStringTextBlockCode + " character(s) long.");
//Log.Message(CustomStringTextBlockCode)
if (CustomStringTextBlockCode == LengthNum)
   Log.Message("Output Format is ***CORRECT***!!!!!!" )
else 
Log.Message("Output Format is ***NOT CORRECT***!!!!!!" )



var Check =0;
var FieldJustificationDefaul = "Left Aligned"
var FieldJustificationDefaulR = "Right Aligned"
PropLeftRight = new Array("ClrFullClassName","WPFControlText");
ValuesLeftRight = new Array("System.Windows.Controls.TextBlock","Left Aligned");
var FieldJustification = Sys.Process("DL.CODE").FindChild(PropLeftRight, ValuesLeftRight, 1000)
//TextBlockCode.Click(); 
  if (FieldJustification.Exists== true)
    {
     FieldJustification= FieldJustification.WPFControlText;
     FieldJustification = aqConvert.VarToStr(FieldJustification)
     Log.Message("FieldJustification " + FieldJustification)
     if (FieldJustification == FieldJustificationDefaul )
     {
     var CustomStringTextBlockCode_1= Header+ CustomString + Pattern
     CustomStringTextBlockCodeLength = aqString.GetLength(CustomStringTextBlockCode_1)
     Log.Message("CustomStringTextBlockCode_1" + CustomStringTextBlockCode_1)
     Log.Message("CustomStringTextBlockCodeLength_1" + CustomStringTextBlockCodeLength)
     for(i=0; i<CustomStringTextBlockCodeLength;i++ )
     {
     if (CustomStringTextBlockCode_1[i] == TextBlockCode[i] )
       Check = Check
       else 
       Check = 1
     }
  Log.Message("Check is " + Check)   
  if ( Check ==0 )
  Log.Message("Field Justification Left Correct")

  else 
  
  Log.Warning("Field Justification Was set Left but Show Right")
  Check = 0;
  

   }
    
    
    
    }
    
  else
  {
         PropLeftRight = new Array("ClrFullClassName","WPFControlText");
         ValuesLeftRight = new Array("System.Windows.Controls.TextBlock","Right Aligned");
         var FieldJustificationR = Sys.Process("DL.CODE").FindChild(PropLeftRight, ValuesLeftRight, 1000)
         FieldJustificationR= FieldJustificationR.WPFControlText
         FieldJustificationR = aqConvert.VarToStr(FieldJustificationR)
         Log.Message("FieldJustification " + FieldJustificationR)
   
   
         if (FieldJustificationR == FieldJustificationDefaulR )
           {
           var CustomStringTextBlockCode_2= Header + Pattern+ CustomString
           CustomStringTextBlockCodeLength = aqString.GetLength(CustomStringTextBlockCode_2)
           Log.Message("CustomStringTextBlockCode_2" + CustomStringTextBlockCode_2)
           Log.Message("CustomStringTextBlockCodeLength_2" + CustomStringTextBlockCodeLength)
             for(i=0; i<CustomStringTextBlockCodeLength;i++ )
            {
                      if (CustomStringTextBlockCode_2[i] == TextBlockCode[i] )
                      Check = Check
                      else 
                      Check = 1
            }
           // Log.Message("Check is " + Check) 
            if ( Check ==0 )
             Log.Message("Field Justification Right Correct")

            else 
             {
              Log.Warning("Field Justification Was set Right but Show Left")
              Check = 0;
             }

           }
   
  }

}










﻿//USEUNIT lib_ChangeIP
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
var Result = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2");
Result.Click(); 

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

//function CompareTextA()
//{
//
//var TextCode ="<STX>CODE****************31666249588376";//get from Device
//var TextOnlyCode ="CODE****************";//get from Device
//var CustomString = "CODE" //get from Device
//var FillingPattern="*";//get from Device
//var Pattern="";
//TextCodeLength = aqString.GetLength(TextCode)
//Log.Message(TextCode)
//Log.Message("Text Code is " +TextCodeLength + " character(s) long.")
//FillingPatternLength = aqString.GetLength(FillingPattern)
//CustomStringLength = aqString.GetLength(FillingPattern)
// for (var i=0; i<TextCodeLength; i++)
//     {
//      if (TextCode[i] == FillingPattern)
//         Pattern= Pattern + FillingPattern
//         Pattern2= FillingPattern
////         Log.Message("Filling Pattern is"+Pattern )
////         Log.Message("Filling Pattern is" + aqString.GetLength(Pattern) + " character(s) long.");
//      }
//
//Log.Message("Filling Pattern is "+Pattern )
//Log.Message("Filling Pattern is " + aqString.GetLength(Pattern) + " character(s) long.");
//Log.Message("CustomString is "+CustomString )
//Log.Message("CustomString is " + aqString.GetLength(CustomString) + " character(s) long.");
//CustomStringTextCode= CustomString + Pattern
//Log.Message("CustomStringTextCode is "+CustomStringTextCode )
//CustomStringTextCode = aqString.GetLength(CustomStringTextCode)
//Log.Message("CustomStringTextCode is " + CustomStringTextCode + " character(s) long.");
//if (CustomStringTextCode==20 && Pattern2==FillingPattern && CustomStringTextCode == TextOnlyCode )
//   Log.Message("Right!!!!!!" )
//else 
//Log.Message("Fail!!!!!!" )
//}

function Click_Console(){
  var Console= Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem4").WPFObject("TextBlock", "Console", 1)
  Console.Click();  
}

function Click_PlayButton(){
  var PropPlay = new Array("ClrClassName","ToolTip.WPFControlText");
  var ValuesPlay = new Array("Button","Play");
  var Play = Sys.Process("DL.CODE").FindChild(PropPlay, ValuesPlay, 1000)
  //CLICK PLAY
  if (Play.Exists)
    {  //Log.Message("fgdkjfhdj :"+PlayPause.IsFocused);
       Play.Click();  
    }
  // Click PAUSE
  Delay(10000);
  var PropPause = new Array("ClrClassName","ToolTip.WPFControlText");
  var ValuesPause = new Array("Button","Pause");
  var Pause1 = Sys.Process("DL.CODE").FindChild(PropPause, ValuesPause, 1000)
  if (Pause1.Exists)
     {  //Log.Message("fgdkjfhdj :"+PlayPause.IsFocused);
        Pause1.Click();  
     }
}




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Compare_Code()
{
//PropTextCode = new Array("ClrFullClassName");
//ValuesTextCode = new Array("System.Windows.Controls.TextBlock");
//var TextCode = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("Terminal", "", 1).WPFObject("MainScrollViewer").FindChild(PropTextCode, ValuesTextCode, 1000)
 var arrPro = ["ClrFullClassName" , "WPFControlText"];
      var arrVal = ["System.Windows.Controls.TabItem", "Console"];
      var consoleTab  = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 2000) ; 
      Log.Message(consoleTab.FullName);  
      if (consoleTab.Exists)
      {
        if (consoleTab.IsSelected == false)
             Click_Console();
        if (consoleTab.IsSelected == true)
        {
             var itemControlPro = ["ClrFullClassName"];  
             var itemControlVal = ["System.Windows.Controls.ItemsControl"];
             var itemControlObj = consoleTab.Parent.FindChild(itemControlPro, itemControlVal, 2000);
             Log.Message(itemControlObj.FullName);
             if (itemControlObj.Exists)
               { 
                 var ChildCount = itemControlObj.childCount;
                 ChildCount = aqConvert.VarToStr(ChildCount)
                 Log.Message("ChildCount is "+ChildCount);
  //                       var ProContentPresenter = ["Name"];
  //                       var ValContentPresenter = ["WPFObject(\"ContentPresenter\", \"\","+ChildCount+")"];
                 var ProContentPresenter = ["ClrFullClassName","WPFControlOrdinalNo"];
                 var ValContentPresenter = ["System.Windows.Controls.ContentPresenter",ChildCount];
                 var ContentPresenter = itemControlObj.Parent.FindChild(ProContentPresenter, ValContentPresenter, 2000);
                 if (ContentPresenter.Exists)
                  {
                     //ShowCode = ShowCode.Text
                     Log.Message(ContentPresenter.FullName)
                     var ProTextBlockCode = ["ClrFullClassName","WPFControlOrdinalNo"];
                     var ValTextBlockCode = ["System.Windows.Controls.TextBlock",2];
                     var TextBlockCode = itemControlObj.Parent.FindChild(ProTextBlockCode, ValTextBlockCode, 2000);
                     if (TextBlockCode.Exists)
                     {
                       Log.Message(TextBlockCode.FullName)
                       Log.Message(TextBlockCode.Text)
                     }
                      else Log.Message("noooo1"); 
                     
                  }
                   else Log.Message("noooo2"); 
                } 
                 else Log.Message("noooo3"); 
          }  
            else Log.Message("noooo4");     
      }
    


             //Get Data Was Set In DataFormatting
//Get Header
Header= Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ParamControl", "", 2).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("AsciiTable", "", 1).WPFObject("Grid", "", 1).WPFObject("rtbText").WPFObject("FlowDocument", "", 1).WPFObject("Paragraph", "", 1).WPFObject("InlineUIContainer", "", 1).WPFObject("TextBlock", "<STX>", 1)

//Get Data CustomString
var CustomString = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ContentExpander", "", 1).WPFObject("test").WPFObject("ContentControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ParamControl", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("AsciiTable", "", 1).WPFObject("Grid", "", 1).WPFObject("rtbText").WPFObject("FlowDocument", "", 1).WPFObject("Paragraph", "", 1)
//Get Data LengthNum
var LengthNum = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ContentExpander", "", 1).WPFObject("test").WPFObject("StackPanel", "", 1).WPFObject("ParamControl", "", 2).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox")
//Get Data FillingPattern
var FillingPattern = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ContentExpander", "", 1).WPFObject("test").WPFObject("StackPanel", "", 1).WPFObject("ParamControl", "", 3).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("AsciiTable", "", 1).WPFObject("Grid", "", 1).WPFObject("rtbText").WPFObject("FlowDocument", "", 1).WPFObject("Paragraph", "", 1)



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
Log.Message("The TextBlockCode is"+  TextBlockCode.FullName);
//Log.Message("The TextBlockCode 1 is"+  TextBlockCode[1]);

Log.Message("The TextBlockCode is "+ aqString.GetLength(TextBlockCode) + " character(s) long.");
//ReadCode=31666249588376;
//Log.Message("The Code is " + aqString.GetLength(ReadCode) + " character(s) long.");
//Log.Message(ReadCode); 


//if (TextBlockCode.Exists )
//  {    //Log.Message("fgdkjfhdj :"+St2.IsFocused);
//       TextBlockCode.Click();
//     Log.Message(TextBlockCode.Text);
//  } var TextBlockCode ="<STX>CODE****************31666249588376";//get from Device
//var TextOnlyCode ="CODE****************";//get from Device
//var CustomString = "CODE" //get from Device
//var FillingPattern="*";//get from Device
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
var FieldJustification = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").FindChild(PropLeftRight, ValuesLeftRight, 1000)
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
  
  Log.Message("Field Justification Left Not Correct")
  

   }
    
    
    
    }
    
  else
  {
         PropLeftRight = new Array("ClrFullClassName","WPFControlText");
         ValuesLeftRight = new Array("System.Windows.Controls.TextBlock","Right Aligned");
         var FieldJustificationR = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60").FindChild(PropLeftRight, ValuesLeftRight, 1000)
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
            Log.Message("Check is " + Check) 
            if ( Check ==0 )
             Log.Message("Field Justification Right Correct")

            else 
             {
              Log.Message("Field Justification Right Not Correct")
             }

           }
   
  }

}


 








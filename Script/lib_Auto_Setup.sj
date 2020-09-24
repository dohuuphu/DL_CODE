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
//USEUNIT string
function clickDataFortmating_Collection()
{

//function GoodReadSetup  

  var arrPro = ["ClrFullClassName", "WPFControlText"];
  var arrVal = ["System.Windows.Documents.Run", "Good Read Setup"];
  var GoodReadSetup = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
  GoodReadSetup = GoodReadSetup.Parent;
  GoodReadSetup.Click();

    CodeCollection();
        
        
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
        //Get_CODE();

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

function CodeCollection()
{
    var ProGrid = ["ClrFullClassName"];
    var ValGrid = ["IVS_UI.Views.JobConfigurationMode.JobConfigurationModeView"];
    var Grid = Sys.Process("DL.CODE").FindChild(ProGrid, ValGrid, 2000);
    if (Grid.Exists)
    {
      //Log.Message(Grid.FullName)
      var ProBorder = ["Name"];
      var ValBorder = ["WPFObject\(\"Border\"\, \"\"\, 1)"];
      var Border = Grid.FindChild(ProBorder, ValBorder, 2000);
      if (Border.Exists)
      {
        //Log.Message(Border.FullName)
        var ProResultAnalysisJobContent = ["ClrFullClassName"];
        var ValResultAnalysisJobContent = ["MatrixMasterPlugin.JobContent.ResultAnalysisJobContent"];
        var ResultAnalysisJobContent = Border.FindChild(ProResultAnalysisJobContent, ValResultAnalysisJobContent, 2000);
        if (ResultAnalysisJobContent.Exists)
        {
          //Log.Message(ResultAnalysisJobContent.FullName)
          var ProAddCollectionActionButton = ["ClrFullClassName"];
          var ValAddCollectionActionButton = ["UIController.JobContent.ActionButtons.AddCollectionActionButton"];
          var CodeCollection = ResultAnalysisJobContent.FindChild(ProAddCollectionActionButton, ValAddCollectionActionButton, 2000);
          if (CodeCollection.Exists)
          {
            //Log.Message(CodeCollection.FullName)
            CodeCollection.Click()
          }
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
         Check = Check;
       else 
         Check = 1
       }
       
      Log.Message("Check is " + Check)   
      if ( Check ==0 )
      Log.Message("Field Justification Left Correct")
      else Log.Warning("Field Justification Was set Left but Show Right")
      Check = 0;
  

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
    
  

}


var ReadCode;
var Code_console;
var ChildCount
function Get_CODE()
{
    var ProBottomBorder = ["ClrFullClassName","WPFControlName"];
    var ValBottomBorder = ["System.Windows.Controls.Grid","BottomBorder"];
    var BottomBorder = Sys.Process("DL.CODE").FindChild(ProBottomBorder, ValBottomBorder, 2000);
    if (BottomBorder.Exists)
    {
      //Log.Message(BottomBorder.FullName)
      var ProTabControl = ["ClrFullClassName","WPFControlName"];
      var ValTabControl = ["System.Windows.Controls.TabControl","BottomTabControl"];
      var TabControl = BottomBorder.FindChild(ProTabControl, ValTabControl, 2000);
      if (TabControl.Exists)
      {
        //Log.Message(TabControl.FullName)
        var ProExpanderCodeSetting = ["ClrFullClassName","WPFControlText"];
        var ValExpanderCodeSetting = ["System.Windows.Controls.Expander","Code Settings"];
        var ExpanderCodeSetting = TabControl.FindChild(ProExpanderCodeSetting, ValExpanderCodeSetting, 2000);
        if (ExpanderCodeSetting.Exists)
        {
          //Log.Message(ExpanderCodeSetting.FullName)
          var ProDataGrid = ["ClrFullClassName"];
          var ValDataGrid = ["System.Windows.Controls.DataGrid"];
          var DataGrid = ExpanderCodeSetting.FindChild(ProDataGrid, ValDataGrid, 2000);
          if (DataGrid.Exists)
          {
            //Log.Message(DataGrid.FullName)
            var ProDataGridRow = ["ClrFullClassName"];
            var ValDataGridRow = ["System.Windows.Controls.DataGridRow"];
            var DataGridRow = DataGrid.FindChild(ProDataGridRow, ValDataGridRow, 2000);
            if (DataGridRow.Exists)
            {
              //Log.Message(DataGridRow.FullName)
              var ProItemsControl = ["ClrFullClassName"];
              var ValItemsControl = ["System.Windows.Controls.ItemsControl"];
              var ItemsControl = DataGridRow.FindChild(ProItemsControl, ValItemsControl, 2000);
              if (ItemsControl.Exists)
              {
                //Log.Message(ItemsControl.FullName)
                //Log.Message(ItemsControl.ChildCount)
                var ChildCount = ItemsControl.ChildCount
                ChildCount2 = ChildCount +1
                ReadCode="";
                var i=1
                for(i=1;i < ChildCount2; i++)
                {
                  var ProContentPresenter = ["ClrFullClassName","WPFControlOrdinalNo"];
                  var ValContentPresenter = ["System.Windows.Controls.ContentPresenter", i];
                  var ContentPresenter = ItemsControl.FindChild(ProContentPresenter, ValContentPresenter, 2000);
                  if (ContentPresenter.Exists)
                  {
                    ReadCode =ReadCode+ContentPresenter.DataContext ;
                  }
                }
                Log.Message("Code Result: " +ReadCode);
                
      
              } 
      
      
            } 
      
          }     
        }
      
      }
    }
}


function Get_Console_Result()
{
    var arrPro = ["ClrFullClassName" , "WPFControlText"];
    var arrVal = ["System.Windows.Controls.TabItem", "Console"];
    var consoleTab  = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 2000) ;  
    if (consoleTab.Exists)
      {
        if (consoleTab.IsSelected == false)
             Click_Console();
        if (consoleTab.IsSelected == true)
        {
             var itemControlPro = ["ClrFullClassName"];  
             var itemControlVal = ["System.Windows.Controls.ItemsControl"];
             var itemControlObj = consoleTab.Parent.FindChild(itemControlPro, itemControlVal, 2000);
             //Log.Message(itemControlObj.FullName);
             if (itemControlObj.Exists)
               { 
                 ChildCount = itemControlObj.childCount;
                 ChildCount = aqConvert.VarToStr(ChildCount)
                // Log.Message("ChildCount is "+ ChildCount);
    //                       var ProContentPresenter = ["Name"];
    //                       var ValContentPresenter = ["WPFObject(\"ContentPresenter\", \"\","+ChildCount+")"];
                 var ProContentPresenter = ["ClrFullClassName","WPFControlOrdinalNo"];
                 var ValContentPresenter = ["System.Windows.Controls.ContentPresenter",ChildCount];
                 var ContentPresenter = itemControlObj.FindChild(ProContentPresenter, ValContentPresenter, 2000);
                 if (ContentPresenter.Exists)
                  {
                     //ShowCode = ShowCode.Text
                     //Log.Message(ContentPresenter.FullName)
                     var ProTextBlockCode = ["ClrFullClassName","WPFControlOrdinalNo"];
                     var ValTextBlockCode = ["System.Windows.Controls.TextBlock",2];
                     var TextBlockCode = ContentPresenter.FindChild(ProTextBlockCode, ValTextBlockCode, 2000);
                     if (TextBlockCode.Exists)
                     {
                      // Log.Message(TextBlockCode.FullName)
                         Code_console = TextBlockCode.Text;
                        Code_console =aqConvert.VarToStr(Code_console);
                        var codeconsloellength = aqString.GetLength(Code_console);
                       Log.Message("code consloe: " + Code_console)
                       Log.Message("code console length: " + codeconsloellength)
                     }
                  }
              } 
        }       
    }
}


function Click_AdvancedSetup()
{
    var ProContentExpander = ["ClrFullClassName","WPFControlName"];
    var ValContentExpander = ["IVSControls.Controls.CustomExpander.ContentExpander","CollapsedExpander"];
    var ContentExpander = Sys.Process("DL.CODE").FindChild(ProContentExpander, ValContentExpander, 2000);
    if (ContentExpander.Exists)
    {
      //Log.Message(ContentExpander.FullName)
      var ProScrollViewer = ["ClrFullClassName","WPFControlName"];
      var ValScrollViewer = ["System.Windows.Controls.ScrollViewer","StepsPanelScrollViewer"];
      var ScrollViewer = ContentExpander.FindChild(ProScrollViewer, ValScrollViewer, 2000);
      if (ScrollViewer.Exists)
      {
        //Log.Message(ScrollViewer.FullName)
        var Proborder = ["ClrFullClassName","WPFControlName"];
        var Valborder = ["System.Windows.Controls.Border","border"];
        var border = ScrollViewer.FindChild(Proborder, Valborder, 2000);
        if (border.Exists)
        {
          //Log.Message(border.FullName)
          var ProAdvanced = ["ClrFullClassName","WPFControlOrdinalNo"];
          var ValAdvanced = ["System.Windows.Controls.ContentPresenter","2"];
          var Advanced = border.FindChild(ProAdvanced, ValAdvanced, 2000);
          if (Advanced.Exists)
          {
            //Log.Message(Advanced.FullName)
            Advanced.Click();
            Result_Click();
            Get_CODE();
            //Click Formatting
            arrPro = ["ClrFullClassName", "WPFControlText"];
            arrVal = ["System.Windows.Documents.Run", "Data Formatting"];
            FormattingObj = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
            FormattingObj = FormattingObj.Parent;
            FormattingObj.Click();
            Initization_DLcode();
 
          }
          
          }
      }
    }
}

//*******************************************************************************************************************************

function Compare_Cutting_PatternType(mode,stt){ // mode: Str_KeepAfter  Str_KeepBefore
//  var result = "937400028"; //get from result
//  var act_result = "<STX>0028******" //  get from console
//  var act_result = "<STX>******0028"
  var Code_length = aqConvert.StrToInt(length_Str.slice(4)); // cut out [BS] and covert to int
  var key = "";
  var start =FillingPattern_Str.slice(4);                           //"*"
//  var test = "40";
//  test_length = aqString.GetLength(test);
  ReadCode = aqConvert.VarToStr(ReadCode);
  var result_length = aqString.GetLength(ReadCode);
  Log.Message("result LENGTH: "+result_length);
  
  // get pattern string
  var patternString = PatternString_Str.slice(4); // string "p"
  var patternString_length = aqString.GetLength(patternString); 
  //Log.Message("patternString_length: " + patternString_length);
  
  //get act_result from Console
  var act_result = Code_console.slice(5); // 0028****** or  ******0028
  act_result = aqConvert.VarToStr(act_result);
  var act_result_length = aqString.GetLength(act_result);
  Log.Message("act result: "+act_result);
  Log.Message("act result LENGTH: "+ act_result_length);

  
  // Get Pos of patternString on CodeResult  
//  var cutting_pos = ReadCode.indexOf(patternString);  // num: 4 lastIndexOf
//    Log.Message("cutting_pos: " + cutting_pos);
  // KEEP AFTER
  if(mode ==  Str_KeepAfter){   
    var cutting_pos = ReadCode.lastIndexOf(patternString);  // num: 4 lastIndexOf
    Log.Message("cutting_pos: " + cutting_pos);
    var last_result = ReadCode.slice(cutting_pos+patternString_length); // 0028
    Log.Message("last_result " + last_result);
    var last_result_length = aqString.GetLength(last_result);
    //Log.Message("Keep after");
//    Log.Message("last_result_after " + last_result_after);
//    //left align
//    las_index = act_result.indexOf(last_result); // pos = 6 => right 
//    Log.Message("last Index: " +(las_index));    // pos = 0 => left align
//    // compare wwith Justification
    }

   // KEEP BEFORE 
  if(mode ==  Str_KeepBefore){  
    var cutting_pos = ReadCode.indexOf(patternString);  // num: 4 lastIndexOf
    Log.Message("cutting_pos: " + cutting_pos);
    var last_result = ReadCode.slice(0,cutting_pos);
    //Log.Message("last_result_before " + last_result);
    var last_result_length = aqString.GetLength(last_result);
    //Log.Message("Keep Before");
  }
  
  // create *
    for(i=0;i<(Code_length-last_result_length);i++){   // Code_length = 20; last_result_length= after code was cut
       key = key +start;
    }
  // create code depend on Left or Right
    if(stt == Str_LeftAligned) {
      var last_total_result = last_result + key;
      last_total_result=  aqConvert.VarToStr(last_total_result);
      Log.Message("last_total_result: "+last_total_result);
       }
    if(stt == Str_RightAligned) {
      var last_total_result = key + last_result ;
      Log.Message("last_total_result: " + last_total_result);
       }
    var last_total_result_length = aqString.GetLength(last_total_result);
    Log.Message("last_total_result_length: " + last_total_result_length);
       
     
  // compare total code
//     if(last_total_result == act_result) Log.Message("yeahh");
//     else Log.Error("nooo"); 
     var out= 0;
     for( y=0; y < last_total_result_length ; y++){
         if(last_total_result[y] != act_result[y]) {Log.Message("erro"); out =1;}
         Log.Message(last_total_result[y]+" - "+act_result[y]);
     }
     if(out == 0) Log.Message("CODE FORMATTING IS ***CORRECT***");
     else Log.Error("CODE FORMATTING IS *** NOT CORRECT***");

}


function Compare_Cutting_GenericType(stt){
  var Code_length_Setup = aqConvert.StrToInt(length_Str.slice(4)); // cut out [BS] and covert to int
  var key ="";
  var start =FillingPattern_Str.slice(4); 
  //Get Code_result tab
  ReadCode = aqConvert.VarToStr(ReadCode);
  var ReadCode_length = aqString.GetLength(ReadCode);
  Log.Message("result LENGTH: "+ReadCode_length);
  
  //get act_result from Console
  var act_result = Code_console.slice(5); // 0028****** or  ******0028
  act_result = aqConvert.VarToStr(act_result);
  var act_result_length = aqString.GetLength(act_result);
  Log.Message("act result: "+act_result);
  Log.Message("act result LENGTH: "+ act_result_length);
  
  if(ReadCode_length <= Code_length_Setup){
    //Create expect code
    for(i=0;i<(Code_length_Setup-ReadCode_length);i++){   // Code_length = 20; last_result_length= after code was cut
       key = key +start;}
    if(stt == Str_LeftAligned){
      var last_total_result = ReadCode + key;
      last_total_result=  aqConvert.VarToStr(last_total_result);
      Log.Message("last_total_result : "+last_total_result);
      
    }
  }
}

function Compare_Cutting_SimpleType()
{
  //Get_Console_Result();
  //Click_AdvancedSetup();
  CuttingType();
  ReadCodeCutting = Code_console.slice(5,(Code_console.length-1)) //from code
  CodeShow = aqConvert.VarToStr(CodeShow);
  ReadCodeCutting = aqConvert.VarToStr(ReadCodeCutting);
  Log.Warning(CodeShow)
  Log.Warning(ReadCodeCutting)
  var str1 = CodeShow;
  var str2 = ReadCodeCutting;
  var strFormat;

  switch (aqString.Compare(str1, str2, false))
  {
    case -1 : strFormat = "\"%s\" is less than \"%s\".";    break;
    case 0  : strFormat = "\"%s\" and \"%s\" are equal.";   break;
    case 1  : strFormat = "\"%s\" is greater than \"%s\"."; break;
  }

  Log.Warning(aqString.Format(strFormat, str1, str2));
  
}

function CuttingType()
{
  
  //ReadCode = "31666249588376" // from codde
  //ChildCount = 14
  var Leading = Leading_Str.slice(4);
  var Trailing =Trailing_Str.slice(4);
  var FillingPattern_Cut =FillingPattern_Str.slice(4);
  var FillingFull = "";
  var ReadCode_length = aqString.GetLength(ReadCode); 
  Trailing = ReadCode_length - Trailing;
  Code_Cutting = ReadCode.slice(Leading,Trailing);
  Code_Cutting_length = Code_Cutting.length;
  WordsFill= Length_default - Code_Cutting_length;
  Log.Warning("Length_default " + Length_default);
  Log.Warning("Code_Cutting " + Code_Cutting);
  Log.Warning("WordsFill " + WordsFill);
  Log.Warning("ReadCode " +ReadCode);
  Log.Warning("Code_Cutting "+ Code_Cutting);
  Log.Warning("FillingPattern_Cut "+ FillingPattern_Cut);
  var V =0
  for(V=0 ; V < WordsFill; V++)  
    {
     FillingFull = FillingFull + FillingPattern_Cut
     
    }
  if (Justification_default== "Left Aligned")
  {
    
    
    CodeShow = Code_Cutting + FillingFull
    Log.Warning("CodeShow " + CodeShow)
    Log.Warning("FillingFull " + FillingFull)
    
  }
  else 
  {
   CodeShow = FillingFull + Code_Cutting
   Log.Warning("CodeShow " + CodeShow)
   Log.Warning("FillingFull " + FillingFull)
  }
  
}


function a(){
  var a = "0123456";
  var b= "23";
  var lengtha =  aqString.GetLength(a);
   var lengthb =  aqString.GetLength(b);
  Log.Message("lengtha: " + lengtha);
   Log.Message("lengthb: " + lengthb);
  var index = a.indexOf(b);
  Log.Message("index " + index);
  var slice = a.slice(2,3);
  Log.Message("slice " + slice);
}





//USEUNIT lib_DataFormatting
//USEUNIT string


// ************* Check Header Terminator************
function Check_Value_HeaderTerminator(){
  var Header = Dataformat.WPFObject("ParamControl", "", 2);
  var HeaderBox = Header.FindChild("WPFControlText","<STX>" ,200);
  var HeaderVal = aqObject.GetPropertyValue(HeaderBox,"Text");
  if (HeaderVal == STX)
  {
    Log.Message(" HEADER DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  }
  else Log.Message(" HEADER DEFAULT VALUE IS ***NOT CORRECT ***!!!!!!!!!");
  
  var Terminator = Dataformat.WPFObject("ParamControl", "", 3);
  var TerminatorCR = Terminator.FindChild("WPFControlText","<CR>",200);
  var TerminatorCRVal = aqObject.GetPropertyValue(TerminatorCR,"Text");
  
  var TerminatorLF = Terminator.FindChild("WPFControlText","<LF>",200);
  var TerminatorLFVal = aqObject.GetPropertyValue(TerminatorLF,"Text");
  if (TerminatorCRVal == CR & TerminatorLFVal == LF )
  {
    Log.Message(" TERMINATOR DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  }
  else Log.Message(" TERMINATOR DEFAULT VALUE IS ***NOT CORRECT ***!!!!!!!!!");
}

// ************* Check CUSTOM FIELD************
function Check_Default_CustomField(pos){           // Full
  //var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
  var FillingMode_PropArr = ["Name", "ChildCount"];
  var FillingMode_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
  var FillingMode = CustomField.FindChild(FillingMode_PropArr,FillingMode_ValArr,2000);
  // CHECK CUSTOM STRING DEFAULT VALUE
  var CustomString = CustomField.FindChild("Name","WPFObject(\"ContentControl\", \"\", 1)",4);
  var CustomString_box = CustomString.FindChild("ClrFullClassName","System.Windows.Documents.InlineUIContainer",20).Child(0);
  var CustomString_Val = aqObject.GetPropertyValue(CustomString_box, "Text");
  if(CustomString_Val == CustomString_CustomField_default) Log.Message("CUSTOM STRING CustomField DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  else Log.Message("CUSTOM STRING CustomField DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
  
  // Check Filling Mode default value
  var FillingMode_box = FillingMode.Child(0);
  var FillingMode_Val = aqObject.GetPropertyValue(FillingMode_box, "Text");
  if(FillingMode_Val == FillingMode_default) Log.Message("FILLING MODE CusomField CUSTOM DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  else Log.Message("FILLING MODE CusomField CUSTOM DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");  
}

function Check_Default_FillingMode_Custom_Expand(pos){     // Full
  //var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
  var FillingPattern = CustomField.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
  var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
  var FillingPatternbox_ValArr = ["rtbText" , true ];
  var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
    if(FillingPattern.Exists == true){
  // CHECK LENGTH DEFAULT VALUE
      var Length_box = CustomField.FindChild("ClrFullClassName","Microsoft.Windows.Controls.WatermarkTextBox",200);
      var Length_val = aqObject.GetPropertyValue(Length_box, "Text");
      if(Length_val == Length_default) Log.Message("LENGTH CusomField DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("LENGTH CusomField DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      // CHECK FILLING PATTERN DEFAULT VALUE
      var Pattern = FillingPatternbox.FindChild("ClrFullClassName", "System.Windows.Documents.Run", 200);
      var Pattern_Val = aqObject.GetPropertyValue(Pattern, "Text");
      if(Pattern_Val == FillingPattern_default) Log.Message("FILLING PATTERN CusomField DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("FILLING PATTERN CusomField DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
    }
    else
    Log.Message("Can't find FillingPattern Box");
    
    var FieldJustification = CustomField.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
    var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
    if(FieldJustificationbox.Exists == true){
    // CHECK FieldJustification DEFAULT VALUE
        var Justification = FieldJustificationbox.Child(0);
        var Justification_val = aqObject.GetPropertyValue(Justification, "Text");
        if(Justification_val == Justification_default) Log.Message("JUSTIFICATION CusomField DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
        else Log.Message("JUSTIFICATION CusomField DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
        }
    else Log.Message("Can't find FieldJustification Box");
      
}

// *************CHECK Global Statistics Field************

function Check_Default_GlobalStatisticsField(pos){          // POSSITION :2
    //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
    initializated_EditToolField_arr();
    var GlobalStatistic = EditToolField_arr[pos];
    var FillingMode = GlobalStatistic.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",3);
    var FillingModebox_PropArr = ["Name", "ChildCount"];
    var FillingModebox_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
    var FillingModebox = FillingMode.WPFObject("ParamControl", "", 1).FindChild(FillingModebox_PropArr,FillingModebox_ValArr,2000);
    //Log.Message(FillingModebox.FullName);
    if(FillingModebox.Exists == true){
      // CHECK GLOBAL FIELD TYPE GlobalStatistic DEFAULT VALUE
      var GlobalFieldType = GlobalStatistic.FindChild("Name","WPFObject(\"ContentControl\", \"\", 1)",200);
      var GlobalFieldType_box = GlobalFieldType.FindChild("ClrFullClassName","System.Windows.Controls.ComboBox",200).Child(0);
      var GlobalFieldType_Val = aqObject.GetPropertyValue(GlobalFieldType_box, "Text");
      if(GlobalFieldType_Val == GlobalFieldType_default) Log.Message("GLOBAL FIELD TYPE GlobalStatistic DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("GLOBAL FIELD TYPE GlobalStatistic DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");;
      // CHECK FILLING MODE GlobalStatistic DEFAULT VALUE
      var FillingMode_box = FillingModebox.Child(0);
      var FillingMode_Val = aqObject.GetPropertyValue(FillingMode_box, "Text");
      if(FillingMode_Val == FillingMode_default) Log.Message("FILLING MODE GlobalStatistic DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("FILLING MODE GlobalStatistic DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      // CHECK CUTTING MODE DEFAULT VALUE
      var CuttingMode = GlobalStatistic.FindChild("Name","WPFObject(\"ContentControl\", \"\", 2)",4);
      var CuttingMode_box = CuttingMode.FindChild("ClrFullClassName","System.Windows.Controls.ComboBox",6).Child(0);
      var CuttingMode_Val = aqObject.GetPropertyValue(CuttingMode_box, "Text");
      if(CuttingMode_Val == CuttingMode_default) Log.Message("CUTTING MODE GlobalStatistics DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("CUTTING MODE GlobalStatistics DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      // CHECK CUSTOM STRING DEFAULT VALUE
      var CustomString = GlobalStatistic.FindChild("Name","WPFObject(\"ContentControl\", \"\", 2)",4);
      var CustomString_box = CustomString.FindChild("ClrFullClassName","IVSControls.Controls.RangeTextBox",10);
      var CustomString_Val = aqObject.GetPropertyValue(CustomString_box, "Text");
      if(CustomString_Val == CustomString_GlobalStatistics_default) Log.Message("CUSTOM STRING GlobalStatistics DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("CUSTOM STRING GlobalStatistics DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      }
    else  Log.Message("Can't change to Fixed length");
     
}

function Check_Default_FillingMode_GlobalStatistics_Expand(pos){      //Full
    //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
    initializated_EditToolField_arr();
    var GlobalStatistic = EditToolField_arr[pos];
    var FillingPattern = GlobalStatistic.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
    var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
    var FillingPatternbox_ValArr = ["rtbText" , true ];
    var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
    if(FillingPattern.Exists == true){
      // CHECK LENGTH DEFAULT VALUE
      var Length_box = GlobalStatistic.FindChild("ClrFullClassName","Microsoft.Windows.Controls.WatermarkTextBox",200);
      var Length_val = aqObject.GetPropertyValue(Length_box, "Text");
      if(Length_val == Length_default) Log.Message("LENGTH GlobalStatistics DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("LENGTH GlobalStatistics DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      // CHECK FILLING PATTERN DEFAULT VALUE
      var Pattern = FillingPatternbox.FindChild("ClrFullClassName", "System.Windows.Documents.Run", 200);
      var Pattern_Val = aqObject.GetPropertyValue(Pattern, "Text");
      if(Pattern_Val == FillingPattern_default) Log.Message("FILLING PATTERN GlobalStatistics DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("FILLING PATTERN GlobalStatistics DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      // CHECK JUSTIFICATION DEFAULT VALUE
      var FieldJustification = GlobalStatistic.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
      var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
      var Justification = FieldJustificationbox.Child(0);
      var Justification_val = aqObject.GetPropertyValue(Justification, "Text");
      if(Justification_val == Justification_default) Log.Message("JUSTIFICATION GlobalStatistics DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("JUSTIFICATION GlobalStatistics DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      
      }
    else Log.Message("Can't find FillingPattern Box");
}
    
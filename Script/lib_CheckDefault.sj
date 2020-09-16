﻿//USEUNIT lib_DataFormatting
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
function Check_Default_FillingMode_Custom(){
  var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var FillingMode_PropArr = ["Name", "ChildCount"];
  var FillingMode_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
  var FillingMode = CustomField.FindChild(FillingMode_PropArr,FillingMode_ValArr,2000);
  // Check Filling Mode default value
    Log.Message("Check Filling Mode default value")
    var FillingMode_box = FillingMode.Child(0);
    var FillingMode_Val = aqObject.GetPropertyValue(FillingMode_box, "Text");
    if(FillingMode_Val == FillingMode_default) Log.Message("FILLING MODE CUSTOM DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
    else Log.Message("FILLING MODE CUSTOM DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");  
}

function Check_Default_FillingMode_Custom_Expand(){
  var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var FillingPattern = CustomField.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
  var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
  var FillingPatternbox_ValArr = ["rtbText" , true ];
  var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
    if(FillingPattern.Exists == true){
  // CHECK LENGTH DEFAULT VALUE
      var Length_box = CustomField.FindChild("ClrFullClassName","Microsoft.Windows.Controls.WatermarkTextBox",200);
      var Length_val = aqObject.GetPropertyValue(Length_box, "Text");
      if(Length_val == Length_default) Log.Message("LENGTH DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("LENGTH DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
      // CHECK FILLING PATTERN DEFAULT VALUE
      var Pattern = FillingPatternbox.FindChild("ClrFullClassName", "System.Windows.Documents.Run", 200);
      var Pattern_Val = aqObject.GetPropertyValue(Pattern, "Text");
      if(Pattern_Val == FillingPattern_default) Log.Message("FILLING PATTERN DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
      else Log.Message("FILLING PATTERN DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
    }
    else
    Log.Message("Can't find FillingPattern Box");
    
    var FieldJustification = CustomField.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
    var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
    if(FieldJustificationbox.Exists == true){
    // CHECK FieldJustification DEFAULT VALUE
        var Justification = FieldJustificationbox.Child(0);
        var Justification_val = aqObject.GetPropertyValue(Justification, "Text");
        if(Justification_val == Justification_default) Log.Message("JUSTIFICATION DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
        else Log.Message("JUSTIFICATION DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
        }
    else Log.Message("Can't find FieldJustification Box");
      
}


//USEUNIT lib_DataFormatting
//USEUNIT string


// ************* Check Header Terminator************
function Check_Value_HeaderTerminator(){
  var Header = Dataformat.WPFObject("ParamControl", "", 2);
  if(Header.Exists){
    var HeaderBox = Header.FindChild("ClrFullClassName","System.Windows.Documents.InlineUIContainer" ,200).Child(0);
  aqObject.CheckProperty(HeaderBox,"Text", cmpEqual, STX);
  }
  else Log.Error("Can't find Header box")
  
  var Terminator = Dataformat.WPFObject("ParamControl", "", 3);
  if(Terminator.Exists){
    var TerminatorCR = Terminator.FindChild("Name","WPFObject(\"InlineUIContainer\", \"\", 1)" ,200).Child(0); 
  var TerminatorLF = Terminator.FindChild("Name","WPFObject(\"InlineUIContainer\", \"\", 2)" ,200).Child(0);
  aqObject.CheckProperty(TerminatorCR,"Text", cmpEqual, CR);
  aqObject.CheckProperty(TerminatorLF,"Text", cmpEqual, LF);
  }
  else Log.Error("Can't find Terminator box")
  
}

// ************* Check CUSTOM FIELD************
function Check_Default_CustomField(pos){           // Full
  //var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
  
  // CHECK CUSTOM STRING DEFAULT VALUE
  var CustomString = CustomField.FindChild("Name","WPFObject(\"ContentControl\", \"\", 1)",4);
  if(CustomString.Exists){
    var CustomString_box = CustomString.FindChild("ClrFullClassName","System.Windows.Documents.InlineUIContainer",20).Child(0);
    aqObject.CheckProperty(CustomString_box,"Text", cmpEqual, CustomString_CustomField_default);
  }
   else Log.Error("Can't find CustomString box")
  
  // Check Filling Mode default value
  var FillingMode_PropArr = ["Name", "ChildCount"];
  var FillingMode_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
  var FillingMode = CustomField.FindChild(FillingMode_PropArr,FillingMode_ValArr,2000);
  if(FillingMode.Exists){
    var FillingMode_box = FillingMode.Child(0);
    aqObject.CheckProperty(FillingMode_box,"Text", cmpEqual, FillingMode_default);
  }
  else Log.Error("Can't find FillingMode box")
  
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
      aqObject.CheckProperty(Length_box,"Text", cmpEqual, Length_default);
      // CHECK FILLING PATTERN DEFAULT VALUE
      var Pattern = FillingPatternbox.FindChild("ClrFullClassName", "System.Windows.Documents.Run", 200);
      aqObject.CheckProperty(Pattern,"Text", cmpEqual, FillingPattern_default);
    }
    else
    Log.Error("Can't find FillingPattern Box");
    
    var FieldJustification = CustomField.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
    var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
    if(FieldJustificationbox.Exists == true){
    // CHECK FieldJustification DEFAULT VALUE
        var Justification = FieldJustificationbox.Child(0);
        aqObject.CheckProperty(Justification,"Text", cmpEqual, Justification_default);
        }
    else Log.Error("Can't find FieldJustification Box");
      
}

// *************CHECK Global Statistics Field************

function Check_Default_GlobalStatisticsField(pos){          // POSSITION :2
    //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
    initializated_EditToolField_arr();
    var GlobalStatistic = EditToolField_arr[pos];
    
    //Log.Message(FillingModebox.FullName);
    if(GlobalStatistic.Exists == true){
      // CHECK GLOBAL FIELD TYPE GlobalStatistic DEFAULT VALUE
      var GlobalFieldType = GlobalStatistic.FindChild("Name","WPFObject(\"ContentControl\", \"\", 1)",200);
      var GlobalFieldType_box = GlobalFieldType.FindChild("ClrFullClassName","System.Windows.Controls.ComboBox",200).Child(0);
      aqObject.CheckProperty(GlobalFieldType_box,"Text", cmpEqual, GlobalFieldType_default);
      
      // CHECK FILLING MODE GlobalStatistic DEFAULT VALUE
      var FillingMode = GlobalStatistic.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",3);
      var FillingModebox_PropArr = ["Name", "ChildCount"];
      var FillingModebox_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
      var FillingModebox = FillingMode.WPFObject("ParamControl", "", 1).FindChild(FillingModebox_PropArr,FillingModebox_ValArr,2000);
      var FillingMode_box = FillingModebox.Child(0);
      aqObject.CheckProperty(FillingMode_box,"Text", cmpEqual, FillingMode_default);
      
      // CHECK CUTTING MODE DEFAULT VALUE
      var CuttingMode = GlobalStatistic.FindChild("Name","WPFObject(\"ContentControl\", \"\", 2)",4);
      var CuttingMode_box = CuttingMode.FindChild("ClrFullClassName","System.Windows.Controls.ComboBox",6).Child(0);
      aqObject.CheckProperty(CuttingMode_box,"Text", cmpEqual, CuttingMode_default);

      // CHECK CUSTOM STRING DEFAULT VALUE
      var CustomString = GlobalStatistic.FindChild("Name","WPFObject(\"ContentControl\", \"\", 2)",4);
      var CustomString_box = CustomString.FindChild("ClrFullClassName","IVSControls.Controls.RangeTextBox",10);
      aqObject.CheckProperty(CustomString_box,"Text", cmpEqual, CustomString_GlobalStatistics_default);

      }
    else  Log.Error("Can't find GlobalStatistic ");
     
}

function Check_Default_FillingMode_GlobalStatistics_Expand(pos){      //Full
    //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
    initializated_EditToolField_arr();
    var GlobalStatistic = EditToolField_arr[pos];
    
    if(GlobalStatistic.Exists == true){
      // CHECK LENGTH DEFAULT VALUE
      var Length_box = GlobalStatistic.FindChild("ClrFullClassName","Microsoft.Windows.Controls.WatermarkTextBox",200);
      aqObject.CheckProperty(Length_box,"Text", cmpEqual, Length_default);

      // CHECK FILLING PATTERN DEFAULT VALUE
      var FillingPattern = GlobalStatistic.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
      var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
      var FillingPatternbox_ValArr = ["rtbText" , true ];
      var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
      var Pattern = FillingPatternbox.FindChild("ClrFullClassName", "System.Windows.Documents.Run", 200);
      aqObject.CheckProperty(Pattern,"Text", cmpEqual, FillingPattern_default);

      // CHECK JUSTIFICATION DEFAULT VALUE
      var FieldJustification = GlobalStatistic.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
      var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
      var Justification = FieldJustificationbox.Child(0);
      aqObject.CheckProperty(Justification,"Text", cmpEqual, Justification_default);

      
      }
    else Log.Message("Can't find GlobalStatistic");
}
    
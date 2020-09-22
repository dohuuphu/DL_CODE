﻿//USEUNIT string
//USEUNIT lib_deviceInfo
var Dataformat,DLCode;
var FieldEditControl;
function Initization_DLcode(){
 DLCode = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", const_firmware);
// Dataformat = DLCode.WPFObject("Shell", "DL.CODE 1.9.0.60", 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1);
 var a = ["Name","ClrFullClassName" ];
 var b = ["WPFObject(\"UserControl\")", "IVS_UI.Views.PropertyViews.OutputMessagePropertiesView"];
 Dataformat =DLCode.FindChild(a, b, 2000).Child(0).WPFObject("StackPanel", "", 1);
 var FieldEditControl = DLCode.FindChild("WPFControlName","FieldEditingControl",200);

}

// ********************************************* Message format ****************************************************** 
//function Message_format(stt) // Check Separator box and fill string 
//{
//  if (stt == "Collection"){
//    Check_Separator();
////************ Find Separator *********
////    var Separator_PropArr = ["WPFControlName", "Visible"];
////    var Separator_ValArr = ["CollectionSeparatorParamControl" , true ];
////    var Separator = Dataformat.FindChild(Separator_PropArr, Separator_ValArr, 2000); 
////    // Find Separetor box
////    var SeparatorBox_PropArr = ["WPFControlName", "Visible"];
////    var SeparatorBox_ValArr = ["rtbText" , true ];
////    var SeparatorBox = Separator.FindChild(SeparatorBox_PropArr, SeparatorBox_ValArr, 2000);
////  
////    if(SeparatorBox.Exists == true){
////          Log.Message("fill Separator");
////          SeparatorBox.DblClick();
////          SeparatorBox.Keys(Separato_Str);
////    }
////    else
////        Log.Message("Can't find Saparator box!!!");
//    //********************* Define Custom Field ************************
////    Edit_CustomString(stt)
////    Edit_FillingMode_CustomField(stt);  
//  }
//  else {
//    //********************* Define Custom Field ************************
////          Edit_CustomString(stt)
////          Edit_FillingMode_CustomField(stt);
////          clickEdittool(2);  
////          Edit_FillingMode_GlobalStatistic(stt);
////          clickEdittool(3);
////          Edit_CustomString("End");
//  }
//// Counting_Edit_CustomString = 0;
//
//}

function Check_Separator(){
  var output=0;
  var Separator = Dataformat.FindChild("WPFControlName", "CollectionSeparatorParamControl", 2000);  
  if(Separator.Exists == true){
    if(Separator.Visible == true){
      var SeparatorBox = Separator.FindChild("WPFControlName", "rtbText", 2000);
      var SeparatorVal= Separator.FindChild("ClrFullClassName", "System.Windows.Documents.Paragraph", 2000).Child(0);
      aqObject.CheckProperty(SeparatorVal,"Text", cmpEqual, SerapatorDefault);
      // Edit Separator 
      SeparatorBox.DblClick();
      SeparatorBox.Keys(Separato_Str);
      output = 1;
     }
  }
    return output;              // return 0: Separator box does NOT Exist
                               //        1: Separator box does Exist
}


// *********************************************Lib Custom Field*****************************************************
var EditToolField_arr=[];
function initializated_EditToolField_arr(){
  for(var y =1; y < EditToolField_arr.length;y++)                  // Remove Element from Customfield_arr array            
  {
    EditToolField_arr[y]= null;
  } 
   
  for (var i=1; i<= count; i++)                                      // create 10 path for Customfield will be exist (can change whatever you want)
  {
    EditToolField_arr[i] = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", "+i+")",2000); 
  }
  //Log.Message("custonfile 1: "+EditToolField_arr[1].FullName);
}



// ************************************ setup Customtool_place **********************************
//var place=[];
//function Setup_Customtool_place(){                     // arrange the arr
//  var pos=0;
//  for(var i =0; i < place.length;i++)                  // Remove Element from Place array            
//  {
//    place[i]= null;
//  } 
//  for(var y =0; y < Get_Customtool_place.length; y++ )
//  {
//    if(Get_Customtool_place[y]!= null){     
//      pos++;
//      
//      place[pos]=Get_Customtool_place[y];
//      //Log.Message("Get_Customtool_place= "+ Get_Customtool_place[y]);
//      //Log.Message("Place arr "+ pos+"= " + place);
//    }
//  }
//}
//************ Find Custom Field *********
var Counting_Edit_CustomString = 0;

function Edit_CustomString(pos,str){
  //Counting_Edit_CustomString ++;                                              // count number EditCustomstring was called
  //Setup_Customtool_place();
  initializated_EditToolField_arr();
 // Log.Message("Counting_Edit_CustomString= " + Counting_Edit_CustomString);
  //var position = place[Counting_Edit_CustomString];
  //Log.Message("positon= " + position);
  var CustomField = EditToolField_arr[pos] ; 
  if(CustomField.Exists == true){
     var CustomStringbox = CustomField.FindChild("WPFControlName","rtbText", 2000);  // find CustomString box
     CustomStringbox.DblClick();
     if (str == "Code:") CustomStringbox.Keys(Code_Str);
     if (str == "NoRead") CustomStringbox.Keys(NoRead_Str);
     if (str == "End") CustomStringbox.Keys(End_Str);
     if (str == "Space") CustomStringbox.Keys(Space_Str);
     if (str == "No") CustomStringbox.Keys(No_Str);
     if (str == "Read") CustomStringbox.Keys(Read_Str);
  }
  else
      Log.Error("Can't find CustomField");

  
}

//************ Edit Filling Mode *********   
function Edit_FillingMode_CustomField(pos){
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
  //var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000);  
  if(CustomField.Exists == true){
    var FillingMode_PropArr = ["Name", "ChildCount"];
    var FillingMode_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
    var FillingMode = CustomField.FindChild(FillingMode_PropArr,FillingMode_ValArr,2000);
    FillingMode.ClickItem(1); // change to Fixed length
  }
  else
      Log.Error("Can't find CustomField");
}
//************ Edit Filling Pattern *********
function Edit_FillingPattern_CustomField(pos,Str){  
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
//  var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000);
  

  if(CustomField.Exists == true){
    //Log.Message("Edit Filling pattern");
    var FillingPattern = CustomField.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
    var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
    var FillingPatternbox_ValArr = ["rtbText" , true ];
    var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
    FillingPatternbox.DblClick();
    FillingPatternbox.Keys(Str);
    }
  else
    Log.Error("Can't find CustomField");
}
//************ Edit Field Justification *********
function Edit_FieldJustification_CustomField(pos){  
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
 // var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  
  if(CustomField.Exists == true){   
    //Log.Message("Field Justificationbox is changing to Right Aligned");
    var FieldJustification = CustomField.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
    var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
    FieldJustificationbox.ClickItem(1); // change to Right Aligned
    }
    else Log.Error("Can't find CustomField");
}



// *********************************************Global Statistics Field*****************************************************

function Edit_FillingMode_GlobalStatistic(pos){
  initializated_EditToolField_arr();
  var GlobalStatistic = EditToolField_arr[pos];
  //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
  
  //Log.Message(FillingModebox.FullName);
  if(GlobalStatistic.Exists == true){ 
    //Log.Message("Filling mode is changing...");
    var FillingMode = GlobalStatistic.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",3);
    var FillingModebox_PropArr = ["Name", "ChildCount"];
    var FillingModebox_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
    var FillingModebox = FillingMode.FindChild(FillingModebox_PropArr,FillingModebox_ValArr,2000);
    FillingModebox.ClickItem(1); // change to Fixed length 
  }
  else
      Log.Error("Can't find Global_Statistic");
}

//************ Edit Filling Pattern *********
function Edit_FillingPattern_GlobalStatistic(pos,Str){  
  initializated_EditToolField_arr();
  var GlobalStatistic = EditToolField_arr[pos];
  //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
 
  if(GlobalStatistic.Exists == true){    
    //Log.Message("Filling pattern");
    var FillingPattern = GlobalStatistic.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
    var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
    var FillingPatternbox_ValArr = ["rtbText" , true ];
    var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
    FillingPatternbox.DblClick();
    FillingPatternbox.Keys(Str);
    }
  else
    Log.Error("Can't find Global_Statistic");
}

//************ Edit Field Justification *********
function Edit_FieldJustification_GlobalStatistic(stt){  
  initializated_EditToolField_arr();
  var GlobalStatistic = EditToolField_arr[pos];
 // var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
  if(GlobalStatistic.Exists == true){
    //Log.Message("Field Justificationbox is changing to Right Aligned");
    var FieldJustification = GlobalStatistic.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
    var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
    FieldJustificationbox.ClickItem(1); // change to Right Aligned
  }
  else
    Log.Error("Can't find Global_Statistic");

}

// ********************************************* Code Related Field *****************************************************
function Edit_FillingMode_CodeRelated(stt){ //stt
  initializated_EditToolField_arr();
  var CodeRelated = EditToolField_arr[pos];
  //var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var FillingMode = CodeRelated.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",3);
  var FillingModebox_PropArr = ["Name", "ChildCount"];
  var FillingModebox_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
  var FillingModebox = FillingMode.FindChild(FillingModebox_PropArr,FillingModebox_ValArr,2000);
  
  // CHECK FIELD TYPE DEFAULT VALUE
  var FieldType = CodeRelated.FindChild("Name","WPFObject(\"ContentControl\", \"\", 1)",6);
  var FieldType_Prop_arr = ["ClrFullClassName","WPFControlText"];
  var FieldType_Val_arr  =["System.Windows.Controls.TextBlock","Code Content"];
  var FieldType_box = FieldType.FindChild(FieldType_Prop_arr,FieldType_Val_arr,200);
 // Log.Message(FieldType.FullName);
  var FieldType_Val = aqObject.GetPropertyValue(FieldType_box, "Text");
  if(FieldType_Val == FieldType_default) Log.Message("FIELD TYPE DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  else Log.Message("FIELD TYPE DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
 // CHECK FILLING MODE DEFAULT VALUE
  var FillingMode_check = FillingModebox.Child(0);
  var FillingMode_Val = aqObject.GetPropertyValue(FillingMode_check, "Text");
  if(FillingMode_Val == FillingMode_default) Log.Message("FILLING MODE CODE DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  else Log.Message("FILLING MODE DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
 
  
  if(FillingModebox.Exists == true){
    Log.Message("Filling mode is changing...");
    FillingModebox.ClickItem(1); // change to Fixed length
    Edit_FillingPattern_CodeRelated(stt);
    
  }
  else
      Log.Message("Can't change to Fixed length");
}

function Edit_FillingPattern_CodeRelated(stt){  
  var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var FillingPattern = CodeRelated.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
  var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
  var FillingPatternbox_ValArr = ["rtbText" , true ];
  var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
  if(FillingPattern.Exists == true){
    Log.Message("Filling pattern");
    FillingPatternbox.DblClick();
    FillingPatternbox.Keys(FillingPatternbox_Str);
    if(stt == 0 ){                                //Cutting_Simple mode
      Change_CuttingPattern(stt);
      Remove();     
    }
    if(stt == 1 ){                                //Cutting_Pattern mode
      Change_CuttingPattern(stt);
          
    }
    }
  else
    Log.Message("Can't find FillingPattern Box");
}

function Remove(){
  var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var CuttingPattern_Field = CodeRelated.WPFObject("ContentExpander", "", 1).WPFObject("test").WPFObject("ContentControl", "", 2);
  var Remove_Leading = CuttingPattern_Field.FindChild("Name","WPFObject(\ParamControl\", \"\", 1)",200); 
  var Leading_box = Remove_Leading.FindChild("WPFControlName","TextBox",200); 
  
  var Remove_Trailing = CuttingPattern_Field.FindChild("Name","WPFObject(\ParamControl\", \"\", 2)",200); 
  var Trailing_box = Remove_Trailing.FindChild("WPFControlName","TextBox",200); 

  
  Leading_box.DblClick();
  Leading_box.Keys(Leading_Str);
  Trailing_box.DblClick();
  Trailing_box.Keys(Trailing_Str);
}

function Change_CuttingPattern(numb){ //numb
  var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var CuttingPattern_Field = CodeRelated.WPFObject("ContentExpander", "", 1).WPFObject("test").WPFObject("ContentControl", "", 2);
  var CuttingType = CuttingPattern_Field.WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("cuttingModeComboBox");
  // CHECK CUTTING PATTERN TYPE DEFAULT VALUE
  var CuttingType_box = CuttingType.Child(0);
  var CuttingType_val = aqObject.GetPropertyValue(CuttingType_box,"Text");
  if(CuttingType_val == CuttingType_default) Log.Message("CUTTING PATTERN TYPE DEFAULT VALUE IS ***CORRECT*** !!!!!!!!!");
  else Log.Message("CUTTING PATTERN TYPE DEFAULT VALUE IS ***NOT CORRECT*** !!!!!!!!!");
  
  if(numb == 0) CuttingType.ClickItem(0);
  if(numb == 1) CuttingType.ClickItem(1);
  if(numb == 2) CuttingType.ClickItem(2);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
var count = 0;
var Get_Customtool_place = [];
function Sellect_Mode(Select_arr){
  Check_NumbToolEdit();
  count = 0;
//  for(var y =0; y < Get_Customtool_place.length; y++)                  // Remove Element from Get_Customtool_place array            
//  {
//    Get_Customtool_place[y]= null;
//  } 
 // Custom_count = 0;
  //var Custom_count = 0;
  var Separato_Exist = Check_Separator();
  //Log.Message("asd "+Separato_Exist);
  var ControlToolBar = DLCode.FindChild("WPFControlName","controlToolBar",200);
  
  if(Separato_Exist == 1) 
  {
    var CodeRelatedTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 1)",200);
    var CodeQualityTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 4)",200);
    var GlobalStatisticsTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 5)",200);
    var GlobalReadingTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 6)",200);
    var CustomFieldTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 7)",200);
    var DiagnosticsTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 8)",200);
  }
  if(Separato_Exist == 0) 
  {
    var CodeRelatedTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 2)",200);
    var CodeQualityTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 3)",200);
    var GlobalStatisticsTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 5)",200);
    var GlobalReadingTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 6)",200);
    var CustomFieldTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 7)",200);
    var DiagnosticsTool = ControlToolBar.FindChild("Name","WPFObject(\"ListBoxItem\", \"\", 8)",200);
  }
  
  
  for(var i =0; i < Select_arr.length;i++)
  {
    if(Select_arr[i] == "CodeRelatedTool") {CodeRelatedTool.Click(); count++;}
    if(Select_arr[i] == "CodeQuality") {CodeQualityTool.Click(); count++;}
    if(Select_arr[i] == "GlobalStatisticsTool") {GlobalStatisticsTool.Click(); count++;}
    if(Select_arr[i] == "GlobalReadingTool") {GlobalReadingTool.Click(); count++;}
    if(Select_arr[i] == "CustomFieldTool") {
      CustomFieldTool.Click(); 
      count++;
//      var sample = count;
//      Get_Customtool_place[sample] = sample;
    }
    if(Select_arr[i] == "DiagnosticsTool") {DiagnosticsTool.Click(); count++;}
  }
  //count= Custom_count+count;
  //Log.Message("new tool number: " + count);
  initialization_FieldEditControl_Var(count);
  
}

function Check_NumbToolEdit(){
  Sys.Process("DL.CODE").Refresh();
  var FieldEditControl = DLCode.FindChild("WPFControlName","FieldEditingControl",200);
  var NumbToolEdit = aqObject.GetPropertyValue(FieldEditControl,"ChildCount");
  //Log.Message("default tool number: " + (NumbToolEdit-1));
  if(NumbToolEdit > 1)                                       // defaut exists 1child: AdornerLayer
  {
    initialization_FieldEditControl_Var(NumbToolEdit-1);
    for(var i =1; i <= NumbToolEdit-1; i++)                  // Remove tool edit default            
    {
      Edit[i].Click();
      Sys.Desktop.Keys( "[Del]");
    }
  }   
}

function Click_Mess2(){
  var OutputMessage = DLCode.FindChild("WPFControlName","AbstractTaskTreeControl",200);
  var Message2 = OutputMessage.WPFObject("TreeViewItem", "", 4).WPFObject("TreeViewItem", "", 2).WPFObject("TreeViewItem", "", 2);
  Message2.Click();
  Counting_Edit_CustomString = 0;
}
function Click_Mess1(){
  var OutputMessage = DLCode.FindChild("WPFControlName","AbstractTaskTreeControl",200);
  var Message1 = OutputMessage.WPFObject("TreeViewItem", "", 4).WPFObject("TreeViewItem", "", 2).WPFObject("TreeViewItem", "", 1);
  Message1.Click();
  Counting_Edit_CustomString = 0;
}

//**************************************** Field Edit Control ********************************************
var Edit = [];
//var FieldEditControl = DLCode.FindChild("WPFControlName","FieldEditingControl",200);

function initialization_FieldEditControl_Var(Num_item){
  var FieldEditControl = DLCode.FindChild("WPFControlName","FieldEditingControl",200);
  for(var y =1; y <= Edit.length;y++)                  // Remove Element from array            
  {
    Edit[i]= null;
  }    
  
  for(var i = 1; i<= Num_item; i++)
  {
    Edit[i]= FieldEditControl.WPFObject("ListBoxItem", "", i);
  }
  //Log.Message(Num_item);
  //Log.Message(Edit[Num_item-1].FullName);
}


            
function DragEdit(act_place, new_place){
  initialization_FieldEditControl_Var(count);
  var Edit_Drag = Edit[act_place];
  var Heightbox = aqObject.GetPropertyValue(Edit_Drag,"Height");
  var Widthbox = aqObject.GetPropertyValue(Edit_Drag,"Width");
  var Centerbox = [Heightbox/2, Widthbox/2];
  //Log.Message(Centerbox[0]);
  //Log.Message(Centerbox[1]);
  var step = act_place - new_place;
  if(act_place >= new_place) Edit_Drag.Drag(Centerbox[0],Centerbox[1],-(step*Widthbox),0); // Move item Forward           
  if(act_place < new_place) Edit_Drag.Drag(Centerbox[0],Centerbox[1],-((step-1)*Widthbox),0); // Move item Backward
}

function clickEdittool(place){
  //var ClickEdit = initialization_FieldEditControl_Var(place);
  Sys.Process("DL.CODE").Refresh();
  initialization_FieldEditControl_Var(count);
  var ClickEdit = Edit[place];
  //Log.Message(Edit[place].FullName);
   ClickEdit.Click();
}










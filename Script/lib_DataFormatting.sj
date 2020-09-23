//USEUNIT string
//USEUNIT lib_deviceInfo
var Dataformat;
//var DLCode=Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", const_firmware);
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
//    Check_Exist_Separator();
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
 var default_input="";
function Check_Exist_Separator(str){
  var output=0;
  //var default_input="";
  var Separator = Dataformat.FindChild("WPFControlName", "CollectionSeparatorParamControl", 2000);  
  if(Separator.Exists == true){
    if(Separator.Visible == true){
      Sys.Process("DL.CODE").Refresh();
     var SeparatorBox = Separator.FindChild("WPFControlName", "rtbText", 2000);
     var SeparatorVal= Separator.FindChild("ClrFullClassName", "System.Windows.Documents.Paragraph", 2000);
//     Log.Message(SeparatorVal.FullName);
//     Log.Message("SeparatorVal.Text: " + SeparatorVal.WPFControlText);
        if(SeparatorVal.WPFControlText != default_input){
           SeparatorBox.DblClick();
           SeparatorBox.Keys(str);
           //Check input value
           var SeparatorVal= Separator.FindChild("ClrFullClassName", "System.Windows.Documents.Paragraph", 2000).Child(0);
           var length = aqString.GetLength(str)
           default_input = str.slice(4,4+length);
           //Log.Message("default_input " + default_input);
           aqObject.CheckProperty(SeparatorVal,"WPFControlText", cmpEqual, default_input);
           }     
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
  var Input_val="";
  if(CustomField.Exists == true){
     var CustomStringbox = CustomField.FindChild("WPFControlName","rtbText", 2000);  // find CustomString box
     CustomStringbox.DblClick();
     if (str == Str_Code) {CustomStringbox.Keys(Code_Str); Input_val=Str_Code;}
     if (str == Str_Noread) {CustomStringbox.Keys(NoRead_Str); Input_val=Str_Noread;}
     if (str == Str_End) {CustomStringbox.Keys(End_Str); Input_val=Str_End;}
     if (str == Str_Space) {CustomStringbox.Keys(Space_Str); Input_val=Str_Space;}
     if (str == Str_No) {CustomStringbox.Keys(No_Str); Input_val=Str_No;}
     if (str == Str_Read) {CustomStringbox.Keys(Read_Str); Input_val=Str_Read;}
  }
  else
      Log.Error("Can't find CustomField");
  ////Check input value
  var CustomString_Val = CustomStringbox.FindChild("Name","WPFObject(\"Paragraph\", \"\", 1)",4);
  aqObject.CheckProperty(CustomString_Val,"WPFControlText", cmpEqual, Input_val);

  
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
  //Check input value
  var FillingPattern_Val = FillingPatternbox.FindChild("Name","WPFObject(\"Paragraph\", \"\", 1)",4);
  var lenght = aqString.GetLength(FillingPattern_Val.WPFControlText);
  var Input_Val = Str.slice(4,4+lenght);
  //Log.Message("dasdgajghfd: " + Input_Val);
  aqObject.CheckProperty(FillingPattern_Val,"WPFControlText", cmpEqual, Input_Val);
  
}
//************ Edit Field Justification *********
function Edit_FieldJustification_CustomField(pos,stt){  
  initializated_EditToolField_arr();
  var CustomField = EditToolField_arr[pos];
 // var CustomField = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000);  
  if(CustomField.Exists == true){   
    //Log.Message("Field Justificationbox is changing to Right Aligned");
    var FieldJustification = CustomField.FindChild("Name","WPFObject(\"ParamControl\", \"\", 4)",200);
    var FieldJustificationbox = FieldJustification.FindChild("Name","WPFObject(\"ComboBox\", \"\", 1)",200);
    if(stt == "Right") FieldJustificationbox.ClickItem(1); // change to Right Aligned
    if(stt == "Left") FieldJustificationbox.ClickItem(0); // change to Right Aligned
    }
    else Log.Error("Can't find CustomField");
}



// *********************************************Global Statistics Field*****************************************************
function Edit_FillingMode_GlobalStatistic(pos){
  initializated_EditToolField_arr();
  var GlobalStatistic = EditToolField_arr[pos];
  //var GlobalStatistic = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 2)",2000); 
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
function Edit_FillingMode_CodeRelated(pos){ //stt
  initializated_EditToolField_arr();
  var CodeRelated = EditToolField_arr[pos];
  //var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000);
  if(CodeRelated.Exists == true){
    var FillingMode = CodeRelated.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",3);
    var FillingModebox_PropArr = ["Name", "ChildCount"];
    var FillingModebox_ValArr = ["WPFObject(\"ComboBox\", \"\", 1)" , "1" ];    
    var FillingModebox = FillingMode.FindChild(FillingModebox_PropArr,FillingModebox_ValArr,2000);
    FillingModebox.ClickItem(1); // change to Fixed length  
  }
  else
      Log.Error("Can't find Code_Related");
}

function Edit_FillingPattern_CodeRelated(pos,Str){  
  initializated_EditToolField_arr();
  var CodeRelated = EditToolField_arr[pos];
  //var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  
  if(CodeRelated.Exists == true){
    var FillingPattern = CodeRelated.FindChild("Name","WPFObject(\"StackPanel\", \"\", 1)",2);
    var FillingPatternbox_PropArr = ["WPFControlName", "Visible"];
    var FillingPatternbox_ValArr = ["rtbText" , true ];
    var FillingPatternbox = FillingPattern.FindChild(FillingPatternbox_PropArr, FillingPatternbox_ValArr, 2000);
    
    FillingPatternbox.DblClick();
    FillingPatternbox.Keys(Str);
//    if(stt == 0 ){                                //Cutting_Simple mode
//      Change_CuttingPattern(pos,stt);
//      Remove();     
//    }
//    if(stt == 1 ){                                //Cutting_Pattern mode
//      Change_CuttingPattern(pos,stt);
//          
//    }
    }
  else
    Log.Error("Can't find Code Related ");
}

function Remove_Lead_Trail(pos){
  initializated_EditToolField_arr();
  var CodeRelated = EditToolField_arr[pos];
  //var CodeRelated = Dataformat.WPFObject("ItemsControl", "", 1).FindChild("Name","WPFObject(\"ContentPresenter\", \"\", 1)",2000); 
  var CuttingPattern_Field = CodeRelated.WPFObject("ContentExpander", "", 1).WPFObject("test").WPFObject("ContentControl", "", 2);
  var Remove_Leading = CuttingPattern_Field.FindChild("Name","WPFObject(\ParamControl\", \"\", 1)",200); 
  var Leading_box = Remove_Leading.FindChild("WPFControlName","TextBox",200); 
  
  var Remove_Trailing = CuttingPattern_Field.FindChild("Name","WPFObject(\ParamControl\", \"\", 2)",200); 
  var Trailing_box = Remove_Trailing.FindChild("WPFControlName","TextBox",200); 

  
  Leading_box.DblClick();
  Leading_box.Keys(Leading_Str);
   ////Check input value
  var lenght = aqString.GetLength(Leading_Str);
  var Input_val = Leading_Str.slice(4,4+lenght);
  aqObject.CheckProperty(Leading_box,"Text", cmpEqual, Input_val);
  
  Trailing_box.DblClick();
  Trailing_box.Keys(Trailing_Str);
  ////Check input value
  lenght = aqString.GetLength(Trailing_Str);
  Input_val = Trailing_Str.slice(4,4+lenght);
  aqObject.CheckProperty(Trailing_box,"Text", cmpEqual, Input_val);
}

function Change_CuttingPattern(pos,numb){ //numb
  initializated_EditToolField_arr();
  var CodeRelated = EditToolField_arr[pos];
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
  var Separato_Exist = Check_Exist_Separator(Separato_Str);
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
  while(NumbToolEdit > 1)                                       // defaut exists 1child: AdornerLayer
  {
    initialization_FieldEditControl_Var(NumbToolEdit-1);
    for(var i =1; i <= NumbToolEdit-1; i++)                  // Remove tool edit default            
    {
      Edit[i].Click();
      Sys.Desktop.Keys( "[Del]");
    }
    Sys.Process("DL.CODE").Refresh();
    NumbToolEdit = aqObject.GetPropertyValue(FieldEditControl,"ChildCount");  // Check all Edit tool was removed
    //Log.Message("last default tool number: " + (NumbToolEdit-1));
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










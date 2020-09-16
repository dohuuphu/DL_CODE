﻿//USEUNIT lib_DataFormatting
//USEUNIT lib_CheckDefault

function Filling_TC1(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_GlobalStatisticsTool,Str_CustomFieldTool];
  // Message 1
  //Message_format(Str_CollectionMode);
   Check_Value_HeaderTerminator();
   Sellect_Mode(Mess1_tool);
  //DragEdit(2,1); // [act_place, new_place]
  
  clickEdittool(1);
  Edit_CustomString(Str_Code );
  Check_Default_FillingMode_Custom();
  Edit_FillingMode_CustomField();
  Check_Default_FillingMode_Custom_Expand();
  Edit_FillingPattern_CustomField();
  Edit_FieldJustification_CustomField()
  
 // clickEdittool(3);
 // Edit_CustomString(Str_Code );
 
  // Message 2
//  Click_Mess2();
//  Sellect_Mode((Mess2_tool))
//  clickEdittool(1);
//  Edit_CustomString(Str_Noread);
//  clickEdittool(2);  
//  Edit_FillingMode_GlobalStatistic();
//  clickEdittool(3);
//  Edit_CustomString(Str_End);

}

function Filling_TC2(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_CustomFieldTool,Str_CustomFieldTool];
  Check_Value_HeaderTerminator();
  // Message 1
  //Message_format(Str_CollectionMode);
  Check_Value_HeaderTerminator();
  Sellect_Mode(Mess1_tool);
  clickEdittool(1);
  Edit_CustomString(Str_Code );
//  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(Str_No);
  clickEdittool(2);  
  Edit_CustomString(Str_Space);
  clickEdittool(3);
  Edit_CustomString(Str_Read);
}

function Cutting_Simple_TC(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
  // Message 1
  Sellect_Mode((Mess1_tool));
  Edit_FillingMode_CodeRelated(Cutting_Simple);
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(Str_Noread);
}

function Cutting_Pattern_TC(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
  // Message 
  Check_Value_HeaderTerminator();
  Sellect_Mode((Mess1_tool));
  Edit_FillingMode_CodeRelated(Cutting_Simple);
  // Message 2
  Click_Mess2();
  Check_Value_HeaderTerminator();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(Str_Noread);
}

function test(){
  Edit_FillingMode_CodeRelated();
}
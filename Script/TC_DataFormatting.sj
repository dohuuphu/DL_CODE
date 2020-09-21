﻿//USEUNIT lib_DataFormatting
//USEUNIT lib_CheckDefault
//USEUNIT lib_Auto_Setup

function Filling_TC1(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_CustomFieldTool,Str_CustomFieldTool];
   clickDataFortmating_Collection();
  // Message 1
  //clickDataFortmating_Default();
  Check_Value_HeaderTerminator();
  Sellect_Mode(Mess1_tool);
  clickEdittool(1);
  Check_Default_CustomField(1);          // POSSITION :1
  Edit_CustomString(1,Str_Code);
  
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_No);
  clickEdittool(2);  
  Edit_CustomString(2,Str_Space);
  clickEdittool(3);
  Edit_CustomString(3,Str_Read);
}

function Filling_TC2(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_GlobalStatisticsTool,Str_CustomFieldTool];
  // Message 1
   clickDataFortmating_Collection();
   Check_Value_HeaderTerminator();
   Sellect_Mode(Mess1_tool);
  //DragEdit(2,1); // [act_place, new_place]
  
  clickEdittool(1);
  Check_Default_CustomField(1);          // POSSITION :1
  Edit_CustomString(1,Str_Code );
  Edit_FillingMode_CustomField(1);
  Check_Default_FillingMode_Custom_Expand(1);   // POSSITION :1
  Edit_FillingPattern_CustomField(1);
  Edit_FieldJustification_CustomField(1)
 
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);
  clickEdittool(2); 
  Check_Default_GlobalStatisticsField(2);                // POSSITION :2
  Edit_FillingMode_GlobalStatistic(2);
  Check_Default_FillingMode_GlobalStatistics_Expand(2);  // POSSITION :2
  Edit_FillingPattern_GlobalStatistic(2);
  clickEdittool(3);
  Edit_CustomString(3,Str_End);

  Click_Console();
  Click_PlayButton();
  Click_Mess1();
  Compare_Code();
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
  Check_Default_CustomField(1);
}
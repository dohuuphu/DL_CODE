//USEUNIT lib_DataFormatting

function Filling_TC1(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool,Str_CustomFieldTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_GlobalStatisticsTool,Str_CustomFieldTool];
  // Message 1
  //Message_format(Str_CollectionMode);
   CheckValue_HeaderTerminator();
  Sellect_Mode(Mess1_tool);
  //DragEdit(2,1); // [act_place, new_place]
  
  clickEdittool(1);
  Edit_CustomString(Str_Code );
  Edit_FillingMode_CustomField(Str_Right_Align);
  clickEdittool(3);
  Edit_CustomString(Str_Code );
 
  // Message 2
 Click_Mess2();
  Sellect_Mode((Mess2_tool))
  Message_format(Str_Failured);
  clickEdittool(1);
  Edit_CustomString(Str_Noread);
  clickEdittool(2);  
  Edit_FillingMode_GlobalStatistic();
  clickEdittool(3);
  Edit_CustomString(Str_End);

}

function Filling_TC2(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_CustomFieldTool,Str_CustomFieldTool];
  CheckValue_HeaderTerminator();
  // Message 1
  //Message_format(Str_CollectionMode);
  CheckValue_HeaderTerminator();
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
  // Message 1
  Sellect_Mode((Mess1_tool));
  Edit_FillingMode_CodeRelated(Cutting_Pattern);
  // Message 2
//  Click_Mess2();
//  Sellect_Mode(Mess2_tool);
//  clickEdittool(1);
//  Edit_CustomString(Str_Noread);
}
//USEUNIT lib_DataFormatting
//USEUNIT lib_CheckDefault
//USEUNIT lib_Auto_Setup


function FillingMode_TC(){
  Click_AdvancedSetup();
//  Filling_default_TC1();
//  FillingMode_TC2();
//  FillingMode_TC3();
//  FillingMode_TC4();
//  FillingMode_TC5();
//  FillingMode_TC6();
//  FillingMode_TC7();
//  FillingMode_TC8();
//  FillingMode_TC9();
//  FillingMode_TC10();
//  FillingMode_TC11();
//  FillingMode_TC12();
//  FillingMode_TC13();
//  FillingMode_TC14();
//  FillingMode_TC15();
//  FillingMode_TC16();
//  FillingMode_TC17();
  Cutting_Generic_TC1();
  Cutting_Generic_TC2();
  Cutting_Generic_TC3();
  Cutting_Generic_TC4();
  Cutting_Generic_TC5();
  Cutting_Generic_TC6();
  
  
}


//***************************** FILLING TEST_CASE 1 *****************************************

function Filling_default_TC1(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
  // clickDataFortmating_Collection();
  // Message 1
 // clickDataFortmating_Default();
  Check_Value_HeaderTerminator();
  Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  Check_Default_CodeRelated_Field(1,Str_CombinationMode);     //          Str_CollectionMode or Str_CombinationMode

  
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);

}

function FillingMode_TC2(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
 // Click_AdvancedSetup();
  Click_Mess1();
  Edit_FillingMode_CodeRelated(1);
  Check_Default_FillingMode_Custom_Expand(1);  
  Get_Length_CodeRelated(1);
}

function FillingMode_TC3(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
   Click_AdvancedSetup();
  Click_Mess1();
  Edit_FillingPattern_CodeRelated(1,FillingPattern_Str)
  Edit_Length_CodeRelated(1,Longer_length());               // longerlength_Str need to be declare
  Get_Length_CodeRelated(1);
  
}

function FillingMode_TC4(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  // Click_AdvancedSetup();
  Click_Mess1();
  Edit_Length_CodeRelated(1, Shorter_length());               // shorterlength_Str need to be declare 
  Get_Length_CodeRelated(1);
  
}
  
function FillingMode_TC5(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  // Click_AdvancedSetup();
  Click_Mess1();
  Edit_Length_CodeRelated(1,maxlength_Str);               // maxlength_Str need to be declare 10000
  Get_Length_CodeRelated(1);
  
}  

function FillingMode_TC6(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  // Click_AdvancedSetup();
  Click_Mess1();
  Edit_Length_CodeRelated(1,getRandom());               // 
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_RightAligned)  // Str_RightAligned, Str_LeftAligned
  
} 

function FillingMode_TC7(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  Click_AdvancedSetup();
  Click_Mess1();
  Sellect_Mode(Mess1_tool);
  Edit_FillingMode_CodeRelated(1);
  Edit_Length_CodeRelated(1,length_Str);               // Length random or 20
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_LeftAligned)  // Str_RightAligned, Str_LeftAligned
  Remove_Lead_Trail(1,Remove_Random(),Remove_Random());  // Leading, Trailing are alway smaller than Code_length/2
} 

function FillingMode_TC8(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  // Click_AdvancedSetup();
  Click_Mess1();
  Get_Length_CodeRelated(1);
  Remove_Lead_Trail(1,ReadCode_length(),ReadCode_length());      // Leading, Trailing are equal to Code_length
} 

function FillingMode_TC9(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
//  Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Length_default);               // lenght_default = 20
  Get_Length_CodeRelated(1);
  Change_CuttingPattern(1,Cutting_Pattern);     // Cutting_Simple; Cutting_Pattern; Cutting_Generic

}

function FillingMode_TC10(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Longer_length());               // longer length
  Get_Length_CodeRelated(1);
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC11(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Longer_length());               // longer length
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC12(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Longer_length());               // longer length
  Get_Length_CodeRelated(1);
  //Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned
  Change_CuttingPattern_Mode(1,Str_KeepAfter)                                  //Str_KeepBefore; Str_KeepAfter
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC13(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Longer_length());               // longer length
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_LeftAligned);                        //Str_RightAligned, Str_LeftAligned
  Change_CuttingPattern_Mode(1,Str_KeepAfter)                                  //Str_KeepBefore; Str_KeepAfter
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC14(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Shorter_length());               // longer length
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_LeftAligned);                        //Str_RightAligned, Str_LeftAligned
  Change_CuttingPattern_Mode(1,Str_KeepBefore)                                  //Str_KeepBefore; Str_KeepAfter
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC15(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Shorter_length());               // longer length
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned
  //Change_CuttingPattern_Mode(1,Str_KeepBefore)                                  //Str_KeepBefore; Str_KeepAfter
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC16(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Shorter_length());               // longer length
  Get_Length_CodeRelated(1);
  //Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned
  Change_CuttingPattern_Mode(1,Str_KeepAfter)                                  //Str_KeepBefore; Str_KeepAfter
  Edit_Pattern_String(1,PatternString());  

}

function FillingMode_TC17(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Sellect_Mode((Mess1_tool));
  Edit_Length_CodeRelated(1,Shorter_length());               // shorter length
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_LeftAligned);                        //Str_RightAligned, Str_LeftAligned
  //Change_CuttingPattern_Mode(1,Str_KeepAfter)                                  //Str_KeepBefore; Str_KeepAfter
  Edit_Pattern_String(1,PatternString());  

}

function Cutting_Generic_TC1(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
  // clickDataFortmating_Collection();
  // Message 1
 // clickDataFortmating_Default();
  Check_Value_HeaderTerminator();
  Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  Check_Default_CodeRelated_Field(1,Str_CombinationMode);     //          Str_CollectionMode or Str_CombinationMode
  Edit_FillingMode_CodeRelated(1);
  Check_Default_FillingMode_CodeRelated_Expand(1);
  Get_Length_CodeRelated(1);
  Edit_FillingPattern_CodeRelated(1,FillingPattern_Str);
  Change_CuttingPattern(1,Cutting_Generic);     // Cutting_Simple; Cutting_Pattern; Cutting_Generic

  
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);

}

function Cutting_Generic_TC2(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Check_Value_HeaderTerminator();
  //Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  //Edit_FillingMode_CodeRelated(1);
  //Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_Length_CodeRelated(1,Shorter_length());               // shorter length
  Get_Length_CodeRelated(1);
  Edit_Cutting_Mode(1,Str_CuttingMode_NotCut); 
  Edit_CustomString_CodeRelated(1,CustomString_Str);            // Str_CuttingMode_Cut, Str_CuttingMode_NotCut

}

function Cutting_Generic_TC3(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Check_Value_HeaderTerminator();
  //Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  //Check_Default_CodeRelated_Field(1,Str_CombinationMode);     // Str_CollectionMode or Str_CombinationMode
  //Edit_FillingMode_CodeRelated(1);
  //Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_Length_CodeRelated(1,Shorter_length());               // shorter length
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned
  Edit_Cutting_Mode(1,Str_CuttingMode_NotCut); 
  Edit_CustomString_CodeRelated(1,CustomString_Str);            // Str_CuttingMode_Cut, Str_CuttingMode_NotCut

}

function Cutting_Generic_TC4(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  Check_Value_HeaderTerminator();
  Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  Check_Default_CodeRelated_Field(1,Str_CombinationMode);     //          Str_CollectionMode or Str_CombinationMode
  Edit_FillingMode_CodeRelated(1);
  Check_Default_FillingMode_CodeRelated_Expand(1);
  Get_Length_CodeRelated(1);
  Edit_FillingPattern_CodeRelated(1,FillingPattern_Str);
  Change_CuttingPattern(1,Cutting_Generic);     // Cutting_Simple; Cutting_Pattern; Cutting_Generic
  Edit_Cutting_Mode(1,Str_CuttingMode_Cut);                       // Str_CuttingMode_Cut, Str_CuttingMode_NotCut

  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);
}

function Cutting_Generic_TC5(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Check_Value_HeaderTerminator();
  //Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  //Check_Default_CodeRelated_Field(1,Str_CombinationMode);     //  Str_CollectionMode or Str_CombinationMode
  //Edit_FillingMode_CodeRelated(1);
  //Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_Length_CodeRelated(1,Shorter_length());               //  length deflault
  Get_Length_CodeRelated(1);
  //Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned


}

function Cutting_Generic_TC6(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];

  // Message 1
  //Click_AdvancedSetup();
  Click_Mess1();
  //Check_Value_HeaderTerminator();
  //Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
//  Edit_FillingMode_CodeRelated(1);
//  Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_Length_CodeRelated(1,Shorter_length());               //  length deflault
  Get_Length_CodeRelated(1);
  Edit_Justification_CodeRelated(1,Str_RightAligned);                        //Str_RightAligned, Str_LeftAligned

}

//***************************** Demo *****************************************
function Filling_TC1(){
  var Mess1_tool=[Str_CustomFieldTool,Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool,Str_CustomFieldTool,Str_CustomFieldTool];

  // Message 1
  Click_Mess1()
  Sellect_Mode(Mess1_tool);
  
  clickEdittool(1);
  Check_Default_CustomField(1);          // POSSITION :1
  Edit_CustomString(1,Str_Code);
  clickEdittool(2);
  Check_Default_CodeRelated_Field(2,Str_CombinationMode);    //          Str_CollectionMode or Str_CombinationMode

  
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
   Check_Default_Separator();
   Check_Value_HeaderTerminator();
   Sellect_Mode(Mess1_tool);
  //DragEdit(2,1); // [act_place, new_place]
  
  clickEdittool(1);
  Check_Default_CustomField(1);          // POSSITION :1
  Edit_CustomString(1,Str_Code );
  Edit_FillingMode_CustomField(1);
  Check_Default_FillingMode_Custom_Expand(1);   // POSSITION :1
  Edit_FillingPattern_CustomField(1,FillingPattern_Str);
  Edit_FieldJustification_CustomField(1,Str_RightAligned);
 
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);
  Edit_FillingMode_CustomField(1);
  Edit_FillingPattern_CustomField(1,FillingPattern_Str);
  clickEdittool(2); 
  Check_Default_GlobalStatisticsField(2);                // POSSITION :2
  Edit_FillingMode_GlobalStatistic(2);
  Check_Default_FillingMode_GlobalStatistics_Expand(2);  // POSSITION :2
  Edit_FillingPattern_GlobalStatistic(2,FillingPattern_Str);
  clickEdittool(3);
  Edit_CustomString(3,Str_End);

  Click_Console();
  Click_Play_Pause();
  Click_Mess1();
  Compare_Code();                                          // Check Right Aligned
  
  Edit_FieldJustification_CustomField(1,Str_LeftAligned);
  Click_Play_Pause();
  Compare_Code();                                          // Check Left Aligned
}



//***************************** CUTTING SIMPLE TEST_CASE *****************************************
function Cutting_Simple_TC(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
  //clickDataFortmating_Collection();
 // clickDataFortmating_Default();
  Click_AdvancedSetup();
  // Message 1
  Sellect_Mode((Mess1_tool));
//  clickEdittool(1);
//  Check_Default_CustomField(1); 
//  Edit_FillingMode_CustomField(1);
//  Check_Default_FillingMode_Custom_Expand(1);
//  Edit_FillingPattern_CustomField(1,FillingPattern_dot_Str);
  
  clickEdittool(1);
  Check_Default_CodeRelated_Field(1,Str_CollectionMode)     //          Str_CollectionMode or Str_CombinationMode
  Edit_FillingMode_CodeRelated(1);
  Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_FillingPattern_CodeRelated(1,FillingPattern_Str);
  Remove_Lead_Trail(1,Leading_Str,Trailing_Str);            // Leading_Str, Trailing_Str
  
  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);
  
  //compare
  Click_Console();
  Click_Play_Pause();
  Get_Console_Result();
  Compare_Cutting_SimpleType();
  
  
}


//***************************** CUTTING PATTERN TEST_CASE *****************************************
function Cutting_Pattern_TC(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
 
  // Message 1
  Click_AdvancedSetup();
  Sellect_Mode((Mess1_tool));
  
  clickEdittool(1);
  Check_Default_CustomField(1); 
  Edit_FillingMode_CustomField(1);
  Check_Default_FillingMode_Custom_Expand(1);
  Edit_FillingPattern_CustomField(1,FillingPattern_dot_Str);
  
  clickEdittool(1);
  Check_Default_CodeRelated_Field(1,Str_CollectionMode)     //          Str_CollectionMode or Str_CombinationMode
  Edit_FillingMode_CodeRelated(1);
  Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_FillingPattern_CodeRelated(1,FillingPattern_Str);
  Change_CuttingPattern(1,Cutting_Pattern); 
  Check_Default_CuttingPatternType_CodeRelated_Expand(1);            // Cutting_Simple = 0; Cutting_Pattern = 1; Cutting_Generic = 2
  Change_CuttingPattern_Mode(1,Str_KeepBefore)                                  //Str_KeepBefore; Str_KeepAfter; Str_KeepMiddle 
  Edit_Pattern_String(1,PatternString_Str);                               
                                                           

  // Message 2
  Click_Mess2();
  Sellect_Mode(Mess2_tool);
  clickEdittool(1);
  Edit_CustomString(1,Str_Noread);
  
  Click_Console();
  Click_Play_Pause();
  
  Get_Console_Result();
  Compare_Cutting_PatternType(Str_KeepAfter,Str_RightAligned);  //Str_KeepAfter, Str_KeepBefore, Str_LeftAligned, Str_RightAligned
  
  //// 
//  Click_Mess1();
//  clickEdittool(1);
//  Edit_FieldJustification_GlobalStatistic(1);           // right align
//  Change_CuttingPattern_Mode(1,Str_KeepAfter)
//  Click_Console();
//  Click_Play_Pause();
//  Get_Console_Result();
//  Compare_Cutting_PatternType(Str_KeepAfter,Str_RightAligned);  //Str_KeepAfter, Str_KeepBefore, Str_LeftAligned, Str_RightAligned
//  
  
}

//***************************** CUTTING GENERIC TEST_CASE *****************************************
function Cutting_Generic_TC(){
  var Mess1_tool=[Str_CodeRelatedTool];
  var Mess2_tool=[Str_CustomFieldTool];
  
  // Message 1
  Click_AdvancedSetup();
  Sellect_Mode((Mess1_tool));
 
//  clickEdittool(1);
//  Check_Default_CustomField(1); 
//  Edit_FillingMode_CustomField(1);
//  Check_Default_FillingMode_Custom_Expand(1);
//  Edit_FillingPattern_CustomField(1,FillingPattern_dot_Str);
  
  clickEdittool(1);
  Check_Default_CodeRelated_Field(1,Str_CollectionMode)     //          Str_CollectionMode or Str_CombinationMode
  Edit_FillingMode_CodeRelated(1);
  Check_Default_FillingMode_CodeRelated_Expand(1);
  Edit_Length_CodeRelated(1,length_Str);
  Edit_FillingPattern_CodeRelated(1,FillingPattern_Str);
  Change_CuttingPattern(1,Cutting_Generic);                                    // Cutting_Simple; Cutting_Pattern ; Cutting_Generic 
  Check_Default_CuttingPatternType_CodeRelated_Expand(1,Cutting_Generic);        // Cutting_Simple; Cutting_Pattern; Cutting_Generic 
  Edit_Cutting_Mode(1,Str_CuttingMode_NotCut); 
  Edit_CustomString_CodeRelated(1,CustomString_Str);                                        // Str_CuttingMode_Cut; Str_CuttingMode_NotCut
  
                             
                                                           

//  // Message 2
//  Click_Mess2();
////  Check_Value_HeaderTerminator();
//  Sellect_Mode(Mess2_tool);
//  clickEdittool(1);
//  Edit_CustomString(1,Str_Noread);
  
  
  Click_Console();
  Click_Play_Pause();
  Get_Console_Result();
  Compare_NotCutting_GenericType(Str_LeftAligned);
  
  Edit_Cutting_Mode(1,Str_CuttingMode_Cut); 
  Click_Console();
  Click_Play_Pause();
  Get_Console_Result();
  Compare_Cutting_GenericType();
}



function test(){
  Click_AdvancedSetup();
  getRandom();
}
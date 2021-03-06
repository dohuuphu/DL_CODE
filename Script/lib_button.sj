﻿//USEUNIT lib_common
//USEUNIT lib_deviceInfo
//USEUNIT lib_messageLog
//USEUNIT lib_validate

//add from 1.6.0 
/**
 * @function to add Filter
 * @param {Interger} index - position to add Filter
*/
function test ()
{
     var dataGrid = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("StatisticResult", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Expander", "Code Settings", 2).WPFObject("Border", "", 1).WPFObject("DataGrid", "", 1);     
     while(!dataGrid.Visible)  
     {
      clickCapture();
      dataGrid = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("StatisticResult", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Expander", "Code Settings", 2).WPFObject("Border", "", 1).WPFObject("DataGrid", "", 1);
      Delay(1000);
     }
     Log.Message(dataGrid);
}

function clickAddFilter (index)
{
             lib_button.clickAdvancedSetup();
             var treeViewItemCodes = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1);
                                     
             
             var childCount = treeViewItemCodes.WPFObject("TreeViewItem", "", index ).ChildCount;
             // focus the code
             treeViewItemCodes.WPFObject("TreeViewItem", "", index ).Click();
             //click add Filter
             Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("AddFilterActionButton", "", 1).Click();
             treeViewItemCodes.Refresh ();
             //automatically focus to Filter 
             if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Filter Setup", 1).IsExpanded == false)
             {    
                  //expand Filter area
                  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Filter Setup", 1).set_IsExpanded(true);
                  //verify value default: Erode
                  lib_validate.verifyCodeType (cbb, "Erode");
             }      
             
               
             var arrFilterType = ["Erode" , "Dilate" , "Open" , "Close" , 
                                   "Contrast Stretching" , "Contrast Stretching" , "Smoothing" , "Sharpening" ,
                                   "Deblurring" , "Black Enhancement" ,"White Enhancement"] ;
             
             //var arrFilterType = ["Erode"];
                                   
                                                                                                     
             var arrFilterItensity = [true, true, true, true, false, false, false, false, false, false, false  ];  
             var arrDataCode = new Array();
             //oepn Result tab to get data code
             lib_button.clickOpenResultTab();
             var pathCode = treeViewItemCodes.WPFObject("TreeViewItem", "", index ).Click();
             for (var i = 0 ; i < arrFilterType.length ; i ++)
             {
                     //select filter type
                     var cbb = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Filter Setup", 1).WPFObject("StackPanel", "", 1).WPFObject("GenericPropertiesViewControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ParamControl", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1);
                     lib_common.cbb_NonLogicalAdornerDecorator(cbb,arrFilterType[i]);    
                     lib_validate.verifyCodeType (cbb, arrFilterType[i]); 
                     //verify Itensity
                     if (arrFilterItensity [i] == true)
                     {
                           aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Filter Setup", 1).WPFObject("StackPanel", "", 1).WPFObject("GenericPropertiesViewControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ParamControl", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1),"Enabled", cmpEqual, true);
                     
                     } 
                     // get code content in Code Settings 
                     // LHOANG: beginnnnn
                     //LHOANG comment: var dataGrid = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("StatisticResult", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Expander", "Code Settings", 2).WPFObject("DataGrid", "", 1);
                     
                     // focus on DMECC200
                     Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("TreeViewItem", "", 2).WPFObject("TreeViewItem", "", 1).Click();
                     var dataGrid = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("StatisticResult", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Expander", "Code Settings", 2).WPFObject("Border", "", 1).WPFObject("DataGrid", "", 1);
                     // while not decoded 
                     var count = 1;    
                     while(!dataGrid.Visible && count >0)  
                    {
                      clickCapture();
                      dataGrid = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("StatisticResult", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Expander", "Code Settings", 2).WPFObject("Border", "", 1).WPFObject("DataGrid", "", 1);
                      count--;
                    }
                     //LHOANG:  end
                     dataGrid.Refresh ();
                     if (dataGrid.ChildCount > 7)
                     {
                             var row = dataGrid.WPFObject("DataGridRow", "", 1);
                             var code = row.WPFObject("DataGridCell", "*", 2).WPFObject("TextBlock", "*", 1).WPFControlText; 
                             var numChar = row.WPFObject("DataGridCell", "*", 4).WPFObject("TextBlock", "*", 1).WPFControlText;
                             var data = "";
                             for (var l = 1; l <= numChar ; l ++)
                             {
                                    data = data + row.WPFObject("DataGridCell", "*", 3).WPFObject("ContentPresenter", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", l).WPFObject("TextBlock", "*", 1).WPFControlText;
                             } 
                             arrDataCode[i] = data;
                             ui_PlayAndPause(3000, false);
                     }
                     // lhoang add this to return filter
                     Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("TreeViewItem", "", 2).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("Image", "", 1).Click();
                                  
             }
             for (var i = 0 ; i < arrFilterType.length ; i ++)
             {
                    Log.Message(arrFilterType [i] + ":" + arrDataCode[i]);        
             }
             var newChildCount = treeViewItemCodes.WPFObject("TreeViewItem", "", index ).ChildCount;
             if (newChildCount - childCount == 1)
                  return true;
             else 
                  return false;      
}

/** 
 * @function click button Acquire PPP (for only special device)
*/
function clickAcquirePPIBtt()
{

          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    //perform and apply Image AutoSetup before Acquire PPI
                    clickIMG_AutoSetup_Static(true);
                    
                    //focus on Advanced setup 
                    clickAdvancedSetup();
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();
                    if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").IsExpanded == false)
                              Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").set_IsExpanded(true); 
                    
                    //get PPI before
                    var PPI_before = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").WPFObject("StackPanel", "", 1).WPFObject("PPIControl").WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox").Text;
                    
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").WPFObject("StackPanel", "", 1).WPFObject("AcquirePPICommandButton").ClickButton();
                    while(Sys.Process("DL.CODE").WaitWPFObject("HwndSource: Window", 1000).Exists == false)
                         Delay(lib_const.const_delay_3000);
                    if(Sys.Process("DL.CODE").WaitWPFObject("HwndSource: Window", 1000).Exists == true)     
                    {
                         var msg = Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("MessageText").WPFControlText    ;
                         if (msg == lib_label.lb_AcquirePPI_failure)
                         {  
                            Log.Warning("Testchart");
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("ButtonPanel").WPFObject("btnOK").ClickButton();
                         }
                         if (msg == lib_label.lb_AcquirePPI_success)
                         {
                           Log.Message("OK");
                           Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("ButtonPanel").WPFObject("btnOK").ClickButton();
                         }
                    }
                    
                    //get PPI after and comparision
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();
                    
                    if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").IsExpanded == false)
                              Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").set_IsExpanded(true); 
                    
                    //get PPI before
                    var PPI_after = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("PPIExpander").WPFObject("StackPanel", "", 1).WPFObject("PPIControl").WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox").Text;
                    
                    if (PPI_before != PPI_after)
                          flag = true;                   
                    
                     
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
}

//new 1.5.0
/**
 * @function
 * @param {Interger} time - how many times to play and pause
 * @param {boolean} isMonitor -  true: is Monitor screen
*/
function ui_PlayAndPause( time, isMonitor)
{
         clickPlay(isMonitor);
         delay (time);
         clickPause (isMonitor);
} 


/**
 * @function to Open Events Tab (config mode)
*/ 
function clickOpenEventsTab()
{
      try
      {
          var flag = false;
          if (lib_validate["isDLCODERunning"]())
          {        
                   
                  if(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem1").Visible == true)
                  {    
                        Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem1").WPFObject("TextBlock", "Events", 1).Click();
                        return true;                         
                  }  
                    
                  if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Console, index).Visible == false &&
                      Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem1").WPFObject("TextBlock", "Events", 1).Visible == false)
                  {
                          Log.Warning(lib_label.lb_Events +lib_messageLog.msg_TAB_NOT_EXISTS);
                          return false;
                  }
                  return flag;
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
              return lib_err.err_FUNC_EXCEPTION;
      } 
}
//new 1.5.0
/**
 * @function to open Console tab
*/
function clickOpenConsoleTab()
{
      try
      {
          var flag = false;
          if (lib_validate["isDLCODERunning"]())
          {       
          
                  var index ;
                  index = lib_const.const_ConsoleTab  ;
                  if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Console, index).Visible )
                  {
                        var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Console, index);
                        if (btt.IsVisible == true) 
                        {
                            btt.ClickButton();
                            return true;
                        }
                  }
                  if(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem4").Visible == true)
                  {    
                        Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem4").WPFObject("TextBlock", "Console", 1).Click();
                        return true;                         
                  }  
                    
                  if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Console, index).Visible == false &&
                      Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem4").WPFObject("TextBlock", "Console", 1).Visible == false)
                  {
                          Log.Warning(lib_label.lb_Result +lib_messageLog.msg_TAB_NOT_EXISTS);
                          return false;
                  }
                  return flag;
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
              return lib_err.err_FUNC_EXCEPTION;
      } 
}
 
//new 1.5.0
/**
 * @function open DPM Image Database tab (this feature removed from 1.6.0)
*/
function clickOpenDPM_IMG_DB()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {       
                  if (!Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2_1").Visible )
                  {    
                       Log.Warning(lib_messageLog.msg_DPM_IMG_DB_NOT_EXISTS);
                       return;
                  } 
                  if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Grid", "", 1).WaitWPFObject("Button", "DPM Images Database", lib_const.const_delay_1000).Exists)
                  {
                        var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Grid", "", 1).WaitWPFObject("Button", "DPM Images Database", 1);
                        if (btt.IsVisible == true) 
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Button", "DPM Images Database", 1).ClickButton();
                        if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2_1").WaitWPFObject("TextBlock", "DPM Images Database", lib_const.const_delay_1000).Exists)
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2_1").WPFObject("TextBlock", "DPM Images Database", 1).Click();                            
                  }   
                  
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);
      }      
      catch (e)
      {
              return lib_err.err_FUNC_EXCEPTION;
      } 
}
 
//new 1.5.0
/**
 @function open Result Tab
*/
function clickOpenResultTab()
{
      try
      {
          var flag = false;
          if (lib_validate["isDLCODERunning"]())
          {       
          
                  var index ;
                  index = lib_const.const_ResultTab;
                  if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Result, index).Visible )
                  {
                        var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Result, index);
                        if (btt.IsVisible == true) 
                        {
                            btt.ClickButton();
                            return true;
                        }
                  }
                  if(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2").Visible == true)
                  {    
                        Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2").Click();
                        return true;                         
                  }  
                    
                  if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("StrechTabPanel", "", 1).WPFObject("Button", lib_label.lb_Result, index).Visible == false &&
                      Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("BottomTabItem2").Visible == false)
                  {
                          Log.Warning(lib_label.lb_Result +lib_messageLog.msg_TAB_NOT_EXISTS);
                          return false;
                  }
                  return flag;
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
              return lib_err.err_FUNC_EXCEPTION;
      } 
}
//updated 1.5.0
/**
 * @function add more Expected Code on Good Read Setup
*/
function clickAddCodetoExpectedCode ()//just at Good Read Setup
{
      try
      {
          var flag = false;
          if (lib_validate["isDLCODERunning"]())
          {       
                  clickGoodReadSetup();   
                  var path = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("ResultAnalysisControl").WPFObject("ListBoxItem", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ResultParcelList", "", 1).WPFObject("Grid", "", 1).WPFObject("outerBorder").WPFObject("listBox").WPFObject("ScrollViewer", "", 1).WPFObject("Border", "", 1).WPFObject("ItemsPresenter", "", 1);
                  var count = path.ChildCount;
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar").WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("Button", "", 3);
                  if (btt.Enabled == true && btt.Visible == true)
                  {
                        btt.Click();                        
                        Sys.Process("DL.CODE").Refresh();
                        var newCount = path.ChildCount;
                        if ( newCount -count ==1 )
                            flag = true;
                  }
                  else  Log.Warning("bt Enable:" + btt.Enabled);
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

          return flag;         
      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}

 
//updated 1.5.0
/**
 * @function click on Delete button on Advanced Setup/Reading Phase/Data Formatting/ Output Setup
 * @param {String} strPlace - what button user want to click - strPlace is reference from lib_const
*/ 
function clickDeleteItem (strPlace)
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                var path ;  
                var nameBtt;
                if (strPlace == lib_const.const_AdvancedSetup)
                {
                        path = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject(lib_const.const_AdvancedSetup, "", 1);
                        nameBtt = "DeleteToolActionButton";
                       
                }
                if (strPlace == lib_const.const_ReadingPhase_Channel)
                {
                        path = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject(lib_const.const_ReadingPhase_Channel, "", 1);
                        nameBtt = "DeleteChannelInputActionButton";
                       
                }
                if (strPlace == lib_const.const_DataFormatting_Channel)
                {
                        path = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject(lib_const.const_DataFormatting_Channel, "", 1);
                        nameBtt = "DeleteMessageActionButton";
                }
                if (strPlace == lib_const.const_OutputSetup_Channel)
                {
                        path = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject(lib_const.const_OutputSetup_Channel, "", 1);
                        nameBtt = "DeleteChannelInputActionButton";
                } 
                
                while(!path.WaitWPFObject(nameBtt, "", lib_const.const_delay_1000).Exists)
                {
                       Log.Message("no exist");
                       var gridSplitterLeft = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("GridSplitter", "", 2);
                       var screenLeft = gridSplitterLeft.ScreenLeft;
                       gridSplitterLeft.Drag(0, 339, 52, 13);                       
                } 
                
                var btt_Delete = path.WPFObject(nameBtt, "", 1).WPFObject("Image", "", 1);
                if (btt_Delete.Enabled == true && btt_Delete.Visible == true)  
                {
                            btt_Delete.Click();
                            if (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: Window",lib_const.const_delay_1000).Exists)
                            {
                                aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("MessageText"), "WPFControlText",  cmpEqual, "Are you sure you want to delete current item? All events related to this item will be deleted.");
                                Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("ButtonPanel").WPFObject("btnYes").ClickButton();
                                flag = true;
                                return flag;
                            }
                
                }
            } else
                   Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    
}
//new 1.5.0
/**
 * @function
 * Monitor mode - Statistics panel
*/
function clickDisplay_Chart_TableView()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {       
                  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("TabItem", "Statistics", 2).WPFObject("TextBlock", "Statistics", 1).Click();   
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ImageCheckBox", "", 1);
                  if (btt.Enabled == true)
                        btt.Click();
                  else  Log.Warning("bt Enable:" + btt.Enabled);
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}

//new 1.5.0
/**
 * @function
 * Monitor mode - Statistics panel
*/
function clickResetStatistics()
{
       
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {        
                  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("TabItem", "Statistics", 2).WPFObject("TextBlock", "Statistics", 1).Click();
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 2);
                  if (btt.Enabled == true)
                  {
                        btt.ClickButton();
                        aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("MessageText"),"Text", cmpEqual,"By pressing OK Statistics will be reset. Continue?"); 
                        Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("ButtonPanel").WPFObject("btnOK").ClickButton();
                  }
                  else  Log.Warning("bt Enable:" + btt.Enabled);
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }  
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}

/**
 * @function
 * Monitor mode - Diagnostics panel
*/
function clickResetDiagnostics()
{
       
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {        
                  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("TabItem", "Diagnostic Alarms", 3).WPFObject("TextBlock", "Diagnostic Alarms", 1).Click();
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 2);
                  if (btt.Enabled == true)
                  {
                        btt.ClickButton();
                        aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("MessageText"),"Text", cmpEqual,"By pressing OK Diagnostics will be reset. Continue?"); 
                        Sys.Process("DL.CODE").WPFObject("HwndSource: Window").WPFObject("Window").WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("ButtonPanel").WPFObject("btnOK").ClickButton();
                  }
                  else  Log.Warning("bt Enable:" + btt.Enabled);
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }  
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}
 
//new 1.5.0
/**
 * @function
 * Monitor mode - Statistics panel
*/
function clickRefresh_Diagnostics_Statistics()
{
       
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {        
                  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("TabItem", "Statistics", 2).WPFObject("TextBlock", "Statistics", 1).Click();
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 1);
                  if (btt.Enabled == true)
                  {
                        btt.ClickButton();
                       
                  }
                  else  Log.Warning("bt Enable:" + btt.Enabled);
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }  
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

} 
//lhoang add new function
function clickRefresh_Diagnostics_Statistics_2()
{
      clickPause(true);
      delay(1000);
      var arrPro = ["ClrClassName", "WPFControlText"];
      var arrVal = ["TextBlock", "Diagnostic Alarms"];
      Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000).Click();
      delay(2000);
      aqObject.CheckProperty(Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Refresh Statistics/Diagnostics", 1000), "Enabled", cmpEqual, true);
      aqObject.CheckProperty(Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Reset Diagnostics", 1000), "Enabled", cmpEqual, true);
} 

//new 1.6.0
/**
 * @function Monitor mode - Statistics/ Diagnostics panel
 * @param {boolean} isStatistics true/flase (Statistics/Diagnostics panel) 
*/
function clickRefreshDiagnosticsStatistics(isStatistics)
{
       
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {        
                  if (isStatistics == true)
                       Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("TabItem", "Statistics", 2).WPFObject("TextBlock", "Statistics", 1).Click();
                  else 
                       Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("TabItem", "Diagnostic Alarms", 3).WPFObject("TextBlock", "Diagnostic Alarms", 1).Click();
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 1);
                  if (btt.Enabled == true)
                  {
                        btt.ClickButton();                       
                  }
                  else  Log.Warning("bt Enable:" + btt.Enabled);
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }  
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}
 
/**
 * @function 
 * @param {Interger} index of code user want to delete 
*/
function clickDeleteCode (index)
{ 
             lib_button.clickAdvancedSetup();
             var treeViewItemCodes = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1);
             var childCount = treeViewItemCodes.ChildCount;
             treeViewItemCodes.WPFObject("TreeViewItem", "", index).Click();
             clickDeleteItem(lib_const.const_AdvancedSetup);
             treeViewItemCodes.Refresh ();                
             var newChildCount = treeViewItemCodes.ChildCount;
             if (childCount-newChildCount == 1)
                  return true;
             else return false;     
}

/**
 * @function 
 * @param {String}  type 1d/2D/Postal
 * @param {String}  code
*/ 
function clickAddCode (type ,code)
{
            clickAdvancedSetup();            
            var add1DecoderTool;
            var add2DecoderTool;
            var addPostalTool;
            
            add2DecoderTool = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("Add2DecoderTool", "", 1);
            add1DecoderTool = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("Add1DecoderTool", "", 1);
            addPostalTool = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("AddPostalToolDecoder", "", 1);
                  
            if (type == lib_label.lb_CodeType1D)
            {
                  
                  if (add1DecoderTool.Enabled == false)
                  { 
                          Log.Warning("bt Enable:" + false);
                          return;
                  }                                    
                  add1DecoderTool.Click();
                  add1DecoderTool.PopupMenu.Click(code);
            }
            if (type == lib_label.lb_CodeType2D)
            {
                  if (add2DecoderTool.Enabled == false)
                  { 
                          Log.Warning("bt Enable:" + false);
                          return;
                  }
                  add2DecoderTool.Click();
                  add2DecoderTool.PopupMenu.Click(code);
            }
            if (type == lib_label.lb_CodeTypePostal)
            {
                  
                  if (addPostalTool.Enabled == false)
                  { 
                          Log.Warning("bt Enable:" + false);
                          return;
                  }
                  addPostalTool.Click();
                  addPostalTool.PopupMenu.Click(code);
            }
            //verify Replace   
            
             var treeViewItemCodes = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1);
             treeViewItemCodes.Refresh ();                
             var index = treeViewItemCodes.ChildCount -1  ;   
               
             if (treeViewItemCodes.ChildCount == 12)
             {
                      Log.Message("US_14");          
                      aqObject.CheckProperty(add1DecoderTool, "Enabled", cmpEqual, false);
                      aqObject.CheckProperty(add2DecoderTool, "Enabled", cmpEqual, false);
                      aqObject.CheckProperty(addPostalTool, "Enabled", cmpEqual, false);
             }             
              //Postal
              if ( type == "Postal"   )
              {                  
                  treeViewItemCodes.WPFObject("TreeViewItem", "", index ).Click();
                  Sys.Process("DL.CODE").Refresh();
                  aqObject.CheckProperty(treeViewItemCodes.WPFObject("TreeViewItem", "", index).WPFObject("StackPanel", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "*", 1), "WPFControlText", cmpEqual, code);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TextBlock", "*", 1), "WPFControlText", cmpContains, code);                        
                      
              }else//1D and 2D
              {   
                   treeViewItemCodes.WPFObject("TreeViewItem", "", index).Click();
                   delay (lib_const.const_delay_2000);
                   Sys.Process("DL.CODE").Refresh();
                   aqObject.CheckProperty(treeViewItemCodes.WPFObject("TreeViewItem", "", index).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "*", 1), "WPFControlText", cmpEqual, code);
                       
              }
              //verify code type
               var cbb =Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Code Symbology Setup", 1).WPFObject("StackPanel", "", 1).WPFObject("GenericPropertiesViewControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ParamControl", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1);
               lib_validate.verifyCodeType (cbb, code);
               //end verify code type
               aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TextBlock", "*", 1), "WPFControlText", cmpContains, code);
               
              
                   
                    
}
/**
 * @function  click on <Image Settings> tab in Configuration
*/ 
function clickIMGSetting()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {        
                  // Focus on Code Setup
                  lib_button.clickAdvancedSetup();  
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "*", 1), "WPFControlText", cmpEqual, "Image Settings ");
                  btt.Click();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
             return lib_err.err_FUNC_EXCEPTION;
      }    

}
/**
 * @function  click on only 4 buttons in Configuration and Monitor
 * Configuration Cropping/Grid buttons
 * Monitor ImageResolution/Grid buttons
 
 * @param {Interger} button index of button 
 * @param {boolean} isMonitor true/false
*/
function clickToolbarButton (button, isMonitor)
{

        var flag = false;
            //Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar").WPFObject("Grid", "", 1).WPFObject("Border", "", 1)
        if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WaitWPFObject("controlToolBar", lib_const.const_delay_1000).Exists)
        {
              //linhtnguyen comment
              // var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1);
                
                var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");                                                                      
                var btt;
                if (isMonitor == false)
                {
                            if (button != lib_const.const_bbt_CroppingRegion && button != lib_const.const_bbt_Grid)
                            {
                                    //linhtnguyen comment
                                    //btt = controlToolbar.WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", button).WPFObject("Button", "", 1);
                                    
                                    btt = controlToolbar.WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", button).WPFObject("Button", "", 1);
                                    if (btt.Enabled == true)
                                    {
                                          btt.ClickButton();
                                          Delay(2000);
                                    } else    Log.Warning("btt Enabled:" + btt.Enabled)       ;
                            }
                            if ( button == lib_const.const_bbt_Grid) 
                            {
                                    //linhtnguyen comment
                                    //btt = controlToolbar.WPFObject("ToolBar", "", 1).WPFObject("Border", "", 2).WPFObject("ImageCheckBox", "", 1) ;
                                    
                                    btt = controlToolbar.WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("Border", "", 2).WPFObject("ImageCheckBox", "", 1)
                                    if (btt.Enabled == true)
                                    {
                                          btt.Click();
                                          Delay(2000);
                                    } else     Log.Warning("btt Enabled:" + btt.Enabled)       ;
                
                            }
                            if ( button == lib_const.const_bbt_CroppingRegion) 
                            {
                                    //linhtnguyen comment
                                    //btt = controlToolbar.WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", button).WPFObject("ImageCheckBox", "", 1);
                                    
                                    btt = controlToolbar.WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 8).WPFObject("Border", "", 1).WPFObject("ImageCheckBox", "", 1);
                                    if (btt.Enabled == true)
                                    {
                                          btt.Click();
                                          Delay(2000);
                                    } else     Log.Warning("btt Enabled:" + btt.Enabled)       ;
                
                            } 
                }
                
        }
        else
        {
                if (isMonitor == true)
                {
                            var pathMonitor = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1);
                            if (button != lib_const.const_bbt_ImageResolution && button != lib_const.const_bbt_Grid)
                            {
                                    btt = pathMonitor.WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", button -2);
                                    if (btt.Enabled == true)
                                    {
                                          btt.ClickButton();
                                    } else    Log.Warning("btt Enabled:" + btt.Enabled)       ;
                            }
                            if (button ==lib_const.const_bbt_ImageResolution)
                            {
                                    btt = pathMonitor.WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ImageScalingButton", "", 1);
                                    if (btt.Enabled == true)
                                    {
                                          btt.Click();
                                    } else    Log.Warning("btt Enabled:" + btt.Enabled)       ;
                            }
                            if (button ==lib_const.const_bbt_Grid)
                            {       btt = pathMonitor.WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ImageCheckBox", "", 1)
                                    if (btt.Enabled == true)
                                    {
                                          btt.Click();
                                    } else    Log.Warning("btt Enabled:" + btt.Enabled)       ;
                            }
                }
        
        
        }
        
}

//edit 1.5.0 a7
/**
 * @function enable Cropping Region on Advanced Setup/ Automatic Setup
 * @param {boolean} isAdvanceSetup -  true/false (Advanced Setup/ Automatic Setup)
*/
function clickEnableCroppingRegion (isAdvanceSetup)
{

          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    //focus on Advanced setup or Quick Setup
                    if (isAdvanceSetup == true)
                          clickAdvancedSetup();
                    else
                          clickQuickSetup(); 
                    //Click btt Add CR
                    var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar").WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 8).WPFObject("CroppingRegionBorder").WPFObject("CroppingRegionImageCheckBox");
                    if( btt.CurrentToolTip == "JobConfiguration.ControlToolBar.CropImage")
                           clickToolbarButton ( lib_const.const_bbt_CroppingRegion, false);
                    else Log.Warning(lib_err.err_ENABLED_BEFORE);
                    while (btt.CurrentToolTip == "JobConfiguration.ControlToolBar.CropImage")
                    {
                          Delay(lib_const.const_delay_3000);
                          Sys.Process("DL.CODE").Refresh();      
                          if (lib_validate.isUnExpectedWindow())
                          {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }              
                    }
                    if (btt.CurrentToolTip == "JobConfiguration.ControlToolBar.JobConfiguration.ControlToolBar.UncropImage")
                          flag = true;
                   
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
     
}
/**
 * @function remove Cropping Region on Advanced Setup/ Automatic Setup
 * @param {boolean} isAdvanceSetup -  true/false (Advanced Setup/ Automatic Setup)
*/
function clickRemoveCroppingRegion (isAdvanceSetup)
{

          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    //focus on Advanced setup or Quick Setup
                    if (isAdvanceSetup == true)
                          clickAdvancedSetup();
                    else
                          clickQuickSetup(); 
                    //Click btt Add CR
                    var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar").WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 8).WPFObject("CroppingRegionBorder").WPFObject("CroppingRegionImageCheckBox");
                    if( btt.CurrentToolTip == "JobConfiguration.ControlToolBar.UncropImage")
                           clickToolbarButton ( lib_const.const_bbt_CroppingRegion, false);
                    else Log.Warning(lib_err.err_REMOVED_BEFORE);
                    while (btt.CurrentToolTip == "JobConfiguration.ControlToolBar.UncropImage")
                    {
                          Delay(lib_const.const_delay_3000);
                          Sys.Process("DL.CODE").Refresh();      
                          if (lib_validate.isUnExpectedWindow())
                          {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }              
                    }
                    if (btt.CurrentToolTip == "JobConfiguration.ControlToolBar.JobConfiguration.ControlToolBar.CropImage")
                          flag = true;
                   
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
     
}

/**
 * @function perform Focus Autolearn (include M220)
 * @param {boolean} isApply -  true/false (Apply/ Cancle)
*/ 
function clickIMG_FocusAutolearn (isApply)
{

          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    //perform and apply Image AutoSetup before Acquire PPI
                    clickIMG_AutoSetup_Static(true);
                    //focus on Advanced setup 
                    clickAdvancedSetup();
                    //Click btt Image AutoDetup
                    if (lib_deviceInfo.const_Device_Model != "M220")
                    {
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Reading Distance", 2).WPFObject("StackPanel", "", 1).WPFObject("FocusAutolearnCommandButton").ClickButton();
                    }
                    if (lib_deviceInfo.const_Device_Model == "M220") 
                    {
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 2).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "General Image Settings", 1).Click();
                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Reading Distance", 1).WPFObject("StackPanel", "", 1).WPFObject("FocusAutolearnCommandButton").ClickButton();
                    }
                    
                    //open Self Turn Window
                    if (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: FocusAutolearnDialogWindow", "Focus Autolearn",lib_const.const_delay_1000).Exists)
                    {    var path = Sys.Process("DL.CODE").WPFObject("HwndSource: FocusAutolearnDialogWindow", "Focus Autolearn").WPFObject("FocusAutolearnDialogWindow", "Focus Autolearn", 1);
                         aqObject.CheckProperty(path.WPFObject("Grid", "", 1).WPFObject("TextBlock", "*", 1), "WPFControlText", cmpEqual, lib_label.lb_FocusAutolearn);
                         //click on Start btt
                         path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "Start", 1).ClickButton();
                         //waiting process
                         while (path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "Apply", 3).IsEnabled == false)
                         { 
                                 delay (lib_const.const_delay_3000);
                         }
                          if (path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBlock", "*", 1).IsEnabled == true)
                          {
                                  var pathSub = path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 1);                                   
                                                                    
                                  var strReadingDistance         = pathSub.WPFObject("TextBlock", "*", 1).WPFControlText;
                                  var readingDistance = lib_common.subString(strReadingDistance, "Reading Distance (mm) :  "); 
                                  
                                  //click apply btt                                  
                                  if (isApply == true)
                                  {
                                        path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "Apply", 3).ClickButton();
                                        Delay(lib_const.const_delay_3000);
                                        if (lib_deviceInfo.const_Device_Model == "M220")
                                        {
                                                Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 2).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "General Image Settings", 1).Click();
                                                aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Reading Distance", 1).WPFObject("StackPanel", "", 1).WPFObject("Focuslevel").WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox"), "Text", cmpEqual, readingDistance);
                                        }
                                        if (lib_deviceInfo.const_Device_Model != "M220")
                                        {
                                                lib_button.clickIMGSetting();
                                                aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Reading Distance", 2).WPFObject("StackPanel", "", 1).WPFObject("Focuslevel").WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox"), "Text", cmpEqual, readingDistance);
                                        
                                        }
                                        flag = true;                      
                                  }else
                                  {
                                        path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "Cancel", 4).ClickButton();
                                        flag  = true; 
                                  }
                          }
                     }  
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
     
}
/**
 * @function perform Image Auto Setup Dynamic
 * @param {boolean} isApply -  true/false (Apply/ Cancel)
 * @param {Interger} lineSpead
 * @param {Interger} resolution
*/ 
function clickIMG_AutoSetup_Dynamic (isApply, lineSpead, resolution)
{

          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    //focus on Advanced setup 
                    clickAdvancedSetup();
                    //Click btt Image AutoDetup
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Image Quality", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "Image Auto-Setup", 1).ClickButton();
                    //open Self Turn Window
                    if (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: PhotometryAutolearnDialogWindow", "Image Auto-Setup",lib_const.const_delay_1000).Exists)
                    { 
                    
                         var path = Sys.Process("DL.CODE").WPFObject("HwndSource: PhotometryAutolearnDialogWindow", "Image Auto-Setup").WPFObject("PhotometryAutolearnDialogWindow", "Image Auto-Setup", 1);
                         //select Static mode   
                         path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("DynamicButton").ClickButton();
                         //enter value
                         var  speed = path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox").Keys("^a[Del]" + lineSpead) ;
                         var  codeRes = path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("ExplicitUpdateDoubleUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox").Keys("^a[Del]" + resolution) ;
                         //click on Start btt
                         path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Start", 1).ClickButton();
                         //waiting process
                         while (path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Apply", 3).IsEnabled == false)
                         { 
                                 delay (lib_const.const_delay_3000);
                         }
                          if (path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("TextBlock", "*", 1).IsEnabled == true)
                          {
                                  var pathSub            = path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2);
                                  var strExposureTime = pathSub.WPFObject("TextBlock", "*", 1).WPFControlText;
                                  var exposureTime = lib_common.subString(strExposureTime, lib_label.const_lb_ExposureTime_Result);
                                                                    
                                  var strGain         = pathSub.WPFObject("TextBlock", "*", 2).WPFControlText;
                                  var gain = lib_common.subString(strGain, "Gain :  ");
                                  
                                  var strMultiGain    = pathSub.WPFObject("TextBlock", "*", 3).WPFControlText;
                                  var multiGain = lib_common.subString(strMultiGain , "Gain Multiplier :  X");
                                  
                                  //click apply btt
                                  
                                  if (isApply == true)
                                  {
                                        path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Apply", 3).ClickButton();
                                        Delay(lib_const.const_delay_3000);
                                        //click on Image Setting again
                                        Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();                      
                                        var pathTextbox      = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Image Quality", 1).WPFObject("StackPanel", "", 1);
                                        
                                        
                                        //exposure time
                                        aqObject.CheckProperty(pathTextbox.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ExplicitUpdateDoubleUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox"), "Text", cmpEqual, exposureTime);
                                        //gain                                        
                                        aqObject.CheckProperty(pathTextbox.WPFObject("ParamControl", "", 6).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox"), "Text", cmpEqual, gain);
                                        
                                        var index = aqConvert.StrToInt(multiGain) - 1;
                                        multiGain = "["+ index+", X"+multiGain+"]" ;       
                                                                           
                                        aqObject.CheckProperty(pathTextbox.WPFObject("ParamControl", "", 7).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1), "wText", cmpEqual, multiGain);
                                        //lhoang comment : Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Image Quality", 1).WPFObject("StackPanel", "", 1).WPFObject("ParamControl", "", 6).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1)
                                        Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Image Quality", 1).WPFObject("StackPanel", "", 1).WPFObject("GenericPropertiesViewControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ParamControl", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1);
                                        flag = true;                      
                                  }else
                                  {
                                        path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Cancel", 4).ClickButton();
                                        flag  = true; 
                                  }
                   
                          }
                     }  
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
     
}

/**
 * @function perform click on Image Auto Setup Static
 * @param {boolean} isApply -  true/false (Apply/ Cancel)
*/ 
function clickIMG_AutoSetup_Static (isApply)
{

          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    //focus on Advanced setup 
                    clickAdvancedSetup();
                    //Click btt Image AutoDetup
                    
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();
                    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Image Quality", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "Image Auto-Setup", 1).ClickButton();
                    //open Self Turn Window
                    if (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: PhotometryAutolearnDialogWindow", "Image Auto-Setup",lib_const.const_delay_1000).Exists)
                    { 
                         var path = Sys.Process("DL.CODE").WPFObject("HwndSource: PhotometryAutolearnDialogWindow", "Image Auto-Setup").WPFObject("PhotometryAutolearnDialogWindow", "Image Auto-Setup", 1);
                         //select Static mode             
                         path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("RadioButton", "Static", 1).ClickButton();
                         //click on Start btt
                         path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Start", 1).ClickButton();
                         //waiting process
                         while (path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Apply", 3).IsEnabled == false)
                         { 
                                 delay (lib_const.const_delay_3000);
                         }
                          if (path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2).WPFObject("TextBlock", "*", 1).IsEnabled == true)
                          {
                                  var pathSub            = path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 2);
                                  var strExposureTime = pathSub.WPFObject("TextBlock", "*", 1).WPFControlText;
                                  var exposureTime = lib_common.subString(strExposureTime, lib_label.const_lb_ExposureTime_Result);
                                                                    
                                  var strGain         = pathSub.WPFObject("TextBlock", "*", 2).WPFControlText;
                                  var gain = lib_common.subString(strGain, "Gain :  ");
                                  
                                  var strMultiGain    = pathSub.WPFObject("TextBlock", "*", 3).WPFControlText;
                                  var multiGain = lib_common.subString(strMultiGain , "Gain Multiplier :  X");
                                  
                                  //click apply btt
                                  
                                  if (isApply == true)
                                  {
                                        path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Apply", 3).ClickButton();
                                        Delay(lib_const.const_delay_3000);
                                        //click on Image Setting again
                                        Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("AbstractTaskTreeControl").WPFObject("TreeViewItem", "", 3).WPFObject("TreeViewItem", "", 1).WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "Image Settings ", 1).Click();
                                        var pathTextbox      = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("PropertiesPresenter").WPFObject("UserControl").WPFObject("StackPanel", "", 1).WPFObject("ContentExpander", "Image Quality", 1).WPFObject("StackPanel", "", 1);
                                        
                                        aqObject.CheckProperty(pathTextbox.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("ExplicitUpdateDoubleUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox"), "Text", cmpEqual, exposureTime);
                                        aqObject.CheckProperty(pathTextbox.WPFObject("ParamControl", "", 6).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ExplicitUpdateIntegerUpDown", "", 1).WPFObject("Spinner").WPFObject("TextBox"), "Text", cmpEqual, gain);                         
                                                                  
                                        //M120 doesn't have multi Gain
                                        if (lib_deviceInfo.const_Device_Model != lib_deviceInfo.const_arr_DeviceModel[0])
                                        {
                                                var index = aqConvert.StrToInt(multiGain) - 1;
                                                multiGain = "["+ index+", X"+multiGain+"]" ;   
                                                aqObject.CheckProperty(pathTextbox.WPFObject("ParamControl", "", 7).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ContentControl", "", 1).WPFObject("ComboBox", "", 1), "wText", cmpEqual, multiGain);
                                        }
                                        flag = true;                      
                                  }else
                                  {
                                        path.WPFObject("Grid", "", 1).WPFObject("Grid", "", 3).WPFObject("Button", "Cancel", 4).ClickButton();
                                        flag  = true; 
                                  }
                   
                          }
                     }  
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
     
}
//update 1.5.0 a7
/**
 * @function perform click Code Autolearn button
*/ 
function clickCodeAutolearnBtt()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("CodeAutolearnActionButton", "", 1).Click();
                delay (3000);
                //wait
                for (var i = 1; i <= 2; i ++)
                {      
                      var result = Sys.Process("DL.CODE").WPFObject("HwndSource: PopupRoot", "").WPFObject("PopupRoot", "", 1).WPFObject("Decorator", "", 1).WaitWPFObject("NonLogicalAdornerDecorator", "", 1, 1000).Exists;            
                      if (result == false)
                      {      
                            lib_common.waitDelay(1000, 10);            
                            Sys.Process("DL.CODE").Refresh();
                      }
                }   
                
                Sys.Process("DL.CODE").WPFObject("HwndSource: PopupRoot", "").WPFObject("PopupRoot", "", 1).WPFObject("Decorator", "", 1).WPFObject("NonLogicalAdornerDecorator", "", 1).WPFObject("ContextMenu", "", 1).WPFObject("MenuItem", "Code Autolearn", 1).Click ();
                //lhoang comment this part
                // delay 5000 ms to wait the button code autolearn
//                for (var i = 1; i <= 2; i ++)
//                {      
//                      var result = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 2).WPFObject("VisionControl").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_MainScrollViewer").WPFObject("ContentViewbox").WPFObject("ImageGrid").WPFObject("Canvas", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_HelperToolsPresenter").WPFObject("ContentPresenter", "", 1).WPFObject("SearchRoiCanvas").WPFObject("visionToolRoiControl").WPFObject("border").WPFObject("Grid", "", 1).WPFObject("shearchBorder").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("roiActionButton").Exists;            
//                      if (result == false)
//                      {      
//                            lib_common.waitDelay(1000, 10);            
//                            Sys.Process("DL.CODE").Refresh();
//                      }
//                }
                delay(5000);
                Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 2).WPFObject("VisionControl").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_MainScrollViewer").WPFObject("ContentViewbox").WPFObject("ImageGrid").WPFObject("Canvas", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_HelperToolsPresenter").WPFObject("ContentPresenter", "", 1).WPFObject("SearchRoiCanvas").WPFObject("visionToolRoiControl").WPFObject("border").WPFObject("Grid", "", 1).WPFObject("shearchBorder").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("roiActionButton").Click();
          } else
                Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      
      return lib_err.err_FUNC_EXCEPTION;
      }   
}
// lhoang: Add, Replace, Discard
function clickCodeAutolearnBtt2(mode)
{
  Sys.Process("DL.CODE").FindChild("ToolTip", "Learn Codes", 1000).Click();
  Sys.Process("DL.CODE").WPFObject("HwndSource: PopupRoot", "").WPFObject("PopupRoot", "", 1).WPFObject("Decorator", "", 1).WPFObject("NonLogicalAdornerDecorator", "", 1).WPFObject("ContextMenu", "", 1).WPFObject("MenuItem", "Code Autolearn", 1).Click ();


  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 2).WPFObject("VisionControl").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_MainScrollViewer").WPFObject("ContentViewbox").WPFObject("ImageGrid").WPFObject("Canvas", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_HelperToolsPresenter").WPFObject("ContentPresenter", "", 1).WPFObject("SearchRoiCanvas").WPFObject("visionToolRoiControl").WPFObject("border").WPFObject("Grid", "", 1).WPFObject("shearchBorder").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("roiActionButton").Click();
  //delay(1000);
  var CodeAutoLearnWindow = Sys.Process("DL.CODE").WPFObject("HwndSource: CodeAutolearnDialogWindow", "Code Autolearn");
  var arrPro = ["WPFControlText", "ClrClassName"];
  var arrVal = ["Stop", "Button"];
  var StopButton = CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000);
  arrVal = ["Continue", "Button"];
  var ContinueButton = CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000);
  arrVal = ["Finish", "Button"];
  var FinishButton = CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000);
  var count = 300;
  var notfoundFlag = false;
  while(count >0)
  {
    if(StopButton.Exists)
    {
      if(StopButton.Enabled)
      {
        
      }
      else
      {
        if(ContinueButton.Enabled) ContinueButton.Click();
        else
        {
          FinishButton.Click();
          break;
        }
      }
    }
    
    arrPro = ["ClrClassName", "WPFControlText"];
    arrVal = ["PopupMessage", "Warning"];
    var warningPopup = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000)
    if(warningPopup.Exists)
    {
      Log.Error("Autolearn didn't find any result. Please be sure selected image includes at least one code.");
      arrVal = ["Button", "OK"];
      warningPopup.FindChild(arrPro, arrVal, 1000).Click();
      notfoundFlag = true;
      break;
    }
    delay(1000);
  }
  delay(3000);
  if(notfoundFlag) return
  if(mode == "Replace")
  {
    arrVal = ["RadioButton", "Replace Current Configuration"] ;
    CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000).Click();
  }
  else if(mode == "Discard")
  {
    arrVal = ["RadioButton", "Discard Autolearn Result"] ;
    CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000).Click();
  }
  else if(mode == "Add")
  {
    arrVal = ["RadioButton", "Add to Current Configuration"] ;
    CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000).Click();
  }
  else
  {
    
  }
  arrPro = ["WPFControlText", "ClrClassName", "Visible"];
  arrVal = ["OK", "Button", true];
  CodeAutoLearnWindow.FindChild(arrPro, arrVal, 1000).Click();
  delay(5000);
}
/**
 * @function perform click on <X> button to close Code Autolearn  
*/ 
function clickCloseCodeAutolearnBtt()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("CodeAutolearnActionButton", "", 1).Click();
                Sys.Process("DL.CODE").WPFObject("HwndSource: PopupRoot", "").WPFObject("PopupRoot", "", 1).WPFObject("Decorator", "", 1).WPFObject("NonLogicalAdornerDecorator", "", 1).WPFObject("ContextMenu", "", 1).WPFObject("MenuItem", "Code Autolearn", 1).Click ();
                Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("VisionControl").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_MainScrollViewer").WPFObject("ContentViewbox").WPFObject("ImageGrid").WPFObject("Canvas", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("PART_HelperToolsPresenter").WPFObject("ContentPresenter", "", 1).WPFObject("Canvas", "", 1).WPFObject("visionToolRoiControl").WPFObject("border").WPFObject("Grid", "", 1).WPFObject("shearchBorder").WPFObject("Grid", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("roiCloseButton").WPFObject("Image", "", 1).Click();
          } else
                Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }   
}
//feature removed from 1.5.0
function clickDPMBtt()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WPFObject("JobContentPresenter").WPFObject("AdvancedSetupJobContent", "", 1).WPFObject("CodeAutolearnActionButton", "", 1).Click();
                Sys.Process("DL.CODE").WPFObject("HwndSource: PopupRoot", "").WPFObject("PopupRoot", "", 1).WPFObject("Decorator", "", 1).WPFObject("NonLogicalAdornerDecorator", "", 1).WPFObject("ContextMenu", "", 1).WPFObject("MenuItem", "Datamatrix DPM Autolearn", 2).Click ();
          
          } else
                Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }   
}

/**
 * @function click on Output Setup tab
*/
function clickOutputSetup()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 4).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ExpanderStepSubItemButton", "", 1);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 4).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ExpanderStepSubItemButton", "", 1).WPFObject("TextBlock", "", 1), "WPFControlText", cmpEqual, "Output Setup");
                  btt.Click();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND); 
      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}

/**
 * @function click on Data Formatting tab
*/
function clickDataFortmating()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 4).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ExpanderStepSubItemButton", "", 1);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 4).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ExpanderStepSubItemButton", "", 1).WPFObject("TextBlock", "", 1), "WPFControlText", cmpEqual, "Data Formatting");
                  btt.Click();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}

//author: lhoang

function clickDataFortmating2()
{
  arrPro = ["ClrFullClassName", "WPFControlText"];
  arrVal = ["System.Windows.Documents.Run", "Data Formatting"];
  dataFormattingObj = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
  dataFormattingObj = dataFormattingObj.Parent;
  dataFormattingObj.Click();
}

/**
 * @function click on DGoodReadSetup tab
*/
function clickGoodReadSetup()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ExpanderStepSubItemButton", "", 1);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ExpanderStepSubItemButton", "", 1).WPFObject("TextBlock", "", 1), "WPFControlText", cmpEqual, "Good Read Setup");
                  btt.Click();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}
/**
 * @function click on Reading Phase tab
*/
function clickReadingPhase()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ExpanderStepSubItemButton", "", 1);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ExpanderStepSubItemButton", "", 1).WPFObject("TextBlock", "", 1), "WPFControlText", cmpEqual, "Reading Phase");
                  btt.Click();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}
//author: lhoang
function clickReadingPhase2()
{
  arrPro = ["ClrFullClassName", "WPFControlText"];
  arrVal = ["System.Windows.Documents.Run", "Reading Phase"];
  readingPhaseObj = Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000);
  readingPhaseObj = readingPhaseObj.Parent;
  readingPhaseObj.Click();

}


/**
 * @function click on Advanced Setup tab
*/
function clickAdvancedSetup()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("border").WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ExpanderStepSubItemButton", "", 1);
//                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("border").WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 2).WPFObject("ExpanderStepSubItemButton", "", 1).WPFObject("TextBlock", "", 1), "WPFControlText", cmpEqual, "Advanced Setup");
                  btt.Click();
                  Delay(2000);
                  if (lib_validate.isUnExpectedWindow() == true)
                    Log.Message("Err");
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND); 
      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}

/**
 * @function click on Automatic Setup tab
*/
function clickQuickSetup()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("border").WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ExpanderStepSubItemButton", "", 1);
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("CollapsedExpander").WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("JcmExpanderUserControl").WPFObject("Grid", "", 1).WPFObject("StepsPanelScrollViewer").WPFObject("Grid", "", 1).WPFObject("border").WPFObject("Grid", "", 1).WPFObject("ItemsControl", "", 1).WPFObject("ContentPresenter", "", 1).WPFObject("ExpanderStepSubItemButton", "", 1).WPFObject("TextBlock", "", 1), "WPFControlText", cmpEqual, lib_label.lb_QuickSetup);
                  btt.Click();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    

}
/**
 * @function click on Open Job on Device
 * button is a icon on Menu toolbar 
*/
function clickOpenJobOnDevice ()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt_Open = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("IvsToolBar").WPFObject("ContentPresenter", "", lib_const.const_btt_OpenOnDevice).WPFObject("Grid", "", 1).WPFObject("Button", "", 1);
                  if (btt_Open.Enabled == true && btt_Open.Visible == true)  
                            btt_Open.ClickButton();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    
}
/**
 * @function click onSaveInTemp
 * button is a icon on Menu toolbar 
*/
function clickSaveInTemp ()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var btt_SaveTemp = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("IvsToolBar").WPFObject("ContentPresenter", "", lib_const.const_btt_SaveInTemp).WPFObject("Grid", "", 1).WPFObject("Button", "", 1);
                  if (btt_SaveTemp.Enabled == true && btt_SaveTemp.Visible == true)  
                            btt_SaveTemp.ClickButton();
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }    
}
/**
 * @function switch on Monitor mode
 * File -> Monitor
*/
function clickMenuMonitor ()
{
      try
      {
          if (lib_validate["isDLCODERunning"]())
          {          
                  var IvsMenu =Sys["Process"]("DL.CODE")["WPFObject"]("HwndSource: Shell", lib_deviceInfo.const_firmware)["WPFObject"]("Shell", lib_deviceInfo.const_firmware, 1)["WPFObject"]("Border", "", 1)["WPFObject"]("DockPanel", "", 1)["WPFObject"]("Grid", "", 1)["WPFObject"]("Border", "", 2)["WPFObject"]("Grid", "", 1)["WPFObject"]("IvsMenu"); 
                  Delay(1500);
                  IvsMenu["WPFObject"]("MenuItem",lib_label.const_lb_File, 1).Click();
                  IvsMenu.WPFMenu.Click(lib_label.const_lb_File +"|" + lib_label.const_lb_File_Monitor);
                  Delay (5000);
                  //aqObject.CheckProperty(Aliases.DL_CODE.MenuitemMonitor, "Enabled", cmpEqual, false);
                  IvsMenu["WPFObject"]("MenuItem",lib_label.const_lb_File, 1).Click();
                  aqObject.CheckProperty(Sys.Process("DL.CODE").WPFObject("HwndSource: PopupRoot", "").WPFObject("PopupRoot", "", 1).WPFObject("Decorator", "", 1).WPFObject("NonLogicalAdornerDecorator", "", 1).WPFObject("MenuItem", "Monitor", 5),"Enabled", cmpEqual, false); 
                  //wait
                  for (var i = 1; i <= 2; i ++)
                  {      
                        var result = lib_validate.isMonitorMode();;            
                        if (result == false)
                        {      
                              lib_common.waitDelay(1000, 10);            
                              Sys.Process("DL.CODE").Refresh();
                        }
                  }    
                                  
          } else
                  Log.Message(lib_messageLog.err_DLCODE_NOFOUND);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }      
}
 
 
/**
 * @function click on Monitor button
 * button is a icon on Menu toolbar 
*/
function clickIVSMonitorButton ()
{
      try
      {
          if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("IvsToolBar").WPFObject("ContentPresenter", "", lib_const.const_btt_Monitor).Visible == true)
          {          
                  Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Border", "", 1).WPFObject("IvsToolBar").WPFObject("ContentPresenter", "", lib_const.const_btt_Monitor).WPFObject("Grid", "", 1).WPFObject("Button", "", 1).WPFObject("Image", "", 1).Click();
                  delay (10000);
                  var result = lib_validate.isMonitorMode();
                  if (result == true)                 
                          return lib_err.err_FUNC_SUCCESS;
          } else
                  Log.Message(lib_messageLog.msg_Button_Invisible);

      }      
      catch (e)
      {
      return lib_err.err_FUNC_EXCEPTION;
      }      
}
/**
 * @function Minimize
*/
function clickMinimize()
{
          if (  lib_validate["isDLCODERunning"]())
          {
                      var process = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware);
                      if (process.Height != 0 && process.Width != 0)
                                process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 1).ClickButton();
                      else 
                                Log.Message(msg_UI_MINIMIZE); 
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
}
/**
 * @function Maximize
*/
function clickMaximize()
{
          if (  lib_validate["isDLCODERunning"]())
          {
                    var process = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware);      
                    if (process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 2).Visible)
                    {   
                            process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 2).ClickButton();
                            return 0;
                    }

                    if (process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 3).Visible)
                    {   
                            process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 3).ClickButton();
                            return 1;
                    }
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
}
/**
 * @function click on StartAutoSet button
 * Setup internal Network screen 
*/
function clickStartAutoSet()
{
          if (  lib_validate.isDLCODERunning())
          {
                    if (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware,lib_const.const_delay_1000).Exists)
                    {                            
                         Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("ClusterNetworkSetupView", "", 1).WPFObject("LayoutRoot").WPFObject("CentralPanel").WPFObject("ScrollViewer", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 2).WPFObject("Grid", "", 1).WPFObject("ListBox").WPFObject("Bd").WPFObject("ScrollViewer", "", 1).WPFObject("ItemsPresenter", "", 1).WPFObject("ListBoxItem", "", 1).WPFObject("Bd").WPFObject("ContentPresenter", "", 1).WPFObject("Button").ClickButton();
                         while (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: NetworkAutosetWindow", "Network Autoset", 4000).Exists)
                               Delay(4000);
                         
                    }
                     
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
}
/**
 * @function Close
*/
function clickClose()
{
          if (  lib_validate.isDLCODERunning())
          {
                    if (Sys.Process("DL.CODE").WaitWPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware,lib_const.const_delay_1000).Exists)
                    {
                          var process = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware);      
                          if (process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 4).Visible)
                                  process.WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 4).ClickButton();
                    }
                     
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
}
/**
 * @function StartContMode button
 * Automatic Setup tab
*/
function clickStartContMode()
{
          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    clickQuickSetup();
                    if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                    {
                            var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");   
                            if (controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Button", "", 1).Visible)
                            {
                                    controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Button", "", 1).ClickButton();
                                    flag = true;
                            }
                            else
                                  Log.Message(lib_messageLog.msg_Button_Invisible); 
                    }   
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }
                    
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
          return true;
}

/**
 * @function StopContMode button
 * Automatic Setup tab
*/
function clickStopContMode()
{
          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                    {
                            var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");   
                            if (controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Button", "", 2).Visible)
                            {
                                    controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Button", "", 2).ClickButton();
                                    flag = true;
                            }
                            else
                                  Log.Message(lib_messageLog.msg_Button_Invisible); 
                    }   
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }
                    
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
          return true;
}
/**
 * @function Play button
 * @param {boolean} isMonitor true/false (Monitor/Configuration)
*/
function clickPlay(isMonitor)
{
          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {

                    if (isMonitor == false)
                    {          
                            if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                            {
                                    var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");
                                    Delay(5000);//linhtnguyen comment
                                    if (controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "", 1).Visible)
                                    {
                                            controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "", 1).ClickButton();
                                            flag = true;
                                    }
                                    else
                                          Log.Message(lib_messageLog.msg_Button_Invisible); 
                            }   
                            while (lib_validate.isUnExpectedWindow())
                            {
                                  Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                                  lib_common.proccessUnexpectedWindow();
                            }
                    }else
                    {
                    
                            if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                            {
                                    Delay(5000);//linhtnguyen comment                                                
                                    if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 2).WPFObject("Button", "", 1).Visible)
                                    {
                                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 2).WPFObject("Button", "", 1).ClickButton();
                                            flag = true;
                                    }
                                    else
                                          Log.Message(lib_messageLog.msg_Button_Invisible); 
                            }   
                            while (lib_validate.isUnExpectedWindow())
                            {
                                  Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                                  lib_common.proccessUnexpectedWindow();
                            }
                    }
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);
          return flag;  
}
/**
 * @function Start Automatic Setup btt
 * Automatic Setup tab
*/
function clickSmartSetupActionButton()
{
          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    clickQuickSetup();          
                    if(Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("Border", "", 1).WPFObject("TabControl", "", 1).WPFObject("Grid", "", 1).WaitWPFObject("JobContentPresenter", lib_const.const_delay_1000).Exists)
                    {
                            var path = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 3).WPFObject("Grid", "", 1).WPFObject("TabControl", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("ScrollViewer", "", 1).WPFObject("QuickSetupControlPanel", "", 1).WPFObject("StackPanel", "", 1)   
                            if (path.WPFObject("StackPanel", "", 1).WPFObject("Button", lib_label.lb_StartAutomaticSetup, 1).Visible) 
                            {
                                    path.WPFObject("StackPanel", "", 1).WPFObject("Button", lib_label.lb_StartAutomaticSetup, 1).Click();
                                    flag = true;
                            }
                            else
                                  Log.Message(lib_messageLog.msg_Button_Invisible);
                    }  
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }   
                    
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
           return true;
}
/**
 * @function Pause btt
 * @param {boolean} isMonitor true/false  
*/

function clickPause(isMonitor)
{
          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    if (isMonitor == false)
                    {         
                            if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                            {
                                    var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");   
                                    if (controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "", 2).Visible)
                                    {
                                            controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("Button", "", 2).ClickButton();
                                            flag = true;
                                    }
                                    else
                                          Log.Message(lib_messageLog.msg_Button_Invisible); 
                            }   
                            while (lib_validate.isUnExpectedWindow())
                            {
                                  Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                                  lib_common.proccessUnexpectedWindow();
                            }
                    }else
                    {
                    
                            if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                            {
                                    if (Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 2).WPFObject("Button", "", 2).Visible)
                                    {
                                            Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("Border", "", 2).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 2).WPFObject("Button", "", 2).ClickButton();
                                            flag = true;
                                    }
                                    else
                                          Log.Message(lib_messageLog.msg_Button_Invisible); 
                            }   
                            while (lib_validate.isUnExpectedWindow())
                            {
                                  Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                                  lib_common.proccessUnexpectedWindow();
                            }
                    }
                    
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
          return true;
}

/**
 * @function Capture button
 * Automatic Setup tab
*/
function clickCapture()
{
          var flag = false; 
          lib_button.clickAdvancedSetup();
          if (  lib_validate["isDLCODERunning"]())
          {
                    if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                    {
                            var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");   
                            if (controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 1).Visible)
                            {
                                    controlToolbar.WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", "", 1).ClickButton();
                                    delay (3000);
                                    flag = true;
                            }
                            else
                                  Log.Message(lib_messageLog.msg_Button_Invisible);
                    }  
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }   
                    
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
           return true;
}
/**
 * @function TestRecord button
 * Automatic Setup tab
*/
function clickTestRecord()
{
          var flag = false; 
          if (  lib_validate["isDLCODERunning"]())
          {
                    if( Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WaitWPFObject("CentralBorder", lib_const.const_delay_1000).Exists)
                    {
                            var controlToolbar = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("controlToolBar");   
                            if ( controlToolbar.WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 7).WPFObject("Button", "", 1).Visible)
                            {
                                    controlToolbar.WPFObject("Grid", "", 1).WPFObject("ToolBar", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Border", "", 7).WPFObject("Button", "", 1).ClickButton();
                                    flag = true;
                            }
                            else
                                  Log.Message(lib_messageLog.msg_Button_Invisible);
                    }  
                    while (lib_validate.isUnExpectedWindow())
                    {
                          Log.Warning(lib_messageLog.msg_UnExpectedWindow);
                          lib_common.proccessUnexpectedWindow();
                    }   
                    
          }else
                    Log.Message(lib_err.err_DLCODE_NOFOUND);  
           return true;
}

/**
 * @function clear Console
*/
function clearConsole()
{
      if (lib_button.clickOpenConsoleTab() == false) // Automatic Setup tab
            return;
      //clear console 
      Sys.Process("DL.CODE").Refresh();      
      var console =    Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot").WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("Terminal", "", 1).WPFObject("MainScrollViewer").WPFObject("ItemsControl", "", 1);
      if (console.ChildCount >0 )// there is mesage => clear
      {                     
            console.ClickR();
            console.PopupMenu.Click("Clear");
      }
}
function ConfigNoRead_DataForamtting()
{
  // click on no read
  arrPro = ["WPFControlText", "Visible"];
  arrVal = ["No Read", true];
  Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000).Click();
  //enter string noread
  arrPro1 = ["WPFControlText", "ClrClassName", "ChildCount"];
  arrVal1 = ["Custom String", "TextBlock", 1];
  customfieldFrame = Sys.Process("DL.CODE").FindChild(arrPro1, arrVal1, 1000);
  customfieldFrame = customfieldFrame.Parent;
  
  arrPro = ["WPFControlName", "Visible"];
  arrVal = ["rtbText", true];
  NoReadTextBox = customfieldFrame.FindChild(arrPro, arrVal, 1000);
  NoReadTextBox.Click();
  NoReadTextBox.Keys("[BS]");
  NoReadTextBox.Keys("noread");
}

function ConfigGoodRead_DataFormatting()
{
  // click on goodread read
  arrPro = ["WPFControlText", "Visible"];
  arrVal = ["Good Read", true];
  Sys.Process("DL.CODE").FindChild(arrPro, arrVal, 1000).Click();
  // add custom field
  Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Custom Field", 1000).Click();
  
  arrPro1 = ["WPFControlText", "ClrClassName", "ChildCount"];
  arrVal1 = ["Custom String", "TextBlock", 1];
  customfieldFrame = Sys.Process("DL.CODE").FindChild(arrPro1, arrVal1, 1000);
  customfieldFrame = customfieldFrame.Parent;
  //enter string noread
  arrPro = ["WPFControlName", "Visible"];
  arrVal = ["rtbText", true];
  GoodReadTextBox = customfieldFrame.FindChild(arrPro, arrVal, 1000);
  GoodReadTextBox.Click();
  GoodReadTextBox.Keys("[BS]");
  GoodReadTextBox.Keys("goodread");
}

function clickPlay2()
{
  playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Play", 1000);
  if(playPauseBtn.Exists)
  {
    if(playPauseBtn.Visible)
    {
      playPauseBtn.Click();
    }
    else
    {
      playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Pause", 1000);
      playPauseBtn.Click();   
      playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Play", 1000);
      playPauseBtn.Click();            
    }
  }
  else
  {
    playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Pause", 1000);
    playPauseBtn.Click();   
    playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Play", 1000);
    playPauseBtn.Click();
  }
}

function clickPause2()
{
  playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Pause", 1000);
  if(playPauseBtn.Exists)
  {
    if(playPauseBtn.Visible)
    {
      playPauseBtn.Click();
    }
    else
    {
      playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Play", 1000);
      playPauseBtn.Click();   
      playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Pause", 1000);
      playPauseBtn.Click();            
    }
  }
  else
  {
    playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Play", 1000);
    playPauseBtn.Click();   
    playPauseBtn = Sys.Process("DL.CODE").FindChild("ToolTip.Text", "Pause", 1000);
    playPauseBtn.Click();
  }
}

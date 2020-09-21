function Test6()
{
  var DLCode = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", "DL.CODE 1.9.0.60");
 //var dataformat = Sys.Process("DL.CODE").FindChild("ClrFullClassName", "System.Windows.Controls.DockPanel", 2000);  
 //var dataformat = dataformat.FindChild("Name", "WPFObject(\"Grid\", \"\", 2)", 2000);
 //var dataformat = dataformat.FindChild("Name", "WPFObject(\"Border\", \"\", 3)", 2000);
 //var dataformat = dataformat.FindChild("Name", "WPFObject(\"TabControl\", \"\", 1)", 2000);
 var a = ["Name","ClrFullClassName" ];
 var b = ["WPFObject(\"UserControl\")", "IVS_UI.Views.PropertyViews.OutputMessagePropertiesView"];
  dataformat =DLCode.FindChild(a, b, 2000);
 
 Log.Message(dataformat.FullName);
}
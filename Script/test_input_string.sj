function Test6()
{
  //Checks whether the 'WPFControlText' property of the Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.TextblockStx object equals '<STX>'.
  aqObject.CheckProperty(Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.TextblockStx, "WPFControlText", cmpEqual, "<STX>");
  //Activates the 'HwndSource_Shell' window.
  Aliases.DL_CODE2.HwndSource_Shell.Activate();
  OCR.Recognize(Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.StackPanel.Grid.StackPanel.ItemsControl.TextBox).BlockByText("100").DblClick();
  OCR.Recognize(Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.StackPanel.Grid.StackPanel.ItemsControl.TextBox).BlockByText("100").Click();
  OCR.Recognize(Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.StackPanel.Grid.StackPanel.ItemsControl.TextBox).BlockByText("100").DblClick();
  //Enters '100000[Enter]' in the 'TextBox' object.
  Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.StackPanel.Grid.StackPanel.ItemsControl.TextBox.Keys("100000[Enter]");
}
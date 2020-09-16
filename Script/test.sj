﻿//USEUNIT lib_const
//USEUNIT lib_DeviceSelectedDetail
//USEUNIT lib_err
//USEUNIT lib_common
//USEUNIT lib_connection
//USEUNIT lib_DeleteJob
//USEUNIT lib_deviceInfo
//USEUNIT lib_OpenJob
//USEUNIT lib_UserRole
//USEUNIT Device
//USEUNIT InstallerBasic
//USEUNIT lib_validate
//USEUNIT simulator_common
//USEUNIT setupInternalNetwork
  

 
 function compareIDs()
 {
//  var str = "27344, 27345, 21903, 21895, 21907, 25414, 21882, 21908, 24476, 16138, 25110, 25459, 16153, 16143, 21781, 21775, 11409, 21543, 27347, 27348, 27350, 27352, 62716, 27346, 21072, 21073, 21074, 16200, 16197, 11408, 21912, 21911, 26702, 16199, 21905, 16226, 16217, 16225, 16227, 11407, 27365, 27363, 21756, 24073, 21769, 26808, 26770, 26775, 26783, 27374, 26806, 19419, 27356, 27357, 27358, 21761, 21718, 25512, 21836, 21836, 21838, 21841, 27353, 24511, 21513, 21517, 21420, 21527, 21530, 21532, 21808, 21809, 21810, 21811, 21812, 21813, 21814, 21815, 21816, 21817, 21818, 21819, 21820, 21821, 21822, 21823, 21824, 21825, 21834, 21837, 21839, 21840, 21842, 24478, 24496, 21561, 11424, 21560, 19433, 11441, 21570, 21568, 21566, 21567, 11439, 15847, 15832, 26774, 16153, 21572, 26643, 26645, 26644, 24546, 27372, 27373, 21851, 15937, 16001, 15925, 16006, 21844, 15991, 15933, 15944, 15945, 15946, 15950, 15955, 15957, 15959, 15963, 15965, 15998, 19429, 21849, 21853, 20485, 16000, 21856, 21858, 21859, 19407, 21236, 15899, 15995, 15988, 15989, 15928, 15960, 15961, 15962, 15966, 15974, 15976, 15980, 16037, 16039, 21852, 21846, 21843, 21133, 15999, 15979, 15978, 15958, 15948, 15941, 15939, 15929, 15903, 15906, 15918,  15951, 15952, 15982, 15990, 25466, 25458, 25451, 25456, 25452, 25460, 25463, 25455, 25450, 23689, 23688, 23687, 11418, 22376, 23686, 21697, 14277, 20976, 20466, 21662, 14315, 14343, 21639, 27355, 27359, 21701, 21747, 21748, 21749, 21750, 21751, 21752, 21753, 21654, 21655, 21657, 21745, 21737, 21738, 21739, 21740, 21741, 21743, 21744, 21746, 21667,  21669, 21671, 21670, 21672, 21674, 21673, 21675, 21677, 21632, 21633, 21634, 21636, 21635, 21637, 21638, 21640,  21641, 21642, 21643, 21644, 21645, 21646, 21647, 21648, 21649, 21650, 21651, 21652, 21653, 21656, 21658, 21659, 21660, 21661, 21663,  21664, 21665, 21666, 21680, 21681, 21682, 21683, 21684, 21685, 21686, 21687, 21688, 21689, 21690, 21691, 21692, 21693, 21695, 21694, 21696, 21697, 21698, 21699, 21700, 21668, 25520, 11402, 21909, 21904, 21910, 16212,  16205, 16204, 16190, 16197, 16192, 16198, 16202, 16221, 27370, 27371, 26776, 26781, 16020, 15851, 15852, 27360, 21565, 15779, 15804, 15816, 15817, 15818, 15788, 15837, 19058, 19025, 26695, 16206, 16207, 16208, 15872, 15874, 24759, 24779, 24778, 21636, 21639, 21647, 21658, 21662, 21668, 21680, 26772, 26771, 25358, 25224, 25263, 25343, 25337, 24780, 25223, 25361, 24684, 24731, 24599, 25330, 25372, 25345, 24727, 25303, 24783, 25297, 25301, 24784, 25333, 24685, 25332, 25319, 25359, 25340, 25363, 25353, 24776, 24494, 24777, 25360, 25366, 25322, 25323, 24782, 24687, 24686, 24726, 25374, 25317, 25302, 25365, 25296, 25329, 25327, 24722, 24602, 25324, 25351, 24725, 25346, 25320, 25371, 25334, 14122, 25077, 25084, 25134, 24796, 11658, 25203, 25079, 20522, 25085, 20523, 24799, 25081, 20524, 25082, 27369, 21614, 21583, 21029, 21615, 21618, 21001, 21020, 21014, 21025, 21034, 21009, 21030, 21003, 24503, 21026, 24156, 24480, 24821, 24477, 24504, 24822, 20992, 20998, 21023, 24476, 21027, 21013, 20999, 20993, 24505, 21028, 21033, 21024, 21547, 21539, 21542, 21544, 21546, 21498, 21008, 21548, 21041, 21535, 21537, 21551, 21554, 21555, 21038, 21556, 21558, 21018, 21563, 21573, 21574, 24553, 24627, 24603, 24600, 24631, 26729, 26726, 26742, 26743, 26744, 26731, 26728, 26745, 26733, 26753, 18428, 18412, 18441, 18437, 18445,18427, 18415, 18439, 18435, 18416, 18431, 18430, 18429, 18442, 18421, 18433, 18434, 18440, 18413, 18422, 18418, 18436, 18446, 18438, 18420, 18424,  18417, 18425, 18423, 18426, 18432, 18414, 21767, 21742, 21754, 21766, 11412, 4408, 4342, 21764, 25364, 24806, 24805, 18419, 27351, 27361, 15730, 15733, 15745, 21261, 26819, 27369, 21793, 24485, 24513, 24483, 24515, 20964, 20967, 24066, 21487, 23218, 21443, 20966, 24074, 21616, 21619, 21617, 21609, 21612, 21628, 21626, 21629, 21621, 21625, 21592, 21590, 21594, 21585, 21589, 21587, 21602, 21606, 21598, 21601, 21599, 21495, 21503, 21526, 18496, 18497, 18507, 18508, 18503, 18485, 18491, 18493, 18488, 20491, 20492, 20493, 20494, 20495, 20496, 20497, 20500, 21170, 21171, 21245, 21426, 21428, 21429, 21430, 21431, 21434, 21435, 21436, 21437, 21438, 23955, 24004, 24006, 24007, 24560, 24581, 24572, 24583, 24554, 24557, 24558, 24567, 26771, 26772, 27362, 27364, 23971, 23972, 23973, 23974, 23975, 23976, 23977, 23978, 27366, 27367, 27368";
  
  var str =    "27344,27345,21903,21895,21907,25414,21882,21908,24476,16138,25110,25459,16153,16143,21781,21775,11409,21543,27347,27348,27350,27352,62716,27346,21072,21073,21074,16200,16197,11408,21912,21911,26702,16199,21905,16226,16217,16225,16227,11407,27365,27363,21756,24073,21769,26808,26770,26775,26783,27374,26806,19419,27356,27357,27358,21761,21718,25512,21836,21836,21838,21841,27353,24511,21513,21517,21420,21527,21530,21532,21808,21809,21810,21811,21812,21813,21814,21815,21816,21817,21818,21819,21820,21821,21822,21823,21824,21825,21834,21837,21839,21840,21842,24478,24496,21561,11424,21560,19433,11441,21570,21568,21566,21567,11439,15847,15832,26774,16153,21572,26643,26645,26644,24546,27372,27373,21851,15937,16001,15925,16006,21844,15991,15933,15944,15945,15946,15950,15955,15957,15959,15963,15965,15998,19429,21849,21853,20485,16000,21856,21858,21859,19407,21236,15899,15995,15988,15989,15928,15960,15961,15962,15966,15974,15976,15980,16037,16039,21852,21846,21843,21133,15999,15979,15978,15958,15948,15941,15939,15929,15903,15906,15918,15951,15952,15982,15990,25466,25458,25451,25456,25452,25460,25463,25455,25450,23689,23688,23687,11418,22376,23686,21697,14277,20976,20466,21662,14315,14343,21639,27355,27359,21701,21747,21748,21749,21750,21751,21752,21753,21654,21655,21657,21745,21737,21738,21739,21740,21741,21743,21744,21746,21667,21669,21671,21670,21672,21674,21673,21675,21677,21632,21633,21634,21636,21635,21637,21638,21640,21641,21642,21643,21644,21645,21646,21647,21648,21649,21650,21651,21652,21653,21656,21658,21659,21660,21661,21663,21664,21665,21666,21680,21681,21682,21683,21684,21685,21686,21687,21688,21689,21690,21691,21692,21693,21695,21694,21696,21697,21698,21699,21700,21668,25520,11402,21909,21904,21910,16212,16205,16204,16190,16197,16192,16198,16202,16221,27370,27371,26776,26781,16020,15851,15852,27360,21565,15779,15804,15816,15817,15818,15788,15837,19058,19025,26695,16206,16207,16208,15872,15874,24759,24779,24778,21636,21639,21647,21658,21662,21668,21680,26772,26771,25358,25224,25263,25343,25337,24780,25223,25361,24684,24731,24599,25330,25372,25345,24727,25303,24783,25297,25301,24784,25333,24685,25332,25319,25359,25340,25363,25353,24776,24494,24777,25360,25366,25322,25323,24782,24687,24686,24726,25374,25317,25302,25365,25296,25329,25327,24722,24602,25324,25351,24725,25346,25320,25371,25334,14122,25077,25084,25134,24796,11658,25203,25079,20522,25085,20523,24799,25081,20524,25082,27369,21614,21583,21029,21615,21618,21001,21020,21014,21025,21034,21009,21030,21003,24503,21026,24156,24480,24821,24477,24504,24822,20992,20998,21023,24476,21027,21013,20999,20993,24505,21028,21033,21024,21547,21539,21542,21544,21546,21498,21008,21548,21041,21535,21537,21551,21554,21555,21038,21556,21558,21018,21563,21573,21574,24553,24627,24603,24600,24631,26729,26726,26742,26743,26744,26731,26728,26745,26733,26753,18428,18412,18441,18437,18445,18427,18415,18439,18435,18416,18431,18430,18429,18442,18421,18433,18434,18440,18413,18422,18418,18436,18446,18438,18420,18424,18417,18425,18423,18426,18432,18414,21767,21742,21754,21766,11412,4408,4342,21764,25364,24806,24805,18419,27351,27361,15730,15733,15745,21261,26819,27369,21793,24485,24513,24483,24515,20964,20967,24066,21487,23218,21443,20966,24074,21616,21619,21617,21609,21612,21628,21626,21629,21621,21625,21592,21590,21594,21585,21589,21587,21602,21606,21598,21601,21599,21495,21503,21526,18496,18497,18507,18508,18503,18485,18491,18493,18488,20491,20492,20493,20494,20495,20496,20497,20500,21170,21171,21245,21426,21428,21429,21430,21431,21434,21435,21436,21437,21438,23955,24004,24006,24007,24560,24581,24572,24583,24554,24557,24558,24567,26771,26772,27362,27364,23971,23972,23973,23974,23975,23976,23977,23978,27366,27367,27368";

  str =aqString.Trim(str, aqString.stAll);  
  var arr_Str =  str.split(",");
  Log.Message(arr_Str.length);
  var kotrung = arr_Str.length;
  var trung = 0;
  for (var i = 0; i < arr_Str.length - 1; i++)
  {
      for (j = i+ 1; j< arr_Str.length; j++)
      {
           if (arr_Str[i] ==arr_Str[j] )
           {
               Log.Warning( arr_Str[i] + " ; " + arr_Str[j]); 
               trung = trung + 2;
               kotrung = kotrung - 2;
              
           }            
      }
  } 
  Log.Message(trung); 
  Log.Message(kotrung);
      
 }
   
var pathPrgData = "C:\\ProgramData\\Datalogic";
var pathPrgFile = "C:\\Program Files (x86)\\Datalogic";
var pathUsrConfig = "C:\\Users\\Administrator\\AppData\\Local\\Datalogic_SpA";
var guiVersion = "DL.CODE 1.8.0";

function Test1()
{    
                     Sys.Process("CCleaner64", 2).Window("#32770", "", 1).Window("Button", "Fix All Selected Issues", 4).ClickButton();
              while (Sys.Process("CCleaner64", 2).Window("#32770", "", 1).Window("Button", "Close", 5).Enabled == false ||
                    Sys.Process("CCleaner64", 2).Window("#32770", "", 1).Window("Button", "Close", 5).Visible == false ||
                    Sys.Process("CCleaner64", 2).Window("#32770", "", 1).Window("Button", "Close", 5).VisibleOnScreen == false)
                    Delay(3000);
              Sys.Process("CCleaner64", 2).Window("#32770", "", 1).Window("Button", "Close", 5).ClickButton();
              Sys.Process("CCleaner64", 2).Window("PiriformCCleaner", "CCleaner - FREE FOR HOME USE", 1).Close(); 
 }
 

function Test2()
{ 

  var rootPath = Sys.Process("DL.CODE").WPFObject("HwndSource: Shell", lib_deviceInfo.const_firmware).WPFObject("Shell", lib_deviceInfo.const_firmware, 1).WPFObject("Border", "", 1).WPFObject("DockPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("ContentPlaceholder").WPFObject("UserControl").WPFObject("LayoutRoot");
        
 subPath = rootPath.WPFObject("CentralBorder").WPFObject("Grid", "", 1).WPFObject("BottomBorder").WPFObject("BottomTabControl").WPFObject("ScrollViewer", "", 1).WPFObject("Grid", "", 1).WPFObject("ResultCollectionCanvas");
aqObject.CheckProperty(subPath.WPFObject("DesignerItem", "", j).WPFObject("PART_ContentPresenter").WPFObject("StackPanel", "", 1).WPFObject("TextBlock", "", 2), "WPFControlText", cmpEqual, true);
                                              aqObject.CheckProperty(subPath.WPFObject("DesignerItem", "", j), "Enabled", cmpEqual, true);
  }
              
          

function Test3()
{
  var hwndSource = Aliases.DL_CODE2.HwndSource_Shell;
  hwndSource.Activate();
  var tabControl = hwndSource.Shell.CentralBorder.Grid.TabControl;
  var contentControl = tabControl.ListBoxItem.ContentControl;
  contentControl.Drag(47, 25, 87, 2);
  contentControl.Drag(29, 27, 111, 1);
  contentControl.Drag(30, 32, 108, -5);
  var listBoxItem = tabControl.ListBoxItem2;
  listBoxItem.Grid.ContentControl.Drag(21, 20, -72, -7);
  listBoxItem.ContentControl.Drag(32, 27, -100, 0);
  contentControl.Click(17, 28);
}

function Test6()
{
  //Checks whether the 'WPFControlText' property of the Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.TextblockStx object equals '<STX>'.
  aqObject.CheckProperty(Aliases.DL_CODE2.HwndSource_Shell.Shell.DockPanel.Grid.Border.TabControl.TextblockStx, "WPFControlText", cmpEqual, "<STX>");
}
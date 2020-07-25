# rotrics_calc_for_delphi
Demo program to control Rotrics DexArm from Embarcadero Delphi.

# Development Platform
- Embarcadero Delphi:
  - I confirmed this program works with Delphi 10.3 Community Edition, but it should work with other versions as long as it's supported by the following ComPort Library: 

- Rotrics DexArm:
  - I concofirmed this program works with the Rotrics DexArm firmware version 2.1.4 (July 11, 2020). You do not need any other software from Rotrics to use this program.

# Requirements
Before loading this project, you need to install this ComPort Library:
https://github.com/CWBudde/ComPort-Library

# Executable file
There is an executable file in ./Win32/Release/rotrics_calc.exe.
This executable should run without compiling and building the source code, however, you cannot change the location of the calculator buttons as described below. That means, unless you have the exactly same calculator as mine, you will not able to use the calculator feature in practical way. Other features should work fine though. 

# How to build and run
After loading the project file (rotrics_calc.dproj), just click "run (F9)" button or from the main manu "RUN"->"RUN".

# How to use
Click "Com Port Settings" button and specify the correct port number. You don't need to change any other parameters. Then click "Connect to Rotrics" button. If the name of the button is changed to "Disconnect", that means your Rotrics DexArm is connected to the program. Try clicking "Request Current Position" button and see if it returns the location strings. If it works, then use the jog button to move the arm to the desired work origin. When you arrived to the position you want to make it as the work origin, then click "Set Work Origin" button. Now try clicking "Go to X0 Y0 Z10" and make sure the arm is lifted by 7mm.

# Using the command terminal
Type in a G-Code to the text box right next to the "Send" button and click "Send". You should receive a response from the Rotrics in the text memo box at the top left.

# Using calculator
Before using the calculator, you will need to get the location of each button of the real calcurator that you want to use. In my case, I set the "5" button down position as the work origin. You need to modify the FLocations.add lines in the initCalc procedure. It should be self descriptive, so I don't write the detail here.

# License
This source code is provided under MIT license. Please feel free to copy, modify, re-distribute anyway you want.

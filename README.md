# alamofire_onejump_tutorial
Quick tutorial of installing alamofire/HTTP requests in swift for the onejump team. 

# Installing Alamofire
Installing alamofire can be done easily using cocoapods or carthage. Info about how to install is also in the alamofire github link:
https://github.com/Alamofire/Alamofire

## Installing with cocoapods
First, run 
```
$ gem install cocoapods
```
to make sure you have cocoapods on your computer. 
Then, create a podfile in your project by using
``` $ vim Podfile```
Then, paste
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 4.5'
end
```
in your podfile. 

Then, run 
```pod install``` 
from your project directory. 

## Installing with Carthage
First, you need to install Carthage on your computer. To do this on a mac, first install homebrew at https://brew.sh/.
After you have installed homebrew, run
``` 
$ brew update
$ brew install carthage
```
on the command line.

Once this is done, make a Carthage file in your project by running 
``` 
$ vim Cartfile
```
in your project directory. Then, paste
```github "Alamofire/Alamofire" ~> 4.5```
into your Cartfile.
After this, run ```carthage update``` in your project directory (this could take a while) to build the framework,
and drag the built Alamofire.framework into your Xcode project. 

### Linking Alamofire
The last step is to go to the 'general' tab of your xcode project,
and add "Alamofire.framework" to your linked Frameworks and Libraries, and
the Alamofire executable in the "Alamofire.framework" in the Enbedded Binaries of your project.
This links the framework and adds the executable so it can be run in your project. 



Once you've installed alamofire, you should be able to add "import Alamofire" into your swift code without recieving any error messages. 


# Navigating the project
All of the relevant code for Alamofire HTTP requests is in ViewController.swift- try commenting/uncommenting the functions
in the viewDidLoad() function to see how they work/ what they do. 


# Useful info for the Onejump team
A lot of the useful info about the HTTP requests for the onejump app should be in OneJump_HTTPRequestInfo.txt.

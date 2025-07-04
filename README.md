# iOS-Gesture-Classifier-using-CoreML-with-TouchDesigner
An example application using CoreML on iOS with TouchDesigner.    

## Journal Article
Lee, G., & Kim, J. (2025). An Interactive System Using Gesture Recognition for Multimedia Performance. *Journal of Digital Contents Society*, 26(1), 61-68.

## How to build
Open Gesture Classifier.xcworkspace.   
Open Predictor.swift.
Set the idAddress of you computer and the port.    
```swift
var ipAddress = "172.20.10.8"
var port = 8800
```
Connect any iOS device.    
Build it.    

## In TouchDesigner
Open Gesture Classifier.toe.   
Click the OSC In CHOP.   
Set the port.

![Untitled_2](https://user-images.githubusercontent.com/79373845/212025846-75549a22-67c2-4d15-8057-f77700aa6972.gif)

## Gesture classification by models
| Model 1 | Model 2 | Model 3 |
|:--------|:--------|:--------|
|raise both hands to the side <br/> raise the left hand to the side <br/> raise the right hand to the side <br/> raise the left hand forward <br/> raise the right hand forward <br/> no movement|raise the left hand to the side <br/> raise the right hand to the side <br/> raise the left hand forward <br/> raise the right hand forward <br/> no movement<br/><br/>| raise both hands to the side <br/> raise the left hand to the side <br/> raise the right hand to the side <br/> no movement<br/><br/><br/>|

## Accuracy graphs by models
##### Model 1    
<img width="816" alt="Gesture Classifier Graph 1" src="https://user-images.githubusercontent.com/79373845/212022580-656fd4c1-0194-4c84-8bb1-929c4dd9e22f.png">

##### Model 2  
<img width="816" alt="Gesture Classifier Graph 2" src="https://user-images.githubusercontent.com/79373845/212022601-b7754bb9-0f0a-459b-a54d-6ef2e19157c3.png">

##### Model 3    
<img width="816" alt="Gesture Classifier Graph 3" src="https://user-images.githubusercontent.com/79373845/212022614-87772e1a-28cb-426a-a07d-385dd00cf185.png">


This application contains copyrighted software under MIT License.     
SwiftOSC - Copyright (c) 2017 Devin Roth

//
//  ViewController.swift
//  Gesture Classifier
//
//  Created by Gwangyu Lee on 2/16/22.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let videoCapture = VideoCapture()
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var pointsLayer = CAShapeLayer()
    
//    var isLeftDetected = false
//    var isLeftOsc = "0"
//    var isRightDetected = false
//    var isRightOsc = "0"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupVideoPreview()
        
        videoCapture.predictor.delegate = self
        

    }
    
    private func setupVideoPreview() {
        
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        
        guard let previewLayer = previewLayer else { return }
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        pointsLayer.strokeColor = UIColor.green.cgColor
    }
    
//    func oscSend(_ oscPattern: String, _ oscMessage: Double) {
//        let client = OSCClient(address: ipAddress, port: port)
//        let message = OSCMessage(OSCAddressPattern(oscPattern), oscMessage)
//        client.send(message)
//    }
    
}

extension ViewController: PredictorDelegate {
    
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        
//        if action == "Left_Side_Up_Down" && confidence > 0.9 && isLeftDetected == false {
//
//            isLeftDetected = true
//            isLeftOsc = "1"
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                self.isLeftDetected = false
//                self.isLeftOsc = "0"
//            }
//
//            print("Left Detected")
//            oscSend("/left", isLeftOsc)
//        }
        
    }
    
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer = previewLayer else { return }
        
        let convertedPoints = points.map {
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints {
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            combinedPath.addPath(dotPath.cgPath)
        }
        
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
    }
    
}

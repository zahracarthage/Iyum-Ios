//
//  QrViewController.swift
//  miniprojet
//
//  Created by daly on 11/4/2022.
//

import UIKit
import AVFoundation
class QrViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate  {
    @IBOutlet var videoPreview: UIView!
    var stringURL = String()
    enum  error: Error {
    case noCameraAvailable
    case videoInputInitFail
    
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try scanQrCode()
        } catch {
            print("Failed to scan the QR/Barcode.")
        }
    }
    func captureOutput(_ captureOutput : AVCaptureOutput!,didOutputMetadataObjects metadataObjects:[Any]!, from connection : AVCaptureConnection!){
        
        if metadataObjects.count > 0{
            let machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if machineReadableCode.type == AVMetadataObject.ObjectType.qr{
                stringURL = machineReadableCode.stringValue!
                performSegue(withIdentifier: "openLink", sender: self)
            }
        }
    }
    func scanQrCode() throws {
        let avCaptureSession = AVCaptureSession()
        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else{
            print("no camera")
            throw error.noCameraAvailable
        }
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else{
            print("failed to init camera")
            throw error.videoInputInitFail
        }
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        let avCaptureVideoPreviewLayer =  AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPreviewLayer.frame = videoPreview.bounds
        self.videoPreview.layer.addSublayer(avCaptureVideoPreviewLayer)
        avCaptureSession.startRunning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openLink"{
            let destination = segue.destination as! WebViewController
            destination.url = URL(string : stringURL)
        }
    }
            
}


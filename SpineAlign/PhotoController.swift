import UIKit
import AVFoundation

class PhotoController: UIViewController {
    
   
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var takePhotoButton: UIButton!
    
    var captureSession = AVCaptureSession()
    var sessionOutput = AVCaptureStillImageOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    override func viewWillAppear(_ animated: Bool) {
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for device in devices {
            if device.position == AVCaptureDevice.Position.back{
                
                do{
                    let input = try AVCaptureDeviceInput(device: device as! AVCaptureDevice)
                    
                    if captureSession.canAddInput(input){
                        
                        captureSession.addInput(input)
                        sessionOutput.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
                        
                        if captureSession.canAddOutput(sessionOutput){
                            captureSession.addOutput(sessionOutput)
                            captureSession.startRunning()
                            
                            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                            previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                            cameraView.layer.addSublayer(previewLayer)
                            
                            previewLayer.position = CGPoint(x: self.cameraView.frame.width / 2, y: self.cameraView.frame.height / 2)
                            previewLayer.bounds = cameraView.frame
                        }
                    }
                }
                catch {
                    print("Error")
                }
                
            }
        }
        
    }
    
    
    @IBAction func takePhotoButton(_ sender: Any) {
        print("Take Photo Button was Pressed")
        
        if let videoConnection = sessionOutput.connection(with: AVMediaType.video){
            sessionOutput.captureStillImageAsynchronously(from: videoConnection, completionHandler: { buffer, error in
                
                let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer!)
                
                UIImageWriteToSavedPhotosAlbum(UIImage(data: imageData!)!, nil, nil, nil)
                
                let imageOut = UIImage(data: imageData!)
                UserDefaults.standard.setValue(12, forKey: "picDifference")
                //let imageAnalysis = OpenCVWrapper.imageProcessing(imageOut!)
                //7-20: Mild
                //0 - 7:
                //20-40: Moderate
                //40+: Severe
                
                //Composite Scores:
                //20 - 30: Mild
                //0 - 19: None
                //31 - 48: Moderate
                let angleS = UserDefaults.standard.string(forKey: "maxAngle")!
                
                print(angleS)
                let error = angle + standard.value(forKey: "picDifference")!
                //print(error)
                let angle = (angleS as NSString).integerValue
                print(error)

                
            
                if(error <= 19){
                    UserDefaults.standard.setValue("None", forKey: "Condition")
                    print("None")

                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Normal") as! ResultController
                    self.present(vc, animated: true, completion: nil)
                    
                }
                    
                else if (error <= 30){
                    UserDefaults.standard.setValue("Mild", forKey: "Condition")
                    print("Mild")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Mild") as! MildController
                    self.present(vc, animated: true, completion: nil)
                    
                
                }
                    
                else if(error <= 48){
                    UserDefaults.standard.setValue("Moderate", forKey: "picDifference")
                    print("Moderate")

                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Moderate") as! ModerateController
                    self.present(vc, animated: true, completion: nil)
                }
                else {
                    UserDefaults.standard.setValue("Severe", forKey: "picDifference")
                    print("Severe")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Severe") as! SevereController
                    self.present(vc, animated: true, completion: nil)
                }
 
                
            })
        }
    }
    
    
}

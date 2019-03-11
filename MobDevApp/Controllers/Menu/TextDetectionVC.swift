import UIKit
import MobileCoreServices

class TextDetectionVC: UIViewController{
    
    let imagePickerController: UIImagePickerController = UIImagePickerController()
    
    @IBOutlet weak var image: UIImageView!
    var dishes : [String] = ScaledElementProcessor.shared.Detectedtext
    let processor = ScaledElementProcessor()
    var frameSublayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  CaptureImgfromCam()
        imagePickerController.delegate = self
        
        image.layer.addSublayer(frameSublayer)
        
        drawFeatures(in: image)
    }
    
    
    private func drawFeatures( in imageView: UIImageView, completion: (() -> Void)? = nil) {
        // drawwing frames on text
        removeFrames()
        processor.process(in: imageView) { text, elements in
            elements.forEach() { element in
                self.frameSublayer.addSublayer(element.shapeLayer)
                self.dishes.append(text)
            }
            
            completion?()
        }
    }
    
    private func removeFrames() {
        guard let sublayers = frameSublayer.sublayers else { return }
        for sublayer in sublayers {
            sublayer.removeFromSuperlayer()
        }
    }

    @IBAction func cameraBtnPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        { imagePickerController.sourceType = .camera
          present(imagePickerController, animated: true, completion: nil)
            // recognizeText(with: image.image!)
            
        } else{
            let alert = UIAlertController(title: "Camera Not Available", message: "A camera is not available. Please try picking an image from the image library instead.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func galeryBtnPressed(_ sender: Any) {
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func seeDetails(_ sender: Any) {
     let menuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
      self.navigationController?.pushViewController(menuVC, animated: true)
}
}


//MARK:- UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension TextDetectionVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate {
    // MARK: UIImagePickerController
    
    private func presentImagePickerController(withSourceType sourceType: UIImagePickerController.SourceType) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = sourceType
        controller.mediaTypes = [String(kUTTypeImage), String(kUTTypeMovie)]
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerController Delegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image.contentMode = .scaleAspectFit
            let fixedImage = pickedImage.fixOrientation()
            image.image = fixedImage
            drawFeatures(in: image)
                    }
        dismiss(animated: true, completion: nil)
    }
}


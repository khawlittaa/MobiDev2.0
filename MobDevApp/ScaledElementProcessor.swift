import Foundation
import Firebase

struct ScaledElement {
    let frame: CGRect
    let shapeLayer: CALayer
}
class ScaledElementProcessor {
    
    static let shared = ScaledElementProcessor()
    var Detectedtext: [String] = []
    let vision = Vision.vision()
    var textRecognizer: VisionTextRecognizer!
    
    init() {
        textRecognizer = vision.onDeviceTextRecognizer()
    }
    
    // processing the Vision UIimage
    func process(
        in imageView: UIImageView,
        callback: @escaping (_ text: String, _ scaledElements: [ScaledElement]) -> Void
        ) {
        guard let image = imageView.image else { return }
        let visionImage = VisionImage(image: image)
        
        textRecognizer.process(visionImage) { result, error in
            guard
                error == nil,
                let result = result,
                !result.text.isEmpty
                else {
                    callback("", [])
                    return
            }
            
            // ini scaled elemts table
            var scaledElements: [ScaledElement] = []
            // text deetcted from vision image
            for block in result.blocks {
                for line in block.lines {
                    // send them to menu list
                    self.Detectedtext.append(line.text)
                    for element in line.elements {
                        // creates a scaled frame, which the code uses to create the correctly position shape layer
                        let frame = self.createScaledFrame(
                            featureFrame: element.frame,
                            imageSize: image.size,
                            viewFrame: imageView.frame)
                        
                        let shapeLayer = self.createShapeLayer(frame: frame)
                        let scaledElement = ScaledElement(frame: frame, shapeLayer: shapeLayer)
                        /// adding word to scaled elements
                        scaledElements.append(scaledElement)                  }
                }
            }
            callback(result.text, scaledElements)
        }
    }
    
    
    private func createShapeLayer(frame: CGRect) -> CAShapeLayer {
        // setting shape's layer path
        let bpath = UIBezierPath(rect: frame)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bpath.cgPath
        
        shapeLayer.strokeColor = Constants.lineColor
        shapeLayer.fillColor = Constants.fillColor
        shapeLayer.lineWidth = Constants.lineWidth
        return shapeLayer
    }
    
    // MARK: - private
    
    private enum Constants {
        static let lineWidth: CGFloat = 3.0
        static let lineColor = UIColor.white.cgColor
        static let fillColor = UIColor.clear.cgColor
    }
    
    // resize image so the frames  fit the img on view
    private func createScaledFrame(featureFrame: CGRect, imageSize: CGSize, viewFrame: CGRect)-> CGRect {
        
            let viewSize = viewFrame.size
            // rezolution calc
            let resolutionView = viewSize.width / viewSize.height
            let resolutionImage = imageSize.width / imageSize.height
            // scale calc
            var scale: CGFloat
            if resolutionView > resolutionImage {
                scale = viewSize.height / imageSize.height
            } else {
                scale = viewSize.width / imageSize.width
            }
            //scalling img
            let featureWidthScaled = featureFrame.size.width * scale
            let featureHeightScaled = featureFrame.size.height * scale
            // scalling original frame
            let imageWidthScaled = imageSize.width * scale
            let imageHeightScaled = imageSize.height * scale
            let imagePointXScaled = (viewSize.width - imageWidthScaled) / 2
            let imagePointYScaled = (viewSize.height - imageHeightScaled) / 2
            // new X and Y
            let featurePointXScaled = imagePointXScaled + featureFrame.origin.x * scale
            let featurePointYScaled = imagePointYScaled + featureFrame.origin.y * scale
            // A scaled CGRect is returned, configured with calculated origin and size
            return CGRect(x: featurePointXScaled,
                          y: featurePointYScaled,
                          width: featureWidthScaled,
                          height: featureHeightScaled)
    }
    
    
    
}

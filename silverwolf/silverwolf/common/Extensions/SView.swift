//
//  SView.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit

@IBDesignable
class SView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return UIColor.lightGray
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        set {
            layer.shadowRadius = newValue
        }
        get{
            return layer.shadowRadius
        }
    }
    @IBInspectable var shadowColors : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, shadowRadius: CGFloat = 1, scale: Bool = true, cornerRadius: CGFloat) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offSet
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    @IBInspectable
    var TopRightLeftCornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
        get {
            return layer.cornerRadius
        }
    }
    
}


//extension UIView {
//    func createDottedLine(width: CGFloat, color: CGColor) {
//        let caShapeLayer = CAShapeLayer()
//        caShapeLayer.strokeColor = color
//        caShapeLayer.lineWidth = width
//        caShapeLayer.lineDashPattern = [2,3]
//        let cgPath = CGMutablePath()
//        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
//        cgPath.addLines(between: cgPoint)
//        caShapeLayer.path = cgPath
//        layer.addSublayer(caShapeLayer)
//    }
//    
//    func applyCircleShadow(shadowRadius: CGFloat = 2,
//                           shadowOpacity: Float = 0.3,
//                           shadowColor: CGColor = UIColor.black.cgColor,
//                           shadowOffset: CGSize = CGSize.zero,
//                           cornerRadius: CGFloat) {
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor
//        layer.shadowOffset = shadowOffset
//        layer.shadowRadius = shadowRadius
//        layer.shadowOpacity = shadowOpacity
//    }
//}

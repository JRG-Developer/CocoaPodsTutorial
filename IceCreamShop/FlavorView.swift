//
//  FlavorView.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@IBDesignable

class FlavorView: UIView {
 
  // MARK: Outlets
  
  @IBInspectable var topColor: UIColor = UIColor(hexString: "FFCFCF")
  @IBInspectable var bottomColor: UIColor = UIColor(hexString: "FF7070")
  
  // MARK: View Lifecycle
  
  override func drawRect(rect: CGRect) {
    
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    
    //// Gradient Declarations
    let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [topColor.CGColor, bottomColor.CGColor], [0, 1])
    
    // Flavor Drawing
    var flavorPath = UIBezierPath(ovalInRect: rect)

    CGContextSaveGState(context)
    flavorPath.addClip()
    
    let startPoint = CGPointMake(rect.midX, rect.minY)
    let endPoint = CGPointMake(rect.midX, rect.maxY)
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0)
    CGContextRestoreGState(context)    
  }
}

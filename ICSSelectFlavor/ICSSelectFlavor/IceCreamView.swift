//
//  IceCreamView.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@IBDesignable

public class IceCreamView: UIView {
  
  // MARK: Variables
  
  @IBInspectable var topColor: UIColor = RGB(251, 248, 236) {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var bottomColor: UIColor = RGB(230, 215, 171) {
    didSet {
      setNeedsDisplay()
    }
  }
  
  private let coneOuterColor = RGB(184, 104, 50)
  private let coneInnerColor = RGB(209, 160, 102)
  private let coneLaticeColor = RGB(235, 183, 131)
  
  // MARK: View Lifecycle
  
  public override func drawRect(frame: CGRect) {

    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    
    //// Gradient Declarations
    let iceCreamGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [topColor.CGColor, bottomColor.CGColor], [0, 1])
    
    //// Shadow Declarations
    let coneInnerShadow = coneOuterColor
    let coneInnerShadowOffset = CGSizeMake(0.1, -0.1)
    let coneInnerShadowBlurRadius: CGFloat = 25
    
    //// Ice Cream Drawing
    let iceCreamRect = CGRectMake(frame.minX + floor(frame.width * 0.00000 + 0.5), frame.minY + floor(frame.height * 0.00000 + 0.5), floor(frame.width * 1.00000 + 0.5) - floor(frame.width * 0.00000 + 0.5), floor(frame.height * 0.50000 + 0.5) - floor(frame.height * 0.00000 + 0.5))
    var iceCreamPath = UIBezierPath(ovalInRect: iceCreamRect)
    CGContextSaveGState(context)
    iceCreamPath.addClip()
    CGContextDrawLinearGradient(context, iceCreamGradient,
      CGPointMake(iceCreamRect.midX, iceCreamRect.minY),
      CGPointMake(iceCreamRect.midX, iceCreamRect.maxY),
      0)
    CGContextRestoreGState(context)
    
    //// Cone Drawing
    var conePath = UIBezierPath()
    conePath.moveToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.30000 * frame.height))
    conePath.addCurveToPoint(CGPointMake(frame.minX + 0.49000 * frame.width, frame.minY + 0.35874 * frame.height), controlPoint1: CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.30000 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.73301 * frame.width, frame.minY + 0.35874 * frame.height))
    conePath.addCurveToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.30000 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.24699 * frame.width, frame.minY + 0.35874 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.30000 * frame.height))
    conePath.addLineToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 1.00000 * frame.height))
    conePath.addLineToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.30000 * frame.height))
    conePath.closePath()
    conePath.lineJoinStyle = kCGLineJoinRound;
    
    coneInnerColor.setFill()
    conePath.fill()
    
    ////// Cone Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, conePath.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha((coneInnerShadow as UIColor).CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let coneOpaqueShadow = (coneInnerShadow as UIColor).colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, coneInnerShadowOffset, coneInnerShadowBlurRadius, (coneOpaqueShadow as UIColor).CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    coneOpaqueShadow.setFill()
    conePath.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    
    //// Lattice 1 Drawing
    var lattice1Path = UIBezierPath()
    lattice1Path.moveToPoint(CGPointMake(frame.minX + 0.41500 * frame.width, frame.minY + 0.87250 * frame.height))
    lattice1Path.addCurveToPoint(CGPointMake(frame.minX + 0.64500 * frame.width, frame.minY + 0.79250 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.63500 * frame.width, frame.minY + 0.79750 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.64500 * frame.width, frame.minY + 0.79250 * frame.height))
    coneLaticeColor.setStroke()
    lattice1Path.lineWidth = 1
    lattice1Path.stroke()
    
    
    //// Lattice 2 Drawing
    var lattice2Path = UIBezierPath()
    lattice2Path.moveToPoint(CGPointMake(frame.minX + 0.34500 * frame.width, frame.minY + 0.77750 * frame.height))
    lattice2Path.addLineToPoint(CGPointMake(frame.minX + 0.74500 * frame.width, frame.minY + 0.65250 * frame.height))
    coneLaticeColor.setStroke()
    lattice2Path.lineWidth = 1
    lattice2Path.stroke()
    
    
    //// Lattice 3 Drawing
    var lattice3Path = UIBezierPath()
    lattice3Path.moveToPoint(CGPointMake(frame.minX + 0.27500 * frame.width, frame.minY + 0.67750 * frame.height))
    lattice3Path.addLineToPoint(CGPointMake(frame.minX + 0.84500 * frame.width, frame.minY + 0.51250 * frame.height))
    coneLaticeColor.setStroke()
    lattice3Path.lineWidth = 1
    lattice3Path.stroke()
    
    
    //// Lattice 4 Drawing
    var lattice4Path = UIBezierPath()
    lattice4Path.moveToPoint(CGPointMake(frame.minX + 0.20500 * frame.width, frame.minY + 0.57750 * frame.height))
    lattice4Path.addLineToPoint(CGPointMake(frame.minX + 0.94500 * frame.width, frame.minY + 0.36750 * frame.height))
    coneLaticeColor.setStroke()
    lattice4Path.lineWidth = 1
    lattice4Path.stroke()
    
    
    //// Lattice 5 Drawing
    var lattice5Path = UIBezierPath()
    lattice5Path.moveToPoint(CGPointMake(frame.minX + 0.13500 * frame.width, frame.minY + 0.47250 * frame.height))
    lattice5Path.addLineToPoint(CGPointMake(frame.minX + 0.53500 * frame.width, frame.minY + 0.36250 * frame.height))
    coneLaticeColor.setStroke()
    lattice5Path.lineWidth = 1
    lattice5Path.stroke()
    
    
    //// Lattice 6 Drawing
    var lattice6Path = UIBezierPath()
    lattice6Path.moveToPoint(CGPointMake(frame.minX + 0.06500 * frame.width, frame.minY + 0.37750 * frame.height))
    lattice6Path.addLineToPoint(CGPointMake(frame.minX + 0.19500 * frame.width, frame.minY + 0.33750 * frame.height))
    coneLaticeColor.setStroke()
    lattice6Path.lineWidth = 1
    lattice6Path.stroke()
    
    
    //// Lattice 7 Drawing
    var lattice7Path = UIBezierPath()
    coneLaticeColor.setStroke()
    lattice7Path.lineWidth = 1
    lattice7Path.stroke()
    
    
    //// Lattice 8 Drawing
    var lattice8Path = UIBezierPath()
    UIColor.blackColor().setStroke()
    lattice8Path.lineWidth = 1
    lattice8Path.stroke()
    
    
    //// Lattice 9 Drawing
    var lattice9Path = UIBezierPath()
    lattice9Path.moveToPoint(CGPointMake(frame.minX + 0.65000 * frame.width, frame.minY + 0.77500 * frame.height))
    lattice9Path.addLineToPoint(CGPointMake(frame.minX + 0.25000 * frame.width, frame.minY + 0.65000 * frame.height))
    coneLaticeColor.setStroke()
    lattice9Path.lineWidth = 1
    lattice9Path.stroke()
    
    
    //// Lattice 10 Drawing
    var lattice10Path = UIBezierPath()
    lattice10Path.moveToPoint(CGPointMake(frame.minX + 0.72000 * frame.width, frame.minY + 0.67500 * frame.height))
    lattice10Path.addLineToPoint(CGPointMake(frame.minX + 0.15000 * frame.width, frame.minY + 0.51000 * frame.height))
    coneLaticeColor.setStroke()
    lattice10Path.lineWidth = 1
    lattice10Path.stroke()
    
    
    //// Lattice 11 Drawing
    var lattice11Path = UIBezierPath()
    lattice11Path.moveToPoint(CGPointMake(frame.minX + 0.79000 * frame.width, frame.minY + 0.57500 * frame.height))
    lattice11Path.addLineToPoint(CGPointMake(frame.minX + 0.05000 * frame.width, frame.minY + 0.36500 * frame.height))
    coneLaticeColor.setStroke()
    lattice11Path.lineWidth = 1
    lattice11Path.stroke()
    
    
    //// Lattice 12 Drawing
    var lattice12Path = UIBezierPath()
    lattice12Path.moveToPoint(CGPointMake(frame.minX + 0.86000 * frame.width, frame.minY + 0.47000 * frame.height))
    lattice12Path.addLineToPoint(CGPointMake(frame.minX + 0.46000 * frame.width, frame.minY + 0.36000 * frame.height))
    coneLaticeColor.setStroke()
    lattice12Path.lineWidth = 1
    lattice12Path.stroke()
    
    
    //// Lattice 13 Drawing
    var lattice13Path = UIBezierPath()
    lattice13Path.moveToPoint(CGPointMake(frame.minX + 0.93000 * frame.width, frame.minY + 0.37500 * frame.height))
    lattice13Path.addLineToPoint(CGPointMake(frame.minX + 0.80000 * frame.width, frame.minY + 0.33500 * frame.height))
    coneLaticeColor.setStroke()
    lattice13Path.lineWidth = 1
    lattice13Path.stroke()
    
    
    //// Lattice 14 Drawing
    var lattice14Path = UIBezierPath()
    lattice14Path.moveToPoint(CGPointMake(frame.minX + 0.59000 * frame.width, frame.minY + 0.87000 * frame.height))
    lattice14Path.addCurveToPoint(CGPointMake(frame.minX + 0.35500 * frame.width, frame.minY + 0.79250 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.37000 * frame.width, frame.minY + 0.79500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.35500 * frame.width, frame.minY + 0.79250 * frame.height))
    coneLaticeColor.setStroke()
    lattice14Path.lineWidth = 1
    lattice14Path.stroke()
  }
}

extension IceCreamView: FlavorAdapter {
  
  public func updateWithFlavor(flavor: Flavor) {
    
    self.topColor = flavor.topColor
    self.bottomColor = flavor.bottomColor
    setNeedsDisplay()
  }
}

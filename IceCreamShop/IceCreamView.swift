//
//  IceCreamView.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@IBDesignable

class IceCreamView: UIView {
  
  // MARK: Variables
  
  @IBInspectable var topColor: UIColor = UIColor(hexString: "FFCFCF")
  @IBInspectable var bottomColor: UIColor = UIColor(hexString: "FF7070")
  
  private let coneOuterColor = UIColor(hexString: "B86832")
  private let coneInnerColor = UIColor(hexString: "D1A066")
  private let coneLaticeColor = UIColor(hexString: "EBB783")
  
  // MARK: View Lifecycle
  
  override func drawRect(frame: CGRect) {

    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    
    //// Gradient Declarations
    let iceCreamGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [topColor.CGColor, bottomColor.CGColor], [0, 1])
    
    //// Shadow Declarations
    let coneInnerShadow = coneOuterColor
    let coneInnerShadowOffset = CGSizeMake(0.1, -0.1)
    let coneInnerShadowBlurRadius: CGFloat = 25
    
    //// iceCream Drawing
    let iceCreamRect = CGRectMake(frame.minX + floor(frame.width * 0.08333 + 0.5), frame.minY + floor(frame.height * 0.08696 + 0.5), floor(frame.width * 0.91667 + 0.5) - floor(frame.width * 0.08333 + 0.5), floor(frame.height * 0.52174 + 0.5) - floor(frame.height * 0.08696 + 0.5))
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
    conePath.moveToPoint(CGPointMake(frame.minX + 0.91667 * frame.width, frame.minY + 0.34783 * frame.height))
    conePath.addCurveToPoint(CGPointMake(frame.minX + 0.49167 * frame.width, frame.minY + 0.39891 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.91667 * frame.width, frame.minY + 0.34783 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.69417 * frame.width, frame.minY + 0.39891 * frame.height))
    conePath.addCurveToPoint(CGPointMake(frame.minX + 0.08333 * frame.width, frame.minY + 0.34783 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.28916 * frame.width, frame.minY + 0.39891 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.08333 * frame.width, frame.minY + 0.34783 * frame.height))
    conePath.addLineToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 0.95652 * frame.height))
    conePath.addLineToPoint(CGPointMake(frame.minX + 0.91667 * frame.width, frame.minY + 0.34783 * frame.height))
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
    
    //// Bezier 2 Drawing
    var bezier2Path = UIBezierPath()
    bezier2Path.moveToPoint(CGPointMake(frame.minX + 0.37083 * frame.width, frame.minY + 0.76304 * frame.height))
    bezier2Path.addLineToPoint(CGPointMake(frame.minX + 0.70417 * frame.width, frame.minY + 0.65435 * frame.height))
    coneLaticeColor.setStroke()
    bezier2Path.lineWidth = 1
    bezier2Path.stroke()
    
    //// Bezier 3 Drawing
    var bezier3Path = UIBezierPath()
    bezier3Path.moveToPoint(CGPointMake(frame.minX + 0.31250 * frame.width, frame.minY + 0.67609 * frame.height))
    bezier3Path.addLineToPoint(CGPointMake(frame.minX + 0.78750 * frame.width, frame.minY + 0.53261 * frame.height))
    coneLaticeColor.setStroke()
    bezier3Path.lineWidth = 1
    bezier3Path.stroke()
    
    //// Bezier 4 Drawing
    var bezier4Path = UIBezierPath()
    bezier4Path.moveToPoint(CGPointMake(frame.minX + 0.25417 * frame.width, frame.minY + 0.58913 * frame.height))
    bezier4Path.addLineToPoint(CGPointMake(frame.minX + 0.87083 * frame.width, frame.minY + 0.40652 * frame.height))
    coneLaticeColor.setStroke()
    bezier4Path.lineWidth = 1
    bezier4Path.stroke()
    
    //// Bezier 5 Drawing
    var bezier5Path = UIBezierPath()
    bezier5Path.moveToPoint(CGPointMake(frame.minX + 0.19583 * frame.width, frame.minY + 0.49783 * frame.height))
    bezier5Path.addLineToPoint(CGPointMake(frame.minX + 0.52917 * frame.width, frame.minY + 0.40217 * frame.height))
    coneLaticeColor.setStroke()
    bezier5Path.lineWidth = 1
    bezier5Path.stroke()
    
    //// Bezier 6 Drawing
    var bezier6Path = UIBezierPath()
    bezier6Path.moveToPoint(CGPointMake(frame.minX + 0.13750 * frame.width, frame.minY + 0.41522 * frame.height))
    bezier6Path.addLineToPoint(CGPointMake(frame.minX + 0.24583 * frame.width, frame.minY + 0.38043 * frame.height))
    coneLaticeColor.setStroke()
    bezier6Path.lineWidth = 1
    bezier6Path.stroke()
    
    //// Bezier 7 Drawing
    var bezier7Path = UIBezierPath()
    coneLaticeColor.setStroke()
    bezier7Path.lineWidth = 1
    bezier7Path.stroke()
    
    //// Bezier Drawing
    var bezierPath = UIBezierPath()
    bezierPath.moveToPoint(CGPointMake(frame.minX + 0.42917 * frame.width, frame.minY + 0.84565 * frame.height))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.62083 * frame.width, frame.minY + 0.77609 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.61250 * frame.width, frame.minY + 0.78043 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.62083 * frame.width, frame.minY + 0.77609 * frame.height))
    coneLaticeColor.setStroke()
    bezierPath.lineWidth = 1
    bezierPath.stroke()
    
    //// Bezier 8 Drawing
    var bezier8Path = UIBezierPath()
    UIColor.blackColor().setStroke()
    bezier8Path.lineWidth = 1
    bezier8Path.stroke()
    
    //// Bezier 9 Drawing
    var bezier9Path = UIBezierPath()
    bezier9Path.moveToPoint(CGPointMake(frame.minX + 0.62500 * frame.width, frame.minY + 0.76087 * frame.height))
    bezier9Path.addLineToPoint(CGPointMake(frame.minX + 0.29167 * frame.width, frame.minY + 0.65217 * frame.height))
    coneLaticeColor.setStroke()
    bezier9Path.lineWidth = 1
    bezier9Path.stroke()
    
    //// Bezier 10 Drawing
    var bezier10Path = UIBezierPath()
    bezier10Path.moveToPoint(CGPointMake(frame.minX + 0.68333 * frame.width, frame.minY + 0.67391 * frame.height))
    bezier10Path.addLineToPoint(CGPointMake(frame.minX + 0.20833 * frame.width, frame.minY + 0.53043 * frame.height))
    coneLaticeColor.setStroke()
    bezier10Path.lineWidth = 1
    bezier10Path.stroke()
    
    //// Bezier 11 Drawing
    var bezier11Path = UIBezierPath()
    bezier11Path.moveToPoint(CGPointMake(frame.minX + 0.74167 * frame.width, frame.minY + 0.58696 * frame.height))
    bezier11Path.addLineToPoint(CGPointMake(frame.minX + 0.12500 * frame.width, frame.minY + 0.40435 * frame.height))
    coneLaticeColor.setStroke()
    bezier11Path.lineWidth = 1
    bezier11Path.stroke()
    
    //// Bezier 12 Drawing
    var bezier12Path = UIBezierPath()
    bezier12Path.moveToPoint(CGPointMake(frame.minX + 0.80000 * frame.width, frame.minY + 0.49565 * frame.height))
    bezier12Path.addLineToPoint(CGPointMake(frame.minX + 0.46667 * frame.width, frame.minY + 0.40000 * frame.height))
    coneLaticeColor.setStroke()
    bezier12Path.lineWidth = 1
    bezier12Path.stroke()
    
    //// Bezier 13 Drawing
    var bezier13Path = UIBezierPath()
    bezier13Path.moveToPoint(CGPointMake(frame.minX + 0.85833 * frame.width, frame.minY + 0.41304 * frame.height))
    bezier13Path.addLineToPoint(CGPointMake(frame.minX + 0.75000 * frame.width, frame.minY + 0.37826 * frame.height))
    coneLaticeColor.setStroke()
    bezier13Path.lineWidth = 1
    bezier13Path.stroke()
    
    //// Bezier 14 Drawing
    var bezier14Path = UIBezierPath()
    bezier14Path.moveToPoint(CGPointMake(frame.minX + 0.57500 * frame.width, frame.minY + 0.84348 * frame.height))
    bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 0.37917 * frame.width, frame.minY + 0.77609 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.39167 * frame.width, frame.minY + 0.77826 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.37917 * frame.width, frame.minY + 0.77609 * frame.height))
    coneLaticeColor.setStroke()
    bezier14Path.lineWidth = 1
    bezier14Path.stroke()
  }
}

extension IceCreamView: FlavorAdapter {
  
  func updateWithFlavor(flavor: Flavor) {
    
    self.topColor = flavor.topColor
    self.bottomColor = flavor.bottomColor
    setNeedsDisplay()
  }
}

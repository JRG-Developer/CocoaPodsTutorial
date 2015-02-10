//
//  Flavor.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 1/16/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

struct Flavor {
  
  let name: String
  let topColor: UIColor
  let bottomColor: UIColor
  
  init(name: String, topColor: UIColor, bottomColor: UIColor) {
    self.name = name
    self.topColor = topColor
    self.bottomColor = bottomColor
  }
  
  init?(dictionary: NSDictionary) {
    
    let topColorHex = dictionary["topColorHex"] as String?
    
    if let topColor = UIColor(hexString: topColorHex) {
      self.topColor = topColor
      
    } else {
      return nil
    }
    
    let bottomColorHex = dictionary["bottomColorHex"] as String?
    
    if let bottomColor = UIColor(hexString: bottomColorHex) {
      self.bottomColor = bottomColor
      
    } else {
      return nil
    }
    
    if let name = dictionary["name"] as String? {
      self.name = name
      
    } else {
      return nil
    }

  }
}

protocol FlavorAdapter {
  
  func updateWithFlavor(flavor: Flavor)
}

//
//  FlavorCell.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 1/16/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

class FlavorCell: UICollectionViewCell {

  // MARK: Outlets
  
  @IBOutlet var textLabel: UILabel!
  @IBOutlet var flavorView: FlavorView!
}

// MARK: Flavor Adapter

extension FlavorCell: FlavorAdapter {
  
  func updateWithFlavor(flavor: Flavor) {
    
    flavorView.topColor = flavor.topColor
    flavorView.bottomColor = flavor.bottomColor
    flavorView.setNeedsDisplay()
    
    textLabel.text = flavor.name
  }
}
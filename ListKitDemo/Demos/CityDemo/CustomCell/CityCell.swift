//
//  CustomCell.swift
//  ListKitDemo
//
//  Created by Benjamin Encz on 7/21/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import UIKit
import ListKit

class CityCell: UITableViewCell, TableViewCellProtocol {
  
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!
  
    var model: City? {
      didSet {
        if mainLabel != nil {
          mainLabel.text = model?.name
          subLabel.text = model?.country
          mainImageView.image = model?.image
        }
      }
    }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    mainLabel.text = model?.name
    subLabel.text = model?.country
    mainImageView.image = model?.image
  }

}
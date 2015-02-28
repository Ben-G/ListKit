//
//  ViewController.swift
//  ListKitDemo
//
//  Created by Benjamin Encz on 2/19/15.
//  Copyright (c) 2015 Benjamin Encz. All rights reserved.
//

import UIKit
import ListKit

class CustomTableViewCell: UITableViewCell, TableViewCellProtocol, ObjCTableViewCellProtocol {
  var model:AnyObject? {
    didSet {
      self.textLabel!.text = model as String?
    }
  }
}

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var dataSource: ArrayDataSourceObjC?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let array = ["Yay", "Test", "Nothing"]

    dataSource = ArrayDataSource(array: array, cellType: CustomTableViewCell.self).toObjC()
    
    tableView.dataSource = dataSource
  }

}


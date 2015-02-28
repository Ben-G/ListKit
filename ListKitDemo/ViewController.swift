//
//  ViewController.swift
//  ListKitDemo
//
//  Created by Benjamin Encz on 2/19/15.
//  Copyright (c) 2015 Benjamin Encz. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell, TableViewCellProtocol {
  var model:String? {
    didSet {
      self.textLabel!.text = model
    }
  }
}

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var dataSource: ArrayDataSource<CustomTableViewCell, String>?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let array = ["Yay", "Test", "Nothing"]

    dataSource = ArrayDataSource(array: array, cellType: CustomTableViewCell.self)
    
    tableView.dataSource = dataSource
  }

}


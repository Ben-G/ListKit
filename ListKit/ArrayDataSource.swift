//
//  DataSource.swift
//  ListKitDemo
//
//  Created by Benjamin Encz on 2/19/15.
//  Copyright (c) 2015 Benjamin Encz. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewCellProtocol {
  
  typealias CellModelType
  
  var model: CellModelType {get}
  
  init()
}

public class ArrayDataSource<T where T:TableViewCellProtocol, T:UITableViewCell> : NSObject, UITableViewDataSource {

  private var array: Array<T>
  private var customCellType: T.Type
  
  public init (array:Array<T>) {
    self.customCellType = T.self
    self.array = array
  }
}

extension ArrayDataSource {
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return customCellType()
  }
}





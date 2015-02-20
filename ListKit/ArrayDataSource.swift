//
//  DataSource.swift
//  ListKitDemo
//
//  Created by Benjamin Encz on 2/19/15.
//  Copyright (c) 2015 Benjamin Encz. All rights reserved.
//

import Foundation

public protocol TableViewCellProtocol {
  
  typealias CellModelType
  
  init(model: CellModelType)
}

public class ArrayDataSource<T> : NSObject, UITableViewDataSource {

  private var array: Array<T>
  
  public init <U where U:UITableViewCell, U:TableViewCellProtocol> (array:Array<T>, cellClass: U) {
    self.array = array
//    var cell = cellClass()
  }
}

extension ArrayDataSource {
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}





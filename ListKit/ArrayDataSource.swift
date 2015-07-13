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
  typealias CellType
  
  var model: CellType? {get set}
}

//@objc(ArrayDataSource)
public class ArrayDataSource<U, T where U:TableViewCellProtocol, U:UITableViewCell, T == U.CellType> : NSObject, UITableViewDataSource {

  let cellIdentifier = "arrayDataSourceCell"

  private var array: Array<T>
  
  public init (array:Array<T>, cellType: U.Type) {
    self.array = array
  }
  
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! U?
    
    if let cell = cell {
      cell.model = array[indexPath.row]
    } else {
      cell = U(style: .Default, reuseIdentifier: cellIdentifier)
      cell!.model = array[indexPath.row]
    }
    
    return cell!
  }
  
}



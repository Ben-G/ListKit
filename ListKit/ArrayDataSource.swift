//
//  DataSource.swift
//  ListKitDemo
//
//  Created by Benjamin Encz on 2/19/15.
//  Copyright (c) 2015 Benjamin Encz. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewCellProtocol: ObjCTableViewCellProtocol {
  typealias CellType
  
  var model: CellType? {get set}
}

@objc(ObjCTableViewCellProtocol)
public protocol ObjCTableViewCellProtocol {
  var model: AnyObject? {get set}
}

public class ArrayDataSource<U, T where U:TableViewCellProtocol, U:UITableViewCell, T == U.CellType, T:AnyObject> : NSObject, UITableViewDataSource {

  let cellIdentifier = "arrayDataSourceCell"

  private var array: Array<T>
  
  public init (array:Array<T>, cellType: U.Type) {
    self.array = array
  }
  
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as U?
    
    if let cell = cell {
      cell.model = array[indexPath.row]
    } else {
      cell = U(style: .Default, reuseIdentifier: cellIdentifier)
      cell!.model = array[indexPath.row]
    }
    
    return cell!
  }
  
  public func toObjC() -> ArrayDataSourceObjC {
    return ArrayDataSourceObjC(array: array, cellType: U.self)
  }
}

@objc(ArrayDataSourceObjC)
public class ArrayDataSourceObjC: NSObject, UITableViewDataSource {
  
  let cellIdentifier = "arrayDataSourceCell"
  
  private var array: Array<AnyObject>
  private var cellType: UITableViewCell.Type
  
  public init (array:Array<AnyObject>, cellType: UITableViewCell.Type) {
    self.array = array
    self.cellType = cellType
  }
  
  @objc(tableView:numberOfRowsInSection:)
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }

  @objc(tableView:cellForRowAtIndexPath:)
  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var returnCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
    
    if var cell = returnCell {
      var castCell = cell as ObjCTableViewCellProtocol
      castCell.model = array[indexPath.row]
    } else {
      let cellClass = cellType(style: .Default, reuseIdentifier: cellIdentifier)
      var castCell = cellClass as ObjCTableViewCellProtocol
      castCell.model = array[indexPath.row]
      returnCell = cellClass
    }
    
    return returnCell!
  }
  
}





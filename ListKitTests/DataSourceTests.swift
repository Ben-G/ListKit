//
//  ListKitTests.swift
//  ListKitTests
//
//  Created by Benjamin Encz on 2/19/15.
//  Copyright (c) 2015 Benjamin Encz. All rights reserved.
//

import UIKit
import XCTest
import ListKit

class CustomTableViewCell: UITableViewCell, TableViewCellProtocol {
  var model:String? {
    didSet {
      self.textLabel!.text = model
    }
  }
}

class DataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRowCount() {
      let array = ["Yay", "Test", "Nothing"]
      
      let source = ArrayDataSource(array: array, cellType: CustomTableViewCell.self)
      
      let rows = source.tableView(UITableView(), numberOfRowsInSection: 0)
      XCTAssertEqual(array.count, rows)
    }
  
    func testCell() {
      let array = ["Yay", "Test", "Nothing"]
      let source = ArrayDataSource(array: array, cellType: CustomTableViewCell.self)
      let cell = source.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
      
      XCTAssertEqual(cell.textLabel!.text!, "Yay")
    }
}

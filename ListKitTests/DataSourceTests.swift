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

class CustomTableViewCell <String>: UITableViewCell, TableViewCellProtocol {

  required init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
  
  let string = "String"
  var model:String?
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
      
      let source = ArrayDataSource(array: array) { (T) -> CustomTableViewCell<String> in
        cell.model = T
      }
      
      let rows = source.tableView(UITableView(), numberOfRowsInSection: 0)
      source.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath())
      XCTAssertEqual(array.count, rows)
    }
}

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

class CustomTableViewCell <T>: UITableViewCell, TableViewCellProtocol {
  required init(model: T) {
    super.init()
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
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
      // This is an example of a functional test case.
      let array = ["Yay", "Test", "Nothing"]
      ArrayDataSource(array: array, cellClass: CustomTableViewCell(model: "a"))
//      let source = ArrayDataSource(array: array, cellClass: CustomTableViewCell.self)
//      let rows = source.tableView(UITableView(), numberOfRowsInSection: 0)
//      source.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath())
//      XCTAssertEqual(array.count, rows)
    }
}

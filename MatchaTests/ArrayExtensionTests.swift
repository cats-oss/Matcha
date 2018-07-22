//
//  ArrayExtensionTests.swift
//  MatchaTests
//
//  Created by Kyohei Ito on 2018/07/21.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

import XCTest
@testable import Matcha

class ArrayExtensionTests: XCTestCase {
    func testSafe() {
        let array = [0,1,2,3,4]
        XCTAssertNil(array[safe: -1])
        XCTAssertNil(array[safe: 5])
        XCTAssertNotNil(array[safe: 0])
        XCTAssertNotNil(array[safe: 4])
    }
}

//
//  NSRegularExpressionExtensionTests.swift
//  MatchaTests
//
//  Created by Kyohei Ito on 2018/07/22.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

import XCTest
@testable import Matcha

class NSRegularExpressionExtensionTests: XCTestCase {
    func testFirstMatch() {
        guard let schemeRegex = try? NSRegularExpression(pattern: "[^https?:\\/\\/].+") else { return }
        XCTAssertEqual(schemeRegex.firstMatch(in: "http://example.com")?.range(at: 0), NSRange(location: 7, length: 11))
    }
}

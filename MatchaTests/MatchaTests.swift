//
//  MatchaTests.swift
//  MatchaTests
//
//  Created by Kyohei Ito on 2018/07/21.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

import XCTest
@testable import Matcha

class MatchaTests: XCTestCase {
    func testInit() {
        let url = URL(string: "https://example.com/path/to/glory")!
        let matcha = Matcha(url: url)
        XCTAssertEqual(matcha.url, url)
        XCTAssertNil(matcha.value(at: 0))
        XCTAssertNil(matcha.value(of: "path"))
        XCTAssertNil(matcha[0])
        XCTAssertNil(matcha["path"])

        XCTAssertNil(matcha.matched("https://exampl.com/path/to/glory"))
        XCTAssertNil(matcha.matched("https://example.com/path/to/glory/test/"))
        XCTAssertNil(matcha.matched("https://example.com/path/to/glory/test"))
        XCTAssertNil(matcha.matched("https://example.com/path/to/g"))
        XCTAssertNil(matcha.matched("https://example.com/path/to"))
        XCTAssertNil(matcha.matched("https://example.com/"))
        XCTAssertNil(matcha.matched("https://example.com"))
        XCTAssertNil(matcha.matched("/path/to/g"))
        XCTAssertNil(matcha.matched("/path/to"))
        XCTAssertNil(matcha.matched("/"))
        XCTAssertNil(matcha.matched(""))
        XCTAssertNil(Matcha(url: URL(string: "https://example.com/")!).matched("/path"))
        XCTAssertNil(Matcha(url: URL(string: "https://example.com/")!).matched(""))

        XCTAssertNotNil(matcha.matched("https://example.com/path/to/glory/"))
        XCTAssertNotNil(matcha.matched("https://example.com/path/to/glory"))
        XCTAssertNotNil(matcha.matched("/path/to/glory/"))
        XCTAssertNotNil(matcha.matched("/path/to/glory"))
        XCTAssertNotNil(Matcha(url: URL(string: "https://example.com/")!).matched("/"))
        XCTAssertNotNil(Matcha(url: URL(string: "https://example.com")!).matched("/"))

        let urlPattern = "https://example.com/{A}/{B}/{C}/"
        let urlPatternMatched = matcha.matched(urlPattern)
        XCTAssertEqual(urlPatternMatched?.value(at: 0), "path")
        XCTAssertEqual(urlPatternMatched?.value(of: "A"), "path")
        XCTAssertEqual(urlPatternMatched?[0], "path")
        XCTAssertEqual(urlPatternMatched?["A"], "path")

        XCTAssertEqual(urlPatternMatched?.value(at: 1), "to")
        XCTAssertEqual(urlPatternMatched?.value(of: "B"), "to")
        XCTAssertEqual(urlPatternMatched?[1], "to")
        XCTAssertEqual(urlPatternMatched?["B"], "to")

        XCTAssertEqual(urlPatternMatched?.value(at: 2), "glory")
        XCTAssertEqual(urlPatternMatched?.value(of: "C"), "glory")
        XCTAssertEqual(urlPatternMatched?[2], "glory")
        XCTAssertEqual(urlPatternMatched?["C"], "glory")

        let pathPattern = "/{A}/{B}/{C}/"
        let pathPatternMatched = matcha.matched(pathPattern)
        XCTAssertEqual(pathPatternMatched?.value(at: 0), "path")
        XCTAssertEqual(pathPatternMatched?.value(of: "A"), "path")
        XCTAssertEqual(pathPatternMatched?[0], "path")
        XCTAssertEqual(pathPatternMatched?["A"], "path")

        XCTAssertEqual(pathPatternMatched?.value(at: 1), "to")
        XCTAssertEqual(pathPatternMatched?.value(of: "B"), "to")
        XCTAssertEqual(pathPatternMatched?[1], "to")
        XCTAssertEqual(pathPatternMatched?["B"], "to")

        XCTAssertEqual(pathPatternMatched?.value(at: 2), "glory")
        XCTAssertEqual(pathPatternMatched?.value(of: "C"), "glory")
        XCTAssertEqual(pathPatternMatched?[2], "glory")
        XCTAssertEqual(pathPatternMatched?["C"], "glory")
    }
}

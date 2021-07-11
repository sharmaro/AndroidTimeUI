//
//  AndroidTimeUITests.swift
//  AndroidTimeUITests
//
//  Created by Rohan Sharma on 7/10/21.
//

import XCTest
@testable import AndroidTimeUI

class AndroidTimeUITests: XCTestCase {
    func setUpWith() {}

    func tearDownWith() {}

    func testTime() {
        let t0 = Time(timeString: "1:23", anteMeridiem: .am)
        XCTAssertEqual(t0.h1, "0")
        XCTAssertEqual(t0.h2, "1")
        XCTAssertEqual(t0.m1, "2")
        XCTAssertEqual(t0.m2, "3")
        XCTAssertEqual(t0.s1, "")
        XCTAssertEqual(t0.s2, "")
        XCTAssertEqual(t0.anteMeridiemText, "AM")

        let t1 = Time(timeString: "11:23", anteMeridiem: .am)
        XCTAssertEqual(t1.h1, "1")
        XCTAssertEqual(t1.h2, "1")
        XCTAssertEqual(t1.m1, "2")
        XCTAssertEqual(t1.m2, "3")
        XCTAssertEqual(t1.s1, "")
        XCTAssertEqual(t1.s2, "")
        XCTAssertEqual(t1.anteMeridiemText, "AM")

        let t2 = Time(timeString: "11:45:1", anteMeridiem: .pm)
        XCTAssertEqual(t2.h1, "1")
        XCTAssertEqual(t2.h2, "1")
        XCTAssertEqual(t2.m1, "4")
        XCTAssertEqual(t2.m2, "5")
        XCTAssertEqual(t2.s1, "1")
        XCTAssertEqual(t2.s2, "0")
        XCTAssertEqual(t2.anteMeridiemText, "PM")

        let t3 = Time(timeString: "1:45:12", anteMeridiem: .pm)
        XCTAssertEqual(t3.h1, "0")
        XCTAssertEqual(t3.h2, "1")
        XCTAssertEqual(t3.m1, "4")
        XCTAssertEqual(t3.m2, "5")
        XCTAssertEqual(t3.s1, "1")
        XCTAssertEqual(t3.s2, "2")
        XCTAssertEqual(t3.anteMeridiemText, "PM")
    }
}

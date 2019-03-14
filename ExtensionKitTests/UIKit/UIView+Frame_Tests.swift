//
//  UIView+Frame_Tests.swift
//  ExtensionKitDemoTests
//
//  Created by Victor Marcias on 2019-03-11.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class UIView_Frame_Tests: XCTestCase {
    
    let view1 = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
    let view2 = UIView(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
    let view3 = UIView(frame: .zero)
    
    func testUIViewFrameExtension() {
        view3.x = view2.x - view1.x
        view3.y = view2.y + view1.y
        view3.width = view1.width - view2.width
        view3.height = view1.height + view2.height
        
        XCTAssert(view3.x == 30)
        XCTAssert(view3.y == 130)
        XCTAssert(view3.width == 100)
        XCTAssert(view3.height == 300)
        
        XCTAssert(view3.frame.origin.x == 30)
        XCTAssert(view3.frame.origin.y == 130)
        XCTAssert(view3.frame.size.width == 100)
        XCTAssert(view3.frame.size.height == 300)
        
        // center
        view3.center(on: view2)
        XCTAssert(view3.centerX == 50)
        XCTAssert(view3.centerY == 50)
        XCTAssert(view3.center.x == 50)
        XCTAssert(view3.center.y == 50)
        
        view3.centerX = 40
        XCTAssert(view3.x == (view3.centerX - view3.width/2))
        XCTAssert(view3.x == -10)
        
        // coordinate-style setters
        view3.position = (88, 33)
        XCTAssert(view3.frame.origin.x == 88)
        XCTAssert(view3.frame.origin.y == 33)
        XCTAssert(view3.position.x == 88 && view3.position.y == 33)
        
        view3.size = (160, 90)
        XCTAssert(view3.frame.size.width == 160)
        XCTAssert(view3.frame.size.height == 90)
        XCTAssert(view3.size.w == 160 && view3.size.h == 90)
        
        view3.centerXY = (55, 55)
        XCTAssert(view3.center.x == 55)
        XCTAssert(view3.frame.origin.x == -25)
        XCTAssert(view3.frame.origin.y == 10)
        XCTAssert(view3.centerX == 55 && view3.centerY == 55)
    }
}

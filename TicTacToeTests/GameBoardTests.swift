//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Michael on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

// To access resources from the app
@testable import TicTacToe

// UNIT tests can check in future if assumptions have changed
// They can catch bugs
// They can provide more peace of mind when working in a team

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        var board = GameBoard()
        
//        try! board.place(mark: .o, on: (x: 0, y: 0))
        
//        XCTAssertNil(board[(x: 0, y: 0)])
//        XCTAssertNil(board[(x: 1, y: 0)])
//        XCTAssertNil(board[(x: 2, y: 0)])
//        XCTAssertNil(board[(x: 0, y: 1)])
//        XCTAssertNil(board[(x: 1, y: 1)])
//        XCTAssertNil(board[(x: 2, y: 1)])
//        XCTAssertNil(board[(x: 0, y: 2)])
//        XCTAssertNil(board[(x: 1, y: 2)])
//        XCTAssertNil(board[(x: 2, y: 2)])
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)], "The entry at (\(x),  \(y)) was \(board[(x, y)]) instead of nil")
            }
        }
    }

    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (x: 0, y: 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0, y == 0 { continue }
                if x == 2, y == 2 { continue }
                
                XCTAssertNil(board[(x, y)])
            }
        }
        
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { error in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }
    
    func testIsFull() {
        var board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        
//        try! board.place(mark: .x, on: (0, 0))
//        XCTAssertFalse(board.isFull)
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)
                try! board.place(mark: .x, on: (x, y))
                
            }
        }
        XCTAssertTrue(board.isFull)
    }
}

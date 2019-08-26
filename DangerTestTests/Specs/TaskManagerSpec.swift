//
//  DangerTestTests.swift
//  DangerTestTests
//
//  Created by kaique.magno.santos on 23/08/19.
//  Copyright © 2019 kaique.magno.santos. All rights reserved.
//

import XCTest
@testable import DangerTest

class DangerTestTests: XCTestCase {
    
    let taskManagerMock = TaskManagerMock()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        taskManagerMock.tasks = [Task]()
    }

    func testSaveATask() {
        let date = Date()
        let task = Task(id: "1234", creationDate: date, title: "Testing", isCompleted: false)
        taskManagerMock.save(task: task)
        
        XCTAssert(taskManagerMock.tasks.count > 0)
        XCTAssertEqual(task, taskManagerMock.tasks.first!)
    }
    
    func testDelete() {
        let date = Date()
        let task = Task(id: "1234", creationDate: date, title: "Testing", isCompleted: false)
        taskManagerMock.tasks.append(task)
        
        XCTAssertNoThrow(try taskManagerMock.delete(task: task))
        XCTAssertEqual(0, taskManagerMock.tasks.count)
    }
}

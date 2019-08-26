//
//  TaskManagerMock.swift
//  DangerTestTests
//
//  Created by kaique.magno.santos on 23/08/19.
//  Copyright © 2019 kaique.magno.santos. All rights reserved.
//

import Foundation
@testable import DangerTest

class TaskManagerMock: TaskManager {
    var tasks = [Task]()
    
    override func save(task: Task) {
        tasks.removeAll(where: {$0.id == task.id})
        tasks.append(task)
    }
    
    override func delete(task: Task) throws {
        tasks.removeAll(where: {$0.id == task.id})
    }
    
    override func fetchTasks() -> [Task] {
        return self.tasks
    }
}

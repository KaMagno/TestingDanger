//
//  TaskManager.swift
//  DangerTest
//
//  Created by kaique.magno.santos on 23/08/19.
//  Copyright © 2019 kaique.magno.santos. All rights reserved.
//

import Foundation

class TaskManager {
    
    enum Constants:String {
        case taksUserDefaultKey
    }
    
    enum Errors:Error {
        case taskDoesNotExist
    }
    
    
    func save(task:Task) {
        var tasks = [Task]()
        if let object = UserDefaults.standard.object(forKey: Constants.taksUserDefaultKey.rawValue),
            let usersTasks = object as? [Task]{
            tasks = usersTasks
            UserDefaults.standard.removeObject(forKey: Constants.taksUserDefaultKey.rawValue)
        }
        tasks.removeAll(where: {$0.id == task.id})
        UserDefaults.standard.set(tasks, forKey: Constants.taksUserDefaultKey.rawValue)
    }
    
    func delete(task:Task) throws {
        guard let _ = UserDefaults.standard.object(forKey: Constants.taksUserDefaultKey.rawValue) else {
            throw Errors.taskDoesNotExist
        }
        UserDefaults.standard.removeObject(forKey: Constants.taksUserDefaultKey.rawValue)
    }
    
    func fetchTasks() -> [Task] {
        var tasks = [Task]()
        if let object = UserDefaults.standard.object(forKey: Constants.taksUserDefaultKey.rawValue),
            let usersTasks = object as? [Task]{
            tasks = usersTasks
        }
        return tasks
    }
}

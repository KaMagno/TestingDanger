//
//  TaskFactory.swift
//  DangerTest
//
//  Created by kaique.magno.santos on 23/08/19.
//  Copyright © 2019 kaique.magno.santos. All rights reserved.
//

import Foundation

class TaskFactory {
    
    func create(title:String) -> Task {
        let task = Task(id: UUID().uuidString, creationDate: Date(), title: title, isCompleted: false)
        return task
    }
}

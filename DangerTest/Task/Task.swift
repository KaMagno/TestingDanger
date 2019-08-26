//
//  Task.swift
//  DangerTest
//
//  Created by kaique.magno.santos on 23/08/19.
//  Copyright © 2019 kaique.magno.santos. All rights reserved.
//

import Foundation

struct Task {
    let id:String
    let creationDate:Date
    var title:String
    var isCompleted:Bool = false
}

extension Task:Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.creationDate == rhs.creationDate && lhs.isCompleted == rhs.isCompleted
    }
}

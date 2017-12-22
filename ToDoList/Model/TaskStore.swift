//
//  TasksStore.swift
//  ToDoList
//
//  Created by Chisoo Kim on 12/22/17.
//  Copyright © 2017 Chisoo Kim. All rights reserved.
//

import UIKit

class TaskStore {
    
    var allTasks = [Task]()
    
    func createTask(name: String) -> Task {
        let newTask = Task(name: name)
        
        allTasks.append(newTask)
        
        return newTask
    }
    
    func removeTask(_ task: Task) {
        if let index = allTasks.index(of: task) {
            allTasks.remove(at: index)
        }
    }
    
    func moveTask(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedTask = allTasks[fromIndex]
        allTasks.remove(at: fromIndex)
        allTasks.insert(movedTask, at: toIndex)
    }
    
}

//
//  Task.swift
//  ToDoList
//
//  Created by Chisoo Kim on 12/22/17.
//  Copyright © 2017 Chisoo Kim. All rights reserved.
//

import Foundation

class Task: NSObject {
    
    var name: String
    var dateCreated: Date
    
    // MARK: - Initializer
    
    // Designated initializer
    init(name: String) {
        self.name = name
        self.dateCreated = Date()
        
        super.init()
    }
    
    // Convenience initializer
    convenience override init() {
        self.init(name: "testing name")
    }
    
    
    
}



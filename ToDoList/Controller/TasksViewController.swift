//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Chisoo Kim on 12/22/17.
//  Copyright © 2017 Chisoo Kim. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UITableViewController {
    
    var taskStore: TaskStore!
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 45
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Action
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        
        let title = "Add a New Task"
        let message = "What task do you want to add?"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let addTaskAction = UIAlertAction(title: "Add", style: .default,
                                      handler: { (action) -> Void in
                          
            let newTaskName = ac.textFields?[0].text
                                        
            // Create a new task and add it to the store
            let newTask = self.taskStore.createTask(name: newTaskName!)
            
            // Figure out where that task is in the array
            if let index = self.taskStore.allTasks.index(of: newTask) {
                let indexPath = IndexPath(row: index, section: 0)
                
                // Insert this new row into the table
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        })
        ac.addAction(addTaskAction)

        ac.addTextField { (textField) in
            textField.placeholder = "Enter task name"
        }
        // Present the alert controller
        present(ac, animated: true, completion: nil)

    }
    
    // MARK: - UITableViewDataSource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.allTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let task = taskStore.allTasks[indexPath.row]
        
        cell.nameLabel.text = task.name
        return cell
    }

    override func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delet command
        if editingStyle == .delete {
            let task = taskStore.allTasks[indexPath.row]
            taskStore.removeTask(task)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        taskStore.moveTask(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
}

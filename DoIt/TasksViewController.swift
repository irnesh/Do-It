//
//  TasksViewController.swift
//  DoIt
//
//  Created by Irene Bajan on 2016-12-03.
//  Copyright © 2016 Irene Bajan. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tasksTableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
       tasks = makeTasks()
        
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "buy cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "mow the lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
    
}


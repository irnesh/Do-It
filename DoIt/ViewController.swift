//
//  ViewController.swift
//  DoIt
//
//  Created by Irene Bajan on 2016-12-03.
//  Copyright © 2016 Irene Bajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        cell.textLabel?.text = task.name
        return cell
    }
    
    func makeTasks () -> [Task]{
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

}


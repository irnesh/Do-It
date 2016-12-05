//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Irene Bajan on 2016-12-04.
//  Copyright © 2016 Irene Bajan. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
   
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //create a Task from the outlet information
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
         //add new task to array in previous view controller
        previousVC.tasks.append(task)
        previousVC.tasksTableView.reloadData()
        
        navigationController!.popViewController(animated: true)
        
        
    }
    
}

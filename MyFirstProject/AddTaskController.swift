//
//  AddTaskController.swift
//  MyFirstProject
//
//  Created by Georgi on 10/28/14.
//  Copyright (c) 2014 Nemetschek. All rights reserved.
//

import UIKit

@objc protocol AddTaskProtocol : NSObjectProtocol {
    func addTask(task: Task)
}

class AddTaskController : UIViewController {
    
    var isMakeDefault: Bool = false
    var settingsModel: SettingsModel = SettingsModel.getSharedInstance()!
    
    var addTaskDelegate : AddTaskProtocol?

    @IBOutlet weak var catergoryField: UITextField!
    @IBOutlet weak var titleField: UITextField!

    @IBOutlet weak var makeDefault: UISwitch!
    
    @IBAction func makeDefaultOnOff(sender: AnyObject) {
        
        isMakeDefault = !isMakeDefault
        
    }

    
    @IBAction func saveAndClose(sender: AnyObject) {
        
        var newTask: Task? = self.getNewTask();
        if (newTask == nil)
        {
            newTask = Task(category: settingsModel.defaultCategory, title: settingsModel.defaultTitle)
        }
        addTaskDelegate?.addTask(newTask!)
        
        if ( makeDefault.on )
        {
            settingsModel.defaultCategory = catergoryField.text
            settingsModel.defaultTitle = titleField.text
        }
        
        self.close()
    }
    
    func close()
    {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func getNewTask() -> Task?
    {
        var result: Task = Task(category: self.catergoryField.text, title: self.titleField.text);
       // NSLog("Task :%@", result);
        
        if (result.title.length < 1 || result.category.length < 1)
        {
            return nil;
        }
        
        return result;
    }
    
    override func viewDidLoad() {
        catergoryField.text = settingsModel.defaultCategory
        titleField.text = settingsModel.defaultTitle
    }
}
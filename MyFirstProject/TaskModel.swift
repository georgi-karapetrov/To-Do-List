//
//  TaskModel.swift
//  MyFirstProject
//
//  Created by Georgi on 10/27/14.
//  Copyright (c) 2014 Nemetschek. All rights reserved.
//

import Foundation

var sharedTaskInstance: TaskModel? = nil
class TaskModel : NSObject, AddTaskProtocol {

    var tasksDictionary: NSMutableDictionary = NSMutableDictionary()
    
    class func getSharedInstance() -> TaskModel?
    {
        if (sharedTaskInstance == nil)
        {
            sharedTaskInstance = TaskModel();
        }
        
        return sharedTaskInstance;
    }
    
    override init() {
        
        super.init()
        
        self.addTask(Task(category: "Assassinations",      title: "Kill Obama" ))
        self.addTask(Task(category: "Shopping",            title: "Cyanide" ))
        self.addTask(Task(category: "Shopping",            title: "Mapple syrup"))
        self.addTask(Task(category: "Places to walk into", title: "Mordor"))
        self.addTask(Task(category: "Places to walk into", title: "Your mom"))
        self.addTask(Task(category: "World domination",    title: "Buy more ponnies"))
        self.addTask(Task(category: "World domination",    title: "Find Uncle in Argentina"))
    }
    
    func addTask(task: Task) {
        
        if tasksDictionary.objectForKey(task.category) == nil
        {
            var array:NSMutableArray = NSMutableArray()
            array.addObject(task)
            tasksDictionary.setObject(array, forKey: task.category)
        }
        else
        {
            tasksDictionary.objectForKey(task.category)?.addObject(task);
        }
    }
    
    func categories() -> NSArray
    {
        return NSArray(array: tasksDictionary.allKeys)
    }
    
}

//
//  Task.swift
//  MyFirstProject
//
//  Created by Georgi on 10/27/14.
//  Copyright (c) 2014 Nemetschek. All rights reserved.
//

import Foundation

class Task: NSObject {
    var title: NSString    = "";
    var category: NSString = "";
    
    init( category: NSString, title: NSString) {
        self.category = category;
        self.title = title;
    }
    
}
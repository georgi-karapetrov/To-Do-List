//
//  SettingsModel.swift
//  MyFirstProject
//
//  Created by Georgi on 10/28/14.
//  Copyright (c) 2014 Nemetschek. All rights reserved.
//

import Foundation

var sharedSettingsInstance: SettingsModel? = nil
class SettingsModel: NSObject {
    
    var defaultTitle:    NSString = "Insert title"
    var defaultCategory: NSString = "Insert category"
    
    class func getSharedInstance() -> SettingsModel?
    {
        if (sharedSettingsInstance == nil)
        {
            sharedSettingsInstance = SettingsModel();
        }
        
        return sharedSettingsInstance;
    }
    
}

//
//  SettingsViewController.swift
//  MyFirstProject
//
//  Created by Georgi on 10/28/14.
//  Copyright (c) 2014 Nemetschek. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    
//    nonatomic var myVar
    @IBOutlet weak  var defaultCategoryText: UITextField!
    @IBOutlet weak var defaultTitleText: UITextField!
    
    @IBAction func setDefaultParametres(sender: AnyObject) {
        
        var settingsModel: SettingsModel = SettingsModel.getSharedInstance()!;
        settingsModel.defaultCategory = defaultCategoryText.text
        settingsModel.defaultTitle = defaultTitleText.text
        
        self.close()
    }
    
    override func viewDidLoad() {
        var settingsModel: SettingsModel = SettingsModel.getSharedInstance()!;
        defaultCategoryText.text = settingsModel.defaultCategory
        defaultTitleText.text = settingsModel.defaultTitle
    }
    
    func close()
    {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}
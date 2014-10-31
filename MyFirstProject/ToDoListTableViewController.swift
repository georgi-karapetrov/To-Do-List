//
//  ToDoListTableViewController.swift
//  MyFirstProject
//
//  Created by Georgi on 10/27/14.
//  Copyright (c) 2014 Nemetschek. All rights reserved.
//

import UIKit

@objc(ToDoListTableViewController)
class ToDoListTableViewController: UITableViewController {

    let tableViewCellHeight:CGFloat = 30;
    
    var taskModel: TaskModel = TaskModel.getSharedInstance()!;
    var categoriesArray: NSMutableArray = NSMutableArray();
    
    // MARK: - My function
    
    func getData() -> NSMutableDictionary
    {
        return self.taskModel.tasksDictionary;
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func addButtonClicked(sender: AnyObject) {
         performSegueWithIdentifier("addNewSegue", sender: TaskModel.getSharedInstance())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addNewSegue")
        {
            var destController = segue.destinationViewController as AddTaskController
            destController.addTaskDelegate = TaskModel.getSharedInstance()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return self.getData().allKeys.count;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        // TODO: think this out
        var sectionTitle: NSString = self.taskModel.categories().objectAtIndex(section) as NSString
        var catItems: NSArray = self.getData().objectForKey(sectionTitle) as NSArray
        return catItems.count

    }

    // MARK: - Table view delegates
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let rowKey = taskModel.categories().objectAtIndex(indexPath.section) as NSString
        let rowData: NSArray = self.getData().objectForKey( rowKey ) as NSArray;
        let task: Task = rowData.objectAtIndex(indexPath.row) as Task
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableViewCellHeight;
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewCellHeight * 1.5
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerFrame = CGRectMake(0, 0, tableView.frame.size.width, (tableViewCellHeight * 1.5));
        var sectionHeaderView: UIView = UIView(frame: headerFrame);
        sectionHeaderView.backgroundColor = UIColor.grayColor();
        var headerLabelFrame = CGRectMake(15, 15, sectionHeaderView.frame.size.width, 25.0);
        var headerLabel = UILabel(frame: headerLabelFrame);
        
        var keys = getData().allKeys as NSArray;
        
        headerLabel.text = keys.objectAtIndex(section) as NSString;
        
        sectionHeaderView.addSubview(headerLabel);
        
        return sectionHeaderView;
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indeƒxPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

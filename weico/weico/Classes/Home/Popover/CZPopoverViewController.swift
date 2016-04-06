//
//  CZPopoverViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/6.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZPopoverViewController: UIViewController {

    // MARK: -属性
    @IBOutlet weak var tableView: UITableView!
    
    let ID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView .registerClass(UITableViewCell.self, forCellReuseIdentifier: ID)
        tableView.tableFooterView = UIView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CZPopoverViewController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCellWithIdentifier(ID)!
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "123"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "222"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "333"
        } else if indexPath.row == 3 {
            cell.textLabel?.text = "444"
        } else {
            cell.textLabel?.text = "555"
        }
        cell.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.0)
        
        return cell
        
    }
}

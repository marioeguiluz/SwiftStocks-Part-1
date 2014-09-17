//
//  StocksTableViewController.swift
//  SwiftStocks
//
//  Created by MARIO EGUILUZ ALEBICTO on 07/08/14.
//  Copyright (c) 2014 MARIO EGUILUZ ALEBICTO. All rights reserved.
//

import UIKit

class StocksTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //private let stocks = ["APPL","FB","GOOG"]
    private let stocks: [(String,Double)] = [("APPL",+1.5),("FB",+2.33),("GOOG",-4.3)]

    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellId")
        //cell.textLabel.text = stocks[indexPath.row]
        cell.textLabel!.text = stocks[indexPath.row].0 //position 0 of the tuple: The Symbol "APPL"
        cell.detailTextLabel!.text = "\(stocks[indexPath.row].1)" + "%" //position 1 of the tuple: The value "99" into String
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        NSLog("cell clicked")
    }
    
    //Customize the cell
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
        //1
        switch stocks[indexPath.row].1 {
            case let x where x < 0.0:
                cell.backgroundColor = UIColor(red: 255.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1.0)
            case let x where x > 0.0:
                cell.backgroundColor = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0)
            case let x:
                cell.backgroundColor = UIColor(red: 44.0/255.0, green: 186.0/255.0, blue: 231.0/255.0, alpha: 1.0)
        }
        
        //2
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.detailTextLabel!.textColor = UIColor.whiteColor()
        cell.textLabel!.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 48)
        cell.detailTextLabel!.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 48)
        cell.textLabel!.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        cell.textLabel!.shadowOffset = CGSize(width: 0, height: 1)
        cell.detailTextLabel!.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        cell.detailTextLabel!.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    //Customize the height of the cell
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        //3
        return 120
    }
}


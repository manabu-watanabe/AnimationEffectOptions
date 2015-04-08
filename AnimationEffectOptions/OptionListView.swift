//
//  OptionListView.swift
//  AnimationEffectOptions
//
//  Created by 渡部学 on 2015/04/07.
//  Copyright (c) 2015年 watanabe. All rights reserved.
//

import Foundation

import UIKit

class OptionListView: UITableViewController {
    
    let OptionList: [String] = [
        "1:LayoutSubviews",
        "2:AllowUserInteraction",
        "3:BeginFromCurrentState",
        "4:Repeat",
        "5:Autoreverse",
        "6:OverrideInheritedDuration",
        "7:OverrideInheritedCurve",
        "8:AllowAnimatedContent",
        "9:ShowHideTransitionViews",
        "10:OverrideInheritedOptions",
        "11:CurveEaseInOut",
        "12:CurveEaseIn",
        "13:CurveEaseOut",
        "14:CurveLinear",
        "15:TransitionNone",
        "16:TransitionFlipFromLeft",
        "17:TransitionFlipFromRight",
        "18:TransitionCurlUp",
        "19:TransitionCurlDown",
        "20:TransitionCrossDissolve",
        "21:TransitionFlipFromTop",
        "22:TransitionFlipFromBottom"
    ]
    
    var optionTarget: Option!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OptionList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        
        cell.textLabel?.text = OptionList[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        optionTarget.change(indexPath.row, txt: OptionList[indexPath.row])
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

protocol Option {
    func change(val:Int, txt: String)
}
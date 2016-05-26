//
//  FirstViewController.swift
//  JMSTabBarKitTest
//
//  Created by shengxiao on 16/2/15.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title                = "Tab1"
        self.view.backgroundColor = UIColor.redColor()
        
        let btn:UIButton = UIButton.init(type: UIButtonType.System)
        btn.frame        = CGRectMake(100, 100, 60, 60)
        btn.setTitle("跳转", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.blueColor()
        
        btn.addTarget(self, action: #selector(FirstViewController.handleBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleBtnAction() {
        let delegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        delegate.tabBar?.setTabBarSelectedIndex(2)
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

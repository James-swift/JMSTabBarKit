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
        self.title                = "主页"
        self.view.backgroundColor = UIColor.white
        
        let btn:UIButton = UIButton.init(type: UIButtonType.system)
        btn.frame        = CGRect(x: 50, y: 100, width: 100, height: 90)
        btn.setTitle("切换", for: UIControlState())
        btn.addTarget(self, action: #selector(FirstViewController.handleBtnAction), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleBtnAction() {
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        _ = delegate.tabBar?.setTabBarSelectedIndex(1)
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

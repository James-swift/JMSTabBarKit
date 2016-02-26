//
//  LoginViewController.swift
//  JMSTabBarKitTest
//
//  Created by shengxiao on 16/2/15.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellowColor();
        
        self.setupViews();
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self
            , action: "close")
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func setupViews() {
        let rect            = CGRect(origin: CGPoint(x: 50, y: 100), size: CGSize(width: 100, height: 50));
        let label           = UILabel(frame: rect);
        label.text          = "请先登录";
        label.textColor     = UIColor.blackColor();
        label.textAlignment = NSTextAlignment.Center;
        label.center.x      = self.view.center.x;

        self.view.addSubview(label);
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

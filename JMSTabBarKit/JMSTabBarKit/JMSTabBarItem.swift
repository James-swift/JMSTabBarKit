//
//  JMSTabBarItem.swift
//  JMSTabBarKit
//
//  Created by shengxiao on 16/2/14.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import Foundation

public class JMSTabBarItem {
    public var title:String               = "";
    public var controllerClass:AnyClass?;
    public var selectedImageName:String   = "";
    public var unSelectedImageName:String = "";
    public var selected:Bool              = false;
    public var loginStateControl:Bool     = false;
    
    public init() {

    }

    public init(tTitle:String,tControllerClass:AnyClass,tSelectedImageName:String,tUnSelectedImageName:String,tSelected:Bool,tLoginStateControl:Bool) {
        title               = tTitle;
        controllerClass     = tControllerClass;
        selectedImageName   = tSelectedImageName;
        unSelectedImageName = tUnSelectedImageName;
        selected            = tSelected;
        loginStateControl   = tLoginStateControl;
    }
}

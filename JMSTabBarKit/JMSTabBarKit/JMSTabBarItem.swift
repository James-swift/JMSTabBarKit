//
//  JMSTabBarItem.swift
//  JMSTabBarKit
//
//  Created by shengxiao on 16/2/14.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import Foundation

public class JMSTabBarItem {
    
    private(set) var title:String               = ""
    private(set) var controllerClass:AnyClass?
    private(set) var selectedImageName:String   = ""
    private(set) var unSelectedImageName:String = ""
    private(set) var selected:Bool              = false
    
    private init() {

    }

    //  MARK: 实例化JMSTabBarItem
    /// 实例化JMSTabBarItem
    ///
    /// - Parameters:
    ///     - tTitle: 标题
    ///     - tControllerClass:     类
    ///     - tSelectedImageName:   选中的显示图像名称
    ///     - tUnSelectedImageName: 未选中的显示图像名称
    ///     - tSelected:            是否选中
    public init(tTitle:String, tControllerClass:AnyClass, tSelectedImageName:String, tUnSelectedImageName:String, tSelected:Bool) {
        self.title               = tTitle
        self.controllerClass     = tControllerClass
        self.selectedImageName   = tSelectedImageName
        self.unSelectedImageName = tUnSelectedImageName
        self.selected            = tSelected
    }
    
}

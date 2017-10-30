//
//  JMSTabBarController.swift
//  JMSTabBarKit
//
//  Created by shengxiao on 16/2/14.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import Foundation
import UIKit

public typealias JMTabBarShouldSelectBlock = (UIViewController, Int) -> Bool

private let JMS_Tag_Origin                 = 1000

public class JMSTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Public Properties
    // 控制TabBarItem能不能选中(可用于如登录控制等)
    public var tabBarShouldSelectBlock: JMTabBarShouldSelectBlock?
    
    // tabBar数据
    private(set) var tabBarArray: Array<JMSTabBarItem>?
    
    // tabBar项选中状态下的样式
    private(set) var tabBarSelectedTextAttributesDic: [NSAttributedStringKey : Any]?
    
    // tabBar项未选中状态下的样式
    private(set) var tabBarUnSelectedTextAttributesDic: [NSAttributedStringKey : Any]?
    
    private var enableShouldSelectedBlk: Bool = true
    
    //  MARK: 切换Tab
    /// 切换Tab
    ///
    ///     let vc =  setTabBarSelectedIndex(1)
    ///
    /// - Parameters:
    ///     - selectedIndex: 选中TabBarItem下标
    /// - Returns: 返回指定下标对应的UIViewController
    public func setTabBarSelectedIndex(_ selectedIndex: Int) -> UIViewController? {
        var selectedVC: UIViewController?
        
        if (selectedIndex >= 0 && selectedIndex < (self.tabBarArray?.count)!) {
            self.selectedIndex = selectedIndex
            
            selectedVC  = self.viewControllers![selectedIndex]
            
            _ = self.tabBarController(self, shouldSelect: selectedVC!)
        }
        
        return selectedVC
    }
    
    // MARK: - Self
    //  MARK: 初始化TabBar
    /// 初始化TabBar
    ///
    /// - Parameters:
    ///     - tabBarArray: tabBarItem数组
    ///     - tabBarSelectedTextAttributes: tabBarItem选中样式
    ///     - tabBarUnSelectedTextAttributes: tabBarItem未选中样式
    public init(tabBarArray: Array<JMSTabBarItem>, tabBarSelectedTextAttributes: [NSAttributedStringKey : Any], tabBarUnSelectedTextAttributes: [NSAttributedStringKey : Any]) {
        self.tabBarArray                       = tabBarArray
        self.tabBarSelectedTextAttributesDic   = tabBarSelectedTextAttributes
        self.tabBarUnSelectedTextAttributesDic = tabBarUnSelectedTextAttributes
        super.init(nibName: nil, bundle: nil)
        self.setupTabBarController()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupTabBarController() {
        var selectedIndex: Int = 0
        
        if (self.tabBarArray != nil) {
            let count = self.tabBarArray!.count
            var viewControllerArray: Array<UIViewController> = []
            
            for i in 0..<count {
                let item = self.tabBarArray![i]
                
                guard item.controller != nil else {
                    continue
                }
                
                var navVC: UINavigationController
                if let tempVC = item.controller as? UINavigationController {
                    navVC = tempVC
                }else {
                    navVC = UINavigationController.init(rootViewController: item.controller!)
                }
                    
                navVC.tabBarItem               = UITabBarItem.init(title: item.title, image: UIImage(named: item.unSelectedImageName),tag:JMS_Tag_Origin + i)
                navVC.tabBarItem.image         = UIImage(named: item.unSelectedImageName)
                navVC.tabBarItem.selectedImage = UIImage(named: item.selectedImageName)
                
                navVC.tabBarItem.image = navVC.tabBarItem.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

                navVC.tabBarItem.selectedImage = navVC.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                
                if (item.selected) {
                    navVC.tabBarItem.setTitleTextAttributes(self.tabBarSelectedTextAttributesDic, for: UIControlState())
                    selectedIndex = i
                }else {
                    navVC.tabBarItem.setTitleTextAttributes(self.tabBarUnSelectedTextAttributesDic, for: UIControlState())
                }
                
                viewControllerArray.append(navVC)
            }
            
            self.viewControllers = viewControllerArray
            self.delegate        = self
            
            self.enableShouldSelectedBlk = false
            _ = self.setTabBarSelectedIndex(selectedIndex)
            self.enableShouldSelectedBlk = true
        }
    }
    
    // MARK: - UITabBarControllerDelegate
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        var shouldSelect = true
        
        if (self.tabBarShouldSelectBlock != nil && self.enableShouldSelectedBlk) {
            let index = self.viewControllers?.index(of: viewController)
            shouldSelect = self.tabBarShouldSelectBlock!(viewController, index!)
        }
        
        if (shouldSelect) {
            viewController.tabBarItem.setTitleTextAttributes(self.tabBarSelectedTextAttributesDic, for: UIControlState())
            for vc in tabBarController.viewControllers! {
                if (vc != viewController) {
                    vc.tabBarItem.setTitleTextAttributes(self.tabBarUnSelectedTextAttributesDic, for: UIControlState())
                }
            }
        }
        
        return shouldSelect
    }
    
}


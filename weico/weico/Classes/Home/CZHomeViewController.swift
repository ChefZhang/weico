//
//  CZHomeViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZHomeViewController: CZBaseViewController {

    
    // MARK:- 懒加载
    private lazy var titleBtn: CZTitleButton = CZTitleButton()
    private lazy var popoverAnimation: CZPopoverAnimation = CZPopoverAnimation {[weak self](presentedState) -> () in
        self?.titleBtn.selected = presentedState
    }
    private lazy var statusViewModels: [CZStatusViewModel] = [CZStatusViewModel]()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.beginRotationAnim()
        
        if !isLogin {
            return
        }
        
        setupNavigationBar()
        
        loadNewData()
        
        
        // MARK: - 这么写的话,就不需要用传统的计算每个控件的高度了,两句话都一定要
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }

    
}

// MARK:- 设置UI界面,nagationItem
extension CZHomeViewController {
    private func setupNavigationBar() {

//        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
//        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        let leftBtn = UIButton(imageName: "navigationbar_friendattention")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        leftBtn.addTarget(self, action: "leftBarButtonItemClick", forControlEvents: .TouchUpInside)
        
        let rightBtn = UIButton(imageName: "navigationbar_pop")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        rightBtn.addTarget(self, action: "rightBarButtonItemClick", forControlEvents: .TouchUpInside)
        
        titleBtn.setTitle("captianZhu", forState: .Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
}


// MARK: -监听事件
extension CZHomeViewController {
    @objc private func leftBarButtonItemClick() {
        print("leftBarButtonItem")
    }
    
    @objc private func rightBarButtonItemClick() {
        print("rightBarButtonItem")
    }
    
    @objc private func titleBtnClick(titleBtn : CZTitleButton) {
//        titleBtn.selected = !titleBtn.selected
        
        
        let popoverVc = CZPopoverViewController()
        // 设置modal的样式,如果不设置的话,就会遮盖住首页中tableview的内容
        popoverVc.modalPresentationStyle = .Custom
        
        // 设置转场动画的代理
        popoverVc.transitioningDelegate = popoverAnimation
        
        
        popoverAnimation.presentedFrame = CGRectMake(20, 55, 150, 250)
        
        presentViewController(popoverVc, animated: true, completion: nil)

    }
}

// MARK: - 请求数据
extension CZHomeViewController {
    private func loadNewData() {
        CZNetworkTools.shareInstance.loadNewData { (result, error) -> () in
            if error != nil {
                CZLog(error)
                return
            }
            
            guard let resultArray = result else {
                return
            }
            
            for statusDict in resultArray {
                let status = CZStatus(dict: statusDict)
                let statusViewModel = CZStatusViewModel(status: status)
                self.statusViewModels.append(statusViewModel)
                
            }
            
            self.tableView.reloadData()
        }
    }
}

// MARK:- tableView的数据源方法
extension CZHomeViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusViewModels.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell") as! CZHomeTableViewCell
        
        cell.statusViewModel = statusViewModels[indexPath.row]
        
        return cell
    }
}




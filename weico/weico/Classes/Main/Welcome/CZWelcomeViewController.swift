//
//  CZWelcomeViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/8.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

import SDWebImage

class CZWelcomeViewController: UIViewController {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var iconViewBottomCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let iconViewURLString = CZUserAccountViewModel.shareInstance.account?.avatar_large
        
        let iconViewURL = NSURL(string: iconViewURLString ?? "")
//        iconView.sd_setImageWithURL(iconViewURL, placeholderImage: UIImage(named: "avatar_default_big"))
        iconView.sd_setImageWithURL(iconViewURL, placeholderImage: UIImage(named: "avatar_default_big"), options: [])
        
        
        iconViewBottomCons.constant = UIScreen.mainScreen().bounds.size.height - 250
        
        
        UIView .animateWithDuration(0.75, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (isfinished: Bool) -> Void in
                UIApplication.sharedApplication().keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
        
    }

    

}

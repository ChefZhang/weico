//
//  CZHomeTableViewCell.swift
//  weico
//
//  Created by JohnZhang on 16/4/10.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

import SDWebImage

private let edgeMargin : CGFloat = 15

class CZHomeTableViewCell: UITableViewCell {

    // MARK:- 控件属性
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var verifiedView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var vipView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    // MARK:- 约束的属性
    @IBOutlet weak var contentLabelWCons: NSLayoutConstraint!
    
    
    var statusViewModel : CZStatusViewModel? {
        didSet{
            // 1.nil值校验
            guard let statusViewModel = statusViewModel else {
                return
            }
            
            // 2.设置头像
            iconView.sd_setImageWithURL(statusViewModel.profileURL, placeholderImage: UIImage(named: "avatar_default_small"))
            
            // 3.设置认证的图标
            verifiedView.image = statusViewModel.verifiedImage
            
            // 4.昵称
            screenNameLabel.text = statusViewModel.status?.user?.screen_name
            
            // 5.会员图标
            vipView.image = statusViewModel.vipImage
            
            // 6.设置时间的Label
            timeLabel.text = statusViewModel.createAtText
            
            // 7.设置来源
            contentLabel.text = statusViewModel.status?.text
            
            // 8.设置昵称的文字颜色
            screenNameLabel.textColor = statusViewModel.vipImage == nil ? UIColor.blackColor() : UIColor.orangeColor()
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // 设置微博正文的宽度约束
        contentLabelWCons.constant = UIScreen.mainScreen().bounds.width - 2 * edgeMargin
    }
    
}

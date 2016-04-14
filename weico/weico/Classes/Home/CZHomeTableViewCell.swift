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
private let itemMargin : CGFloat = 10

class CZHomeTableViewCell: UITableViewCell {

    // MARK:- 控件属性
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var verifiedView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var vipView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var picView: CZPicCollectionView!
    
    
    // MARK:- 约束的属性
    @IBOutlet weak var contentLabelWCons: NSLayoutConstraint!
    @IBOutlet weak var picViewWCons: NSLayoutConstraint!
    @IBOutlet weak var picViewHCons: NSLayoutConstraint!
    
    
    var statusViewModel : CZStatusViewModel? {
        didSet{
            // nil值校验
            guard let statusViewModel = statusViewModel else {
                return
            }
            
            iconView.sd_setImageWithURL(statusViewModel.profileURL, placeholderImage: UIImage(named: "avatar_default_small"))
            verifiedView.image = statusViewModel.verifiedImage
            screenNameLabel.text = statusViewModel.status?.user?.screen_name
            vipView.image = statusViewModel.vipImage
            timeLabel.text = statusViewModel.createAtText
            contentLabel.text = statusViewModel.status?.text
            screenNameLabel.textColor = statusViewModel.vipImage == nil ? UIColor.blackColor() : UIColor.orangeColor()
            
            // 计算picView的宽度和高度的约束
            let picViewSize = calculatePicViewSize(statusViewModel.picURLs.count)
            picViewWCons.constant = picViewSize.width
            picViewHCons.constant = picViewSize.height
            
            picView.picURLs = statusViewModel.picURLs
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // 设置微博正文的宽度约束
        contentLabelWCons.constant = UIScreen.mainScreen().bounds.width - 2 * edgeMargin
        
        // 设置collection的item
        let layout = picView.collectionViewLayout as! UICollectionViewFlowLayout
        let imageViewWH = (UIScreen.mainScreen().bounds.width - 2 * edgeMargin - 2 * itemMargin) / 3
        layout.itemSize = CGSize(width: imageViewWH, height: imageViewWH)
    }
    
}

// MARK:- 计算方法
extension CZHomeTableViewCell {
    private func calculatePicViewSize(count : Int) -> CGSize {
        // 没有配图
        if count == 0 {
            return CGSizeZero
        }
        
        let imageViewWH = (UIScreen.mainScreen().bounds.width - 2 * edgeMargin - 2 * itemMargin) / 3
        
        // 四张配图
        if count == 4 {
            let picViewWH = imageViewWH * 2 + itemMargin
            return CGSize(width: picViewWH, height: picViewWH)
        }
        
        // 其他张配图,计算行数
        let rows = CGFloat((count - 1) / 3 + 1)
        
        let picViewH = rows * imageViewWH + (rows - 1) * itemMargin
        let picViewW = UIScreen.mainScreen().bounds.width - 2 * edgeMargin
        
        return CGSize(width: picViewW, height: picViewH)
    }
}


//
//  CZPicCollectionView.swift
//  weico
//
//  Created by JohnZhang on 16/4/14.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZPicCollectionView: UICollectionView {

    // MARK:- 定义属性
    var picURLs : [NSURL] = [NSURL]() {
        didSet {
            self.reloadData()
        }
    }
    
    // MARK: -自己做自己的数据源,低耦合
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
    }
    
    
    
}

extension CZPicCollectionView: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picURLs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PicCell", forIndexPath: indexPath) as! CZPicCollectionViewCell
        
        cell.picURL = picURLs[indexPath.item]
        
        return cell
    }
}

class CZPicCollectionViewCell: UICollectionViewCell {
    // MARK: -定义模型属性
    @IBOutlet weak var illustration: UIImageView!
    
    // MARK:- 定义模型属性
    var picURL : NSURL? {
        didSet {
            guard let picURL = picURL else {
                return
            }
            illustration.sd_setImageWithURL(picURL, placeholderImage: UIImage(named: "empty_picture"), options: [])
        }
    }
}

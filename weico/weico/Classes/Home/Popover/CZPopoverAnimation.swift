//
//  CZPopoverAnimation.swift
//  weico
//
//  Created by JohnZhang on 16/4/6.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZPopoverAnimation: NSObject {

    // MARK: -判断是否有modal的视图
    private var isPresented: Bool = false
}


// MARK:- 转场动画
extension CZPopoverAnimation : UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        // 返回UIPresentationController对象
        //        return UIPresentationController(presentedViewController: presented, presentingViewController: presenting)
        
        // 这里我是要自定义的
        return CZPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}


// MARK: -自定义弹出动画
extension CZPopoverAnimation: UIViewControllerAnimatedTransitioning {
    
    // 自定义弹出的动画,自定义动画后,就要自己设置控制器的出现了,以下两个就是用来设置的
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }
    
    // 自定义消失的动画
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
    
    // 必须实现,设置动画时长
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.2
    }
    
    // 必须实现,获取`转场的上下文`:可以通过转场上下文获取弹出的View和消失的View
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        isPresented ? animationForPresentedView(transitionContext) : animationForDismissedView(transitionContext)
    }
    
    
    /// 自定义弹出动画
    func animationForPresentedView(transitionContext: UIViewControllerContextTransitioning) {
        // 获取弹出的view
        // Currently only two keys are defined by the system -
        // UITransitionContextFromViewKey获取消失的, and UITransitionContextToViewKey获取出现的
        let presentView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        transitionContext.containerView()?.addSubview(presentView)
        presentView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        presentView.transform = CGAffineTransformMakeScale(1.0, 0.0)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            presentView.transform = CGAffineTransformIdentity
            }) { (isFinished: Bool) -> Void in
                // 必须写明,转场动画上下文结束
                transitionContext.completeTransition(true)
        }
        
    }
    
    func animationForDismissedView(transitionContext: UIViewControllerContextTransitioning) {
        let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            dismissView.transform = CGAffineTransformMakeScale(1.0, 0.001)
            }) { (isFinished) -> Void in
                transitionContext.completeTransition(true)
        }
    }
}

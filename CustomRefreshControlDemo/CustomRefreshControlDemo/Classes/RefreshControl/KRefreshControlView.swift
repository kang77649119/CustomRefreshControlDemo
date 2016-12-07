//
//  KRefreshControlView.swift
//  CustomRefreshControlDemo
//
//  Created by 也许、 on 2016/12/6.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class KRefreshControlView: UIView {
    
    // 圆圈
    @IBOutlet weak var loadingImg: UIImageView!
    
    // 包含箭头的view
    @IBOutlet weak var loadingTipView: KRefreshControlView!

    // 箭头
    @IBOutlet weak var pullRefreshImg: UIImageView!
    
    // 箭头旋转
    func arrowsRotation(flag:Bool) {
        
        var angle = M_PI
        angle += flag ? -0.01 : 0.01
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.pullRefreshImg.transform =  self.pullRefreshImg.transform.rotated(by: CGFloat(angle))
        }
        
    }
    
    // 开始刷新
    func startLoadingAnimate() {
        
        loadingTipView.isHidden = true
        loadingImg.isHidden = false
        
        let animate = CABasicAnimation(keyPath: "transform.rotation")
        animate.toValue = 2 * M_PI
        animate.duration = 1
        animate.repeatCount = MAXFLOAT
        animate.isRemovedOnCompletion = true
        
        loadingImg.layer.add(animate, forKey: nil)
        
    }
    
    // 结束刷新
    func stopLoadingAnimate() {
        
        loadingTipView.isHidden = false
        loadingImg.isHidden = true
        loadingImg.layer.removeAllAnimations()
        
    }
   

}

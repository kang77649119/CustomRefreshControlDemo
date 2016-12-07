//
//  KRefreshControl.swift
//  CustomRefreshControlDemo
//
//  Created by 也许、 on 2016/12/6.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class KRefreshControl: UIRefreshControl {
    
    // 箭头翻转标记
    var arrowsRotation = false
    
    // 正在刷新标记
    var loadingRefreshFlag = false
    
    // 刷新控件
    lazy var kRefreshControlView:KRefreshControlView = {
        
        let kRefreshControlView:KRefreshControlView = Bundle.main.loadNibNamed("KRefreshControlView", owner: nil, options: nil)?.last as! KRefreshControlView
        kRefreshControlView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 129, height: 60))
        kRefreshControlView.center = self.center
        return kRefreshControlView
        
    }()

    override init() {
        super.init()
        
        setupUI()
        
        // kvo监测frame的变化
        addObserver(self, forKeyPath: "frame", options: .new, context: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        removeObserver(self, forKeyPath: "frame")
    }
    
}

extension KRefreshControl {

    func setupUI() {
        self.addSubview(kRefreshControlView)
    }
    
    // 重写结束刷新
    override func endRefreshing() {
        super.endRefreshing()
        
        print("结束刷新")
        loadingRefreshFlag = false
        kRefreshControlView.stopLoadingAnimate()
        
    }
    
    // KVO监听frame的变化
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        let y = frame.origin.y
        if y >= 0 {
            return
        }
        
        // 判断是否正在刷新
        if isRefreshing && !loadingRefreshFlag {
            print("圆圈旋转")
            loadingRefreshFlag = true
            kRefreshControlView.startLoadingAnimate()
            return
        }
        
        // 箭头翻转
        if y >= -50 && arrowsRotation {
            print("向上翻转")
            arrowsRotation = false
            kRefreshControlView.arrowsRotation(flag: arrowsRotation)
            
        } else if y < -50 && !arrowsRotation {
            // 向上翻转
            print("向下翻转")
            arrowsRotation = true
            kRefreshControlView.arrowsRotation(flag: arrowsRotation)
        
        }
        
    }

}

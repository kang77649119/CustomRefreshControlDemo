//
//  IndexVC.swift
//  CustomRefreshControlDemo
//
//  Created by 也许、 on 2016/12/6.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

let cellReuseIdentifier = "cellReuseIdentifier"

class IndexVC: UIViewController {
    
    lazy var table:UITableView = {
        
        let table:UITableView = UITableView(frame: CGRect(x: 0, y: statusBarH, width: screenW, height: screenH - statusBarH))
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        table.tableFooterView = UIView(frame: CGRect.zero)
        
        // 设置刷新控件
        table.refreshControl = KRefreshControl()
        table.refreshControl?.addTarget(self, action: #selector(self.loadData), for: .valueChanged)
        return table
    
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    deinit {
        removeObserver(self, forKeyPath: "frame")
    }

}

extension IndexVC {
    
    func setupUI() {
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(table)
    
    }
    
    func loadData() {
        self.perform(#selector(self.loadData2), with: nil, afterDelay: 3)
    }
    
    func loadData2() {
        print("加载数据")
        table.refreshControl?.endRefreshing()
    }

}

extension IndexVC : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.text = "ABCDEFG"
        return cell
        
    }
   
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      
        if scrollView.contentOffset.y <= -50 {
            self.table.refreshControl?.beginRefreshing()
            self.loadData()
        }
        
    }
    

}

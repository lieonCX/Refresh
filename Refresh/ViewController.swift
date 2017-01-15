//
//  ViewController.swift
//  Refresh
//
//  Created by lieon on 2017/1/13.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate lazy var refresh: RefreshControl = {
        let refreshControl = RefreshControl()
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

extension ViewController {
    fileprivate func setupUI() {
        tableView.addSubview(refresh)
        refresh.refreshHandler = {
           self.loadData()
        }

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc private func loadData() {
        print(".....")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.refresh.endRefreshing()
            self.tableView.reloadData()
            
        }
    }
}


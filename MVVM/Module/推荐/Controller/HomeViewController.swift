//
//  HomeViewController.swift
//  MVVM
//
//  Created by hans on 2019/10/14.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:- lazy load
    ///view
    lazy var mainView: HomeMainView = {
        let mainView = HomeMainView.init(frame: view.bounds)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        return mainView
        }()
    
    ///viewModel
    var viewModel = HomeViewModel()
    //MARK:- life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加view视图
        view.addSubview(mainView)
        //view元素绑定viewModel
        bindViewModel()
        //请求数据
        fetchData()
    }
    //MARK:- private
    //pragma MARK: viewModel请求数据
    func fetchData() {
        viewModel.fetchData()
    }
}

extension HomeViewController{
    func bindViewModel() {
        viewModel.dataArrayClosure = { [weak self] in
            self?.mainView.tableView.reloadData()
        }
    }
}
//MARK:- UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: HomeCell? = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeCell.self)) as? HomeCell
        if cell == nil {
            cell = HomeCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: NSStringFromClass(HomeCell.self))
        }
        cell?.createAtLabel.text = viewModel.createdAt(index: indexPath.row)
        
        return cell!
    }
}
//MARK:- UITableViewDelegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let publishedAt = viewModel.selectRowData(index: indexPath.row)
        print(publishedAt)
    }
}



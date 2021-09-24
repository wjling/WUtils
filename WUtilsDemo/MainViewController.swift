//
//  MainViewController.swift
//  WUtilsDemo
//
//  Created by wjling on 2021/9/6.
//

import UIKit
import Kingfisher
import WUtils

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Demos"
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Demo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)
        let demo = Demo.allCases[indexPath.row]
        cell.textLabel?.text = demo.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let demo = Demo.allCases[indexPath.row]
        self.navigationController?.pushViewController(demo.controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


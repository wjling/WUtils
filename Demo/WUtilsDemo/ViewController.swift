//
//  ViewController.swift
//  WUtilsDemo
//
//  Created by wjling on 2021/8/2.
//

import UIKit
import Kingfisher
import WUtils

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green

        label.text = UIView.w.testText()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
    }
}


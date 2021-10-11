//
//  ExtensionTestController.swift
//  WUtilsDemo
//
//  Created by wjling on 2021/10/11.
//

import Foundation
import UIKit

class ExtensionTestController: UIViewController {
    deinit {
        print("!!!!!! \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        test()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func configureViews() {
        view.backgroundColor = .white
    }
    
    private func test() {
        let str = """
        {"account": "wangjinling", "password": 1024}
        """
        let dict = str.w.toDict()
        print("string to dict: \(String(describing: dict))")
        
        let jsonString = dict?.w.toJSONString()
        print("dict to string: \(String(describing: jsonString))")
        
        let arr = [1, 2, 3]
        let arrString = arr.w.toString()
        print("array to string: \(String(describing: arrString))")
        
        let index = 3
        let e = arr.w.object(at: index)
        print("array element at index: \(index), element: \(String(describing: e))")
        
        let newArr = arrString?.w.toArray()
        print("string to array: \(String(describing: newArr))")
    }
}

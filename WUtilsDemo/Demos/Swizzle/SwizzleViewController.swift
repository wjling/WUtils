//
//  SwizzleViewController.swift
//  SwizzleViewController
//
//  Created by wjling on 2021/9/26.
//

import Foundation
import UIKit
import WUtils

class SwizzleViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        A.w.swizzleInstanceMethod(originalSelector: #selector(A.a), swizzledSelector: #selector(A.A_a))
        A.w.swizzleClassMethod(originalSelector: #selector(A.c), swizzledSelector: #selector(A.A_c))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let a = A()
//        print("执行a.a() -------")
//        a.a()
//        print("执行a.A_a() -------")
//        a.A_a()
//        print("执行A.c() -------")
//        A.c()
//        print("执行A.A_c() -------")
//        A.A_c()
        
        let str = """
        {"account": "wangjinling", "password": 1024}
        """
        let dict = str.w.toDict()
        
        let jsonString = dict?.w.toJSONString()
        print("jsonString: \(String(describing: jsonString))")
    }
    
    class Base: NSObject {
        @objc dynamic func a() {
            print("Base.a()")
        }
        
        @objc func b() {
            print("Base.b()")
        }
        
        @objc class dynamic func c() {
            print("static Base.c()")
        }
    }

    class A: Base {
//        override func a() {
//            super.a()
//            print("A.a()")
//        }
        
        @objc dynamic func A_a() {
            print("A.A_a()")
        }
        
//        override class func c() {
//            super.c()
//            print("static A.c()")
//        }
        
        @objc class dynamic func A_c() {
            print("static A.A_c()")
        }
    }
}

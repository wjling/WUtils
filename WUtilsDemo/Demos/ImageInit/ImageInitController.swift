//
//  ImageInitController.swift
//  ImageInitController
//
//  Created by wjling on 2021/9/23.
//

import Foundation
import UIKit
import PinLayout
import WUtils

class ImageInitController: UIViewController {
    let colorTextField = UITextField()
    let cornerRadiusTextField = UITextField()
    let topLeftSwitch = SwitchView()
    let topRightSwitch = SwitchView()
    let bottomLeftSwitch = SwitchView()
    let bottomRightSwitch = SwitchView()
    let confirmButton = UIButton()
    let imageView = UIImageView()
    
    deinit {
        print("!!!!!! \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        colorTextField.pin.top(view.pin.safeArea.top + 20).left(20).right(to: view.edge.hCenter).marginRight(10).height(50)
        cornerRadiusTextField.pin.top(to: colorTextField.edge.top).left(to: view.edge.hCenter).right(20).marginLeft(10).height(50)
        topLeftSwitch.pin.below(of: colorTextField, aligned: .left).marginTop(10).sizeToFit()
        topRightSwitch.pin.below(of: cornerRadiusTextField, aligned: .right).marginTop(10).sizeToFit()
        bottomLeftSwitch.pin.below(of: topLeftSwitch, aligned: .left).marginTop(10).sizeToFit()
        bottomRightSwitch.pin.below(of: topRightSwitch, aligned: .right).marginTop(10).sizeToFit()
        confirmButton.pin.top(to: bottomLeftSwitch.edge.bottom).marginTop(10).hCenter().width(150).height(44)
        imageView.pin.top(to: confirmButton.edge.bottom).marginTop(15).horizontally(20).height(300)
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        colorTextField.placeholder = "请输入16进制色值，如ffffff"
        colorTextField.text = "A764FE"
        colorTextField.font = .systemFont(ofSize: 11)
        colorTextField.adjustsFontSizeToFitWidth = true
        colorTextField.backgroundColor = UIColor.init(hex: 0xe9e9e9, alpha: 1)
        view.addSubview(colorTextField)
        
        cornerRadiusTextField.placeholder = "请输入圆角"
        cornerRadiusTextField.text = "5"
        cornerRadiusTextField.keyboardType = .numberPad
        cornerRadiusTextField.font = UIFont.systemFont(ofSize: 12)
        cornerRadiusTextField.backgroundColor = UIColor.init(hex: 0xe9e9e9, alpha: 1)
        view.addSubview(cornerRadiusTextField)
        
        topLeftSwitch.title = "左上角"
        view.addSubview(topLeftSwitch)
        
        topRightSwitch.title = "右上角"
        view.addSubview(topRightSwitch)
        
        bottomLeftSwitch.title = "左下角"
        view.addSubview(bottomLeftSwitch)
        
        bottomRightSwitch.title = "右下角"
        view.addSubview(bottomRightSwitch)
        
        confirmButton.setTitle("确 定", for: .normal)
        confirmButton.setTitleColor(.red, for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 15)
        confirmButton.addTarget(self, action: #selector(confirmButtonClick), for: .touchUpInside)
        view.addSubview(confirmButton)
        
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.contentMode = .center
        view.addSubview(imageView)
    }
    
    @objc private func confirmButtonClick() {
        let color = UIColor.init(hexString: colorTextField.text ?? "")
        print("color: \(String(describing: color))")
        let radius = Double(cornerRadiusTextField.text ?? "") ?? 0
        var corners: UIRectCorner = []
        if topLeftSwitch.isOn {
            corners.insert(.topLeft)
        }
        if topRightSwitch.isOn {
            corners.insert(.topRight)
        }
        if bottomLeftSwitch.isOn {
            corners.insert(.bottomLeft)
        }
        if bottomRightSwitch.isOn {
            corners.insert(.bottomRight)
        }
        let image = UIImage.init(color: color ?? .red, size: .init(width: 50, height: 50), roundingCorners: corners, cornerRadius: radius)
        imageView.image = image
    }
}

class SwitchView: UIView {
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isOn: Bool {
        return switchButton.isOn
    }
    
    let switchButton = UISwitch()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("!!!!!! \(type(of: self)) deinit")
    }
    
    func configureViews() {
        titleLabel.textColor = .black
        addSubview(titleLabel)
        addSubview(switchButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.pin.left().vCenter().sizeToFit()
        switchButton.pin.right(of: titleLabel, aligned: .center).sizeToFit()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        return .init(width: switchButton.frame.maxX, height: max(titleLabel.frame.height, switchButton.frame.height))
    }
}

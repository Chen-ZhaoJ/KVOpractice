//
//  MyView.swift
//  kvo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/8/2.
//

import Foundation
import UIKit
class MyView:UIView {
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("HI", for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return button
        }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        getButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(getButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

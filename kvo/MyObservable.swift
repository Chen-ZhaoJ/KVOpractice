//
//  MyObservable.swift
//  kvo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/8/1.
//

import Foundation
class MyObservable : NSObject{ //被觀察者
    @objc dynamic var date = Date()
    
    func updateDate() {
        date = Date()
    }
}

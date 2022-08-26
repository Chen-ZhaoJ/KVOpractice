//
//  MyObserver.swift
//  kvo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/8/1.
//

import Foundation
class MyObserver: NSObject { //觀察者
    @objc var myObservable : MyObservable
    var observation: NSKeyValueObservation?
    var name: String
    
    init(myObservable: MyObservable, name: String) {
        self.myObservable = myObservable
        self.name = name
        super.init()
        
        observation = observe(\.myObservable.date, options:[.initial, .old, .new , .prior]) { (object, change) in
            print("\(name)收到通知，initialValue:\(String(describing: object.myObservable.date))")
            print("\(name)收到通知，newValue:\(String(describing: change.newValue))")
            print("\(name)收到通知，oldValue:\(String(describing: change.oldValue))")
            print(change.isPrior)
        }
    }
}

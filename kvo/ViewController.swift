//
//  ViewController.swift
//  kvo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/8/1.
//

import UIKit
class ViewController: UIViewController {
    var observation: NSKeyValueObservation?
    @IBOutlet weak var dataTextView: UITextField!
    @objc dynamic var viewModel: ViewModel = ViewModel()

    @IBOutlet weak var valueTextView: UITextField!
        
    let myview = MyView()
    @IBAction func updateDataClick(_ sender: Any) {
            //觸發viewModel屬性值改變
        viewModel.value1 = valueTextView.text!
        viewModel.value2 = valueTextView.text!
    }
    @IBOutlet weak var updateDataButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myObservable = MyObservable()
        let myObserver1 = MyObserver(myObservable: myObservable, name: "Observer1")
        let myObserver2 = MyObserver(myObservable: myObservable, name: "Observer2")
        myObservable.updateDate()
        
        observation = observe(\.viewModel.value1, options:[.initial, .old, .new, .prior]) { (object, change) in
                   //當viewModel.value1異動時，會執行此closure
            print("old \(change.oldValue)")
            print("new \(change.newValue)")
            print("initial \(object.viewModel.value1)")
            print(change.isPrior)
           self.dataTextView.text = change.newValue
        }
    }
}

//把view加到vc才能addsubview(btn)

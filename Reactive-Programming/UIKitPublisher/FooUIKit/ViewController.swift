//
//  ViewController.swift
//  FooUIKit
//
//  Created by Mohammad Azam on 10/5/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var cancellables: Set<AnyCancellable> = []
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        // add a TextField
        view.addSubview(textField)
        
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // create publisher
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
            .compactMap { $0.object as? UITextField }
            .sink { textField in
                if let text = textField.text {
                    print(text)
                }
            }.store(in: &cancellables)
        
    }
}


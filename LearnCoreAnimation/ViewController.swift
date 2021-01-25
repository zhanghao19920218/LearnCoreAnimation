//
//  ViewController.swift
//  LearnCoreAnimation
//
//  Created by Mason on 2021/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var v: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 100,
                         y: UIScreen.main.bounds.size.height / 2 - 100,
                         width: 200,
                         height: 200)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(v)
        
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        
        v.layer.addSublayer(blueLayer)
    }


}


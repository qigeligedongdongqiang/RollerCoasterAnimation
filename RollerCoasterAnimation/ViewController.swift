//
//  ViewController.swift
//  AnimationSwiftDemo
//
//  Created by Ngmm_Jadon on 2017/5/19.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layer: RollerCoasterLayer = RollerCoasterLayer(frame: view.bounds)
        view.layer.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


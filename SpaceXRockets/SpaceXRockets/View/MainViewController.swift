//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 30.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var scrollViewInfo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewInfo.layer.cornerRadius = 30.0
    }


}


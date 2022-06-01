//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 30.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet var hsvHeightView: UIView!
    @IBOutlet var hsvDiameterView: UIView!
    @IBOutlet var hsvMassView: UIView!
    @IBOutlet var hsvPayloadLb: UIView!
    
    @IBOutlet var scrollViewInfo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewInfo.layer.cornerRadius = 30.0
        hsvMassView.layer.cornerRadius = 30.0
        hsvPayloadLb.layer.cornerRadius = 30.0
        hsvHeightView.layer.cornerRadius = 30.0
        hsvDiameterView.layer.cornerRadius = 30.0
    }


}


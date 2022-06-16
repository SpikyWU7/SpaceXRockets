//
//  SettingsViewController.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 14.06.2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var heightSegControl: UISegmentedControl!
    @IBOutlet var diameterSegControl: UISegmentedControl!
    @IBOutlet var massSegControl: UISegmentedControl!
    @IBOutlet var payloadWghtsSegControl: UISegmentedControl!
    
    private var heightUnits = "m"
    private var diameterUnits = "m"
    private var massUnits = "kg"
    private var payloadUnits = "kg"
    
    var changeState = false
    var action = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentState()
    }
    
    func setupSegmentState() {
        if UserDefaults.standard.string(forKey: "Height") ==  "ft" {
            heightSegControl.selectedSegmentIndex = 1
        } else {
            heightSegControl.selectedSegmentIndex = 0
        }
        if UserDefaults.standard.string(forKey: "Diameter") ==  "ft" {
            diameterSegControl.selectedSegmentIndex = 1
        } else {
            diameterSegControl.selectedSegmentIndex = 0
        }
        if UserDefaults.standard.string(forKey: "Mass") ==  "lb" {
            massSegControl.selectedSegmentIndex = 1
        } else {
            massSegControl.selectedSegmentIndex = 0
        }
        if UserDefaults.standard.string(forKey: "Payload") ==  "lb" {
            payloadWghtsSegControl.selectedSegmentIndex = 1
        } else {
            payloadWghtsSegControl.selectedSegmentIndex = 0
        }
    }
        
    
    @IBAction func heightChanged(_ sender: UISegmentedControl) {
        changeState = true
        
        switch (sender.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("m", forKey: "Height")
        case 1:
            UserDefaults.standard.set("ft", forKey: "Height")
        default:
            print("Error")
        }
        }
    @IBAction func diameterChanged(_ sender: UISegmentedControl) {
        changeState = true
        switch (sender.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("m", forKey: "Diameter")
        case 1:
            UserDefaults.standard.set("ft", forKey: "Diameter")
        default:
            print("Error")
        }
        
        }
    
    @IBAction func massChanged(_ sender: UISegmentedControl) {
        changeState = true
        switch (sender.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("kg", forKey: "Mass")
        case 1:
            UserDefaults.standard.set("lb", forKey: "Mass")
        default:
            print("Error")
        }
        
        }
    
    @IBAction func payloadChanged(_ sender: UISegmentedControl) {
        changeState = true
        switch (sender.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("kg", forKey: "Payload")
        case 1:
            UserDefaults.standard.set("lb", forKey: "Payload")
        default:
            print("Error")
        }
        
        }
    
    @IBAction func cancelPressed() {
        action = true
        if changeState {
        NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        if !action && changeState{
        NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        }
    }
}

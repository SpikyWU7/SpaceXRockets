import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet private var heightSegControl: UISegmentedControl!
    @IBOutlet private var diameterSegControl: UISegmentedControl!
    @IBOutlet private var massSegControl: UISegmentedControl!
    @IBOutlet private var payloadWghtsSegControl: UISegmentedControl!
        
    private var changeState = false
    private var action = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentState()
    }
    
    private func setupSegmentState() {
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
        
    @IBAction private func heightChanged(_ sender: UISegmentedControl) {
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
    @IBAction private func diameterChanged(_ sender: UISegmentedControl) {
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
    @IBAction private func massChanged(_ sender: UISegmentedControl) {
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
    
    @IBAction private func payloadChanged(_ sender: UISegmentedControl) {
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
    
    @IBAction private func cancelPressed() {
        action = true
        if changeState {
        NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

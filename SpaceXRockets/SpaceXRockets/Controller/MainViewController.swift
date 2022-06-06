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
    
    @IBOutlet var rocketName: UILabel!
    @IBOutlet var firstLaunch: UILabel!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var costAmount: UILabel!
    @IBOutlet var firstEngines: UILabel!
    @IBOutlet var firstFuel: UILabel!
    @IBOutlet var firstBurnTime: UILabel!
    @IBOutlet var secondEngines: UILabel!
    @IBOutlet var secondFuel: UILabel!
    @IBOutlet var secondBurnTime: UILabel!
    
    let networkAPI = NetworkAPI()
    
    var rockets: [RocketModel] = []
    var arrayMainVC: [RocketModel] = []
    var indexNumberPVC = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewInfo.layer.cornerRadius = 30.0
        hsvMassView.layer.cornerRadius = 30.0
        hsvPayloadLb.layer.cornerRadius = 30.0
        hsvHeightView.layer.cornerRadius = 30.0
        hsvDiameterView.layer.cornerRadius = 30.0
        
        fetchData()
        reloadUI()
    }
    
    private func fetchData(){
        networkAPI.fetchDataForRockets { (result) in
            switch result {
            case .success(let rockets):
                DispatchQueue.main.async {
                    self.rockets = rockets ?? []
                    self.reloadUI()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func reloadUI(){
        rocketName.text = rockets.first?.name
        firstLaunch.text = rockets.first?.firstFlight
        countryName.text = rockets.first?.country
        costAmount.text = "\(rockets.first?.costPerLaunch ?? 0)"
        firstEngines.text = "\(rockets.first?.firstStage.engines ?? 0)"
        firstFuel.text = "\(rockets.first?.firstStage.fuelAmount ?? 0)"
        firstBurnTime.text = "\(rockets.first?.firstStage.burnTime ?? 0)"
        secondEngines.text = "\(rockets.first?.secondStage.engines ?? 0)"
        secondFuel.text = "\(rockets.first?.secondStage.fuelAmount ?? 0)"
        secondBurnTime.text = "\(rockets.first?.secondStage.burnTime ?? 0)"
    }
}



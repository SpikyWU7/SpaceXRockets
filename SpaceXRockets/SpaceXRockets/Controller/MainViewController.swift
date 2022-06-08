//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 30.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var pageController: UIPageControl!
    
    @IBOutlet var scrollViewInfo: UIView!
    
    @IBOutlet var rocketImage: UIImageView!
    @IBOutlet var rocketName: UILabel!
    
    //MARK: - Horizontal Stack View outlets
    @IBOutlet var hsvHeightView: UIView!
    @IBOutlet var hsvDiameterView: UIView!
    @IBOutlet var hsvMassView: UIView!
    @IBOutlet var hsvPayloadLb: UIView!
    
    @IBOutlet var hsvHeightNumbers: UILabel!
    @IBOutlet var hsvHeightUnits: UILabel!
    
    @IBOutlet var hsvDiameterNumbers: UILabel!
    @IBOutlet var hsvDiameterUnits: UILabel!
    
    @IBOutlet var hsvMassNumbers: UILabel!
    @IBOutlet var hsvMassUnits: UILabel!
    
    @IBOutlet var hsvPayloadWeightsNumbers: UILabel!
    @IBOutlet var hsvPayloadWeightsUnits: UILabel!
    
    //MARK: - Stages outlets
    @IBOutlet var firstLaunch: UILabel!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var costAmount: UILabel!
    
    @IBOutlet var firstEngines: UILabel!
    @IBOutlet var firstFuel: UILabel!
    @IBOutlet var firstBurnTime: UILabel!
    
    @IBOutlet var secondEngines: UILabel!
    @IBOutlet var secondFuel: UILabel!
    @IBOutlet var secondBurnTime: UILabel!
    
    //MARK: - Public props
    
    var rockets: [RocketModel] = []
    var arrayMainVC: [RocketModel]!
    var indexNumberPVC = 0
    
    var tmpRocketName: String!
    
    var tmpHeightNumbers: String!
    var tmpDiameterNumbers: String!
    var tmpMassNumbers: String!
    var tmpPayloadWeightsNumbers: String!
    
    var tmpFirstLaunch: String!
    var tmpCountryName: String!
    var tmpCostAmount: String!

    var tmpFirstEngines: String!
    var tmpFirstFuel: String!
    var tmpFirstBurnTime: String!
    
    var tmpSecondEngines: String!
    var tmpSecondFuel: String!
    var tmpSecondBurnTime: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        pageController.currentPage = indexNumberPVC
        fillTitle()
        fillFirstStage()
        fillSecondStage()
    }
    
    private func fillTitle() {
        rocketName.text = tmpRocketName
        hsvHeightNumbers.text = tmpHeightNumbers
        hsvDiameterNumbers.text = tmpDiameterNumbers
        hsvMassNumbers.text = tmpMassNumbers
        hsvPayloadWeightsNumbers.text = tmpPayloadWeightsNumbers
        costAmount.text = tmpCostAmount
        countryName.text = tmpCountryName
        firstLaunch.text = tmpFirstLaunch
    }
    
    private func fillFirstStage() {
        firstEngines.text = tmpFirstEngines
        firstFuel.text = tmpFirstFuel
        firstBurnTime.text = tmpFirstBurnTime
    }
    
    private func fillSecondStage() {
        secondEngines.text = tmpSecondEngines
        secondFuel.text = tmpSecondFuel
        secondBurnTime.text = tmpSecondBurnTime
    }
    
    private func setupView() {
        scrollViewInfo.layer.cornerRadius = 30.0
        hsvMassView.layer.cornerRadius = 30.0
        hsvPayloadLb.layer.cornerRadius = 30.0
        hsvHeightView.layer.cornerRadius = 30.0
        hsvDiameterView.layer.cornerRadius = 30.0
    }
}



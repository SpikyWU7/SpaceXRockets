import UIKit

class MainViewController: UIViewController {
    @IBOutlet private var rocketName: UILabel!
    @IBOutlet private var pageController: UIPageControl!
    @IBOutlet private var scrollViewInfo: UIView!
    // MARK: - Horizontal Stack View outlets
    @IBOutlet private var hsvHeightView: UIView!
    @IBOutlet private var hsvDiameterView: UIView!
    @IBOutlet private var hsvMassView: UIView!
    @IBOutlet private var hsvPayloadLb: UIView!
    @IBOutlet private var hsvHeightNumbers: UILabel!
    @IBOutlet private var hsvHeightUnits: UILabel!
    @IBOutlet private var hsvDiameterNumbers: UILabel!
    @IBOutlet private var hsvDiameterUnits: UILabel!
    @IBOutlet private var hsvMassNumbers: UILabel!
    @IBOutlet private var hsvMassUnits: UILabel!
    @IBOutlet private var hsvPayloadWeightsNumbers: UILabel!
    @IBOutlet private var hsvPayloadWeightsUnits: UILabel!
    // MARK: - Stages outlets
    @IBOutlet private var firstLaunch: UILabel!
    @IBOutlet private var countryName: UILabel!
    @IBOutlet private var costAmount: UILabel!
    @IBOutlet private var firstEngines: UILabel!
    @IBOutlet private var firstFuel: UILabel!
    @IBOutlet private var firstBurnTime: UILabel!
    @IBOutlet private var secondEngines: UILabel!
    @IBOutlet private var secondFuel: UILabel!
    @IBOutlet private var secondBurnTime: UILabel!

    // MARK: - Public props
    @IBOutlet var rocketImage: UIImageView!
    var rockets: [RocketModel] = []
    var arrayMainVC: [RocketModel]!
    var indexNumberPVC = 0
    var tmpRocketName: String!
    // MARK: - Horizontal stack
    var tmpHeightNumbers: String!
    var tmpHeightUnits: String!
    var tmpDiameterNumbers: String!
    var tmpDiameterUnits: String!
    var tmpMassNumbers: String!
    var tmpMassUnits: String!
    var tmpPayloadWeightsNumbers: String!
    var tmpPayloadWeightUnits: String!
    // MARK: - Main rocket info
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
        fillHsv()
        fillFirstStage()
        fillSecondStage()
    }
    private func fillTitle() {
        rocketName.text = tmpRocketName
        costAmount.text = tmpCostAmount
        countryName.text = tmpCountryName
        firstLaunch.text = tmpFirstLaunch
    }
    private func fillHsv() {
        hsvHeightNumbers.text = tmpHeightNumbers
        hsvHeightUnits.text = tmpHeightUnits
        hsvDiameterNumbers.text = tmpDiameterNumbers
        hsvDiameterUnits.text = tmpDiameterUnits
        hsvMassNumbers.text = tmpMassNumbers
        hsvMassUnits.text = tmpMassUnits
        hsvPayloadWeightsNumbers.text = tmpPayloadWeightsNumbers
        hsvPayloadWeightsUnits.text = tmpPayloadWeightUnits
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

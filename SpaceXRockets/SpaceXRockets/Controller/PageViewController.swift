import Foundation
import UIKit

class PageViewController: UIPageViewController {
    private let format = Format()
    private var newArray: [RocketModel] = []
    private let networkAPI = NetworkAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reload),
            name: Notification.Name("reloadData"),
            object: nil
        ) }
    @objc func reload() {
        networkAPI.fetchDataForRockets(
            dataType: [RocketModel].self,
            url: networkAPI.spacexDataURL,
            formaterString: StringOld.oldStringListRocket.rawValue
        ) { data in
            self.newArray = data
            self.pvcMethod()
            self.dataTransition()
        }
    }
    private func pvcMethod() {
        guard let initVC = detailedIndex(index: 0)
        else { return }
        setViewControllers([initVC], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
    private func detailedIndex(index: Int) -> MainViewController? {
        guard let mVC = storyboard?.instantiateViewController(
            withIdentifier: "MainViewController"
        ) as? MainViewController
        else { return nil }
        guard index >= 0
        else { return nil }
        guard index < self.newArray.count
        else { return nil }
        guard let imageData = networkAPI.fetchImage(from: newArray[index].images.randomElement())
        else { return nil }
        DispatchQueue.main.async { mVC.rocketImage.image = UIImage(data: imageData) }
        mVC.tmpRocketName = newArray[index].name
        mVC.tmpFirstLaunch = format.strToDate(date: newArray[index].firstFlight)
        mVC.tmpCostAmount = newArray[index].launchCost
        mVC.tmpFirstFuel = format.formatNums(value: newArray[index].firstStage.fuelAmount)
        mVC.tmpSecondFuel = format.formatNums(value: newArray[index].secondStage.fuelAmount)
        mVC.tmpCountryName = newArray[index].country
        mVC.tmpFirstEngines = String(newArray[index].firstStage.engines)
        mVC.tmpFirstBurnTime = String(newArray[index].firstStage.burnTime ?? 0)
        mVC.tmpSecondEngines = String(newArray[index].secondStage.engines)
        mVC.tmpSecondBurnTime = String(newArray[index].secondStage.burnTime ?? 0)
        if UserDefaults.standard.string(forKey: "Height") == "ft" {
            mVC.tmpHeightNumbers = "\(newArray[index].height.feet)"
            mVC.tmpHeightUnits = "ft"
        } else {
            mVC.tmpHeightNumbers = "\(newArray[index].height.meters)"
            mVC.tmpHeightUnits = "m"
        }
        if UserDefaults.standard.string(forKey: "Diameter") == "ft" {
            mVC.tmpDiameterNumbers = "\(newArray[index].diameter.feet)"
            mVC.tmpDiameterUnits = "ft"
        } else {
            mVC.tmpDiameterNumbers = "\(newArray[index].diameter.meters)"
            mVC.tmpDiameterUnits = "m"
        }
        if UserDefaults.standard.string(forKey: "Mass") == "lb" {
            mVC.tmpMassNumbers = "\(newArray[index].mass.lb)"
            mVC.tmpMassUnits = "lb"
        } else {
            mVC.tmpMassNumbers = "\(newArray[index].mass.kg)"
            mVC.tmpMassUnits = "kg"
        }
        if UserDefaults.standard.string(forKey: "Payload") == "lb" {
            mVC.tmpPayloadWeightsNumbers = "\(String(format.formatNums(value: newArray[index].payloadWeights.first?.lb ?? 0)))"
            mVC.tmpPayloadWeightUnits = "lb"
        } else if newArray[index].payloadWeights.first != nil {
            mVC.tmpPayloadWeightsNumbers = "\(String(format.formatNums(value: newArray[index].payloadWeights.first?.kg ?? 0)))"
            mVC.tmpPayloadWeightUnits = "kg"
        }
        //            mVC.tmpHeightNumbers = String(newArray[index].height.meters)
        //            mVC.tmpDiameterNumbers = String(newArray[index].diameter.meters)
        //            mVC.tmpMassNumbers = String(newArray[index].mass.kg)
        //            mVC.tmpPayloadWeightsNumbers = String(format.formatNums
//        (value: newArray[index].payloadWeights.first?.kg ?? 0))
        mVC.indexNumberPVC = index
        return mVC
    }
    private func dataTransition() {
        guard let mVC = storyboard?.instantiateViewController(
            withIdentifier: "MainViewController"
        ) as? MainViewController
        else { return }
        mVC.arrayMainVC = self.newArray
    }
}
// MARK: - Extension PageViewController
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        var mVC = (viewController as? MainViewController)!.indexNumberPVC
        mVC -= 1
        return detailedIndex(index: mVC)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var mVC = (viewController as? MainViewController)!.indexNumberPVC
        mVC += 1
        return detailedIndex(index: mVC)
    }
}

//
//  PageViewController.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 06.06.2022.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController {
     
    private var newArray: [RocketModel] = []
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        NetworkAPI.fetchData(dataType: [RocketModel].self, url: Link.listRocket.rawValue, formaterString: StringOld.oldStringListRocket.rawValue) { data in
//            self.newArray = data
//            self.pageViewControllerMethod()
//            self.dataTransmission()
//        }
//    }
  
    private func pageViewControllerMethod() {
        guard let startingVc = detailedIndex(index: 0) else { return }
        setViewControllers([startingVc], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
    
    private func detailedIndex(index: Int) -> MainViewController? {
        guard let mVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
        guard index >= 0 else { return nil }
        guard index < self.newArray.count else { return nil }
        mVC.rocketName.text = newArray[index].name ?? "Error: No name"
        return mVC
    }
    
    func dataTransmission() {
        guard let mVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return }
        mVC.arrayMainVC = self.newArray
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var mainVc = (viewController as! MainViewController).indexNumberPVC
        mainVc -= 1
        
        return detailedIndex(index: mainVc)
}
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var mainVc = (viewController as! MainViewController).indexNumberPVC
        mainVc += 1
        
        return detailedIndex(index: mainVc)
    }
}


import Foundation
import UIKit

class LaunchesViewController: UIViewController {
    @IBOutlet private var launchesTable: UITableView!
    private var newArray: [LaunchDates] = []
    private let networkAPI = NetworkAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        launchesTable.dataSource = self
        title = "Запуски"
        launchesTable.register(UINib(nibName: "RocketCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        loadData()
    }
    private func loadData() {
        networkAPI.fetchDataForRockets(dataType: [LaunchDates].self,
                                       url: networkAPI.spacexLaunches,
                                       formaterString: StringOld.oldStringRocketLaunches.rawValue) { data in
            self.newArray = data
            self.newArray.sort(by: { $0.dateUtc > $1.dateUtc })
            self.launchesTable.reloadData()
        }
    }
    @IBAction private func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
// MARK: - Extension LaunchesViewController
extension LaunchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launch = newArray[indexPath.row]
        let cell = launchesTable.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as? RocketCell
        cell!.rocketCellLabel.text = launch.name
        cell!.initCell(with: launch)
        return cell!
    }
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

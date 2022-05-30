//
//  NetworkAPI.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 30.05.2022.
//

import Foundation

protocol RocketsAPIDelegate {
    func updateRocketsInfo(_ networkManager: NetworkAPI, rockets: RocketData)
}

class NetworkAPI {
    
    let spacexDataURL = "https://api.spacexdata.com/v4/rockets"
    private let decoder = JSONDecoder()
    private let session = URLSession(configuration: .default)
    
    var delegate: RocketsAPIDelegate?
    
    func getRocketsData(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            if let safeData = data, let rockets = self.parseJSON(safeData) {
                self.delegate?.updateRocketsInfo(self, rockets: rockets)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ rocketData: Data) -> RocketData? {
        do {
            let decodedData = try decoder.decode(RocketModel.self, from: rocketData)
            let name = decodedData.name
            let firstFlight = decodedData.firstFlight
            let country = decodedData.country
            let costPerLaunch = decodedData.costPerLaunch
            let firstStageEngines = decodedData.firstStage[0].engines
            let firstStageFuelAmount = decodedData.firstStage[0].fuelAmount
            let firstStageBurnTime = decodedData.firstStage[0].burnTime
            let secondStageEngines = decodedData.secondStage[0].engines
            let secondStageFuelAmount = decodedData.secondStage[0].fuelAmount
            let secondStageBurnTime = decodedData.secondStage[0].burnTime
            let rocket = RocketData(name: name, firstFlight: firstFlight, country: country, costPerLaunch: costPerLaunch, firstStageEngines: firstStageEngines, firstStageFuelAmount: firstStageFuelAmount, firstStageBurnTime: firstStageBurnTime, secondStageEngines: secondStageEngines, secondStageFuelAmount: secondStageFuelAmount, secondStageBurnTime: secondStageBurnTime)
            return rocket
        } catch {
            return nil
        }
    }
}

//
//  RocketModel.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 30.05.2022.
//

import Foundation

struct RocketModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case firstFlight = "first_flight"
        case country
        case costPerLaunch = "cost_per_launch"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
    }
    
    let name: String
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    let firstStage: FirstStage
    let secondStage: SecondStage
}

struct FirstStage: Codable {
    
    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
    
    let engines: Int
    let fuelAmount: Double
    let burnTime: Int?
}

struct SecondStage: Codable {
    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
    
    let engines: Int
    let fuelAmount: Double
    let burnTime: Int?
}

extension RocketModel {
    init(data: Data) throws {
        self = try JSONDecoder().decode(RocketModel.self, from: data)
    }

}

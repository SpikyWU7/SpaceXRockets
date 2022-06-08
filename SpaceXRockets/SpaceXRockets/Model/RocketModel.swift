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
        case images = "flickr_images"
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
    }
    
    let name: String
    let firstFlight: Date
    let country: String
    let costPerLaunch: Double
    let firstStage: FirstStage
    let secondStage: SecondStage
    let images: [String]
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeights]
    
    var launchCost: String {
        String(format: "$%.0f млн.", costPerLaunch / 1000000)
    }
}

struct Height: Codable {
    let meters: Double
    let feet: Double
}

struct Diameter: Codable {
    let meters: Double
    let feet: Double
}

struct Mass: Codable {
    let kg: Double
    let lb: Double
}

struct PayloadWeights: Codable {
    let kg: Double
    let lb: Double
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



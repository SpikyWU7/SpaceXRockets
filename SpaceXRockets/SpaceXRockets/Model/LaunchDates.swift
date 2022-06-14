//
//  LaunchDates.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 13.06.2022.
//

import Foundation

struct LaunchDates: Decodable {
    let name: String?
    let success: Bool?
    var dateUtc: Date
    
    enum CodingKeys: String, CodingKey {
        case name
        case success
        case dateUtc = "date_utc"
    }
}

import Foundation

struct LaunchDates: Decodable {
    let name: String?
    let success: Bool?
    var dateUtc: Date
    var rocket: String
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case success
        case dateUtc = "date_utc"
        case rocket
    }
}

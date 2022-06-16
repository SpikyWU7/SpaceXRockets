import Foundation

class Format {
    func strToDate(date: Date) -> String {
        var strDate: String
        let dataFormat = DateFormatter()
        dataFormat.locale = .current
        dataFormat.dateStyle = .long
        strDate = dataFormat.string(from: date)
        return strDate
    }

    func numToStr(_ number: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        guard let result = format.string(from: number as NSNumber) else { return "error formatting numToStr" }
        return "\(result)"
    }
    
    func formatNums(value: Double) -> String {
        String(format: "%.0f", value)
    }
}

enum StringOld: String  {
    case oldStringListRocket = "yyyy-MM-dd"
    case oldStringRocketLaunches = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
}

import Foundation
import UIKit

class RocketCell: UITableViewCell {
    @IBOutlet private var rocketView: UIView!
    @IBOutlet var rocketCellLabel: UILabel!
    @IBOutlet var rocketCellDate: UILabel!
    @IBOutlet var rocketImage: UIImageView!
    
    let format = Format()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rocketView.layer.cornerRadius = rocketView.frame.size.height / 25
    }
    
    func initCell(with data: LaunchDates) {
            rocketCellLabel.text = data.name
            rocketCellDate.text = format.strToDate(date: data.dateUtc)
        
        if let data = data.success {
            if data {
                rocketImage.image = UIImage(named: "rocketTrue")
            } else {
                rocketImage.image = UIImage(named: "rocketFalse")
            }
        } else {
            rocketImage.image = UIImage(named: "unknown")
        }
    }
}

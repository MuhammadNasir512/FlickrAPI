import UIKit

extension String {
        
    func formattedDateString() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateformatter.date(from: self) {
            dateformatter.dateFormat = "dd-MM-yyyy"
            let formattedDate: String = dateformatter.string(from: date)
            return formattedDate
        }
        return ""
    }
}

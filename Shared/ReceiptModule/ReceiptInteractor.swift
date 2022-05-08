import Foundation
import UIKit

class ReceiptInteractor {
    
    private let model: DataModel
    
    init(model: DataModel) {
        self.model = model
    }
    
    func getPersons() -> [Person] {
        return model.persons
    }
    
    func getNameOfEvent() -> String {
        model.nameOfEvent
    }
    
    func calculateTotalPrice(for person: Person) -> String {
        guard let deliveryPrice = Double(getDeliveryPriceForPerson()) else {
            fatalError("Can't conver delivery price from \(getDeliveryPriceForPerson())")
        }
        return String((person.price + deliveryPrice).roundedMoney)
    }
    
    func getDeliveryPriceForPerson() -> String {
        let numberOfPersons = model.persons.count
        guard let deliveryPrice = Double(model.deliveryPrice) else {
            fatalError("Can't convert delivery price from \(model.deliveryPrice)")
        }
        return String((deliveryPrice/Double(numberOfPersons)).roundedMoney)
    }
    
    func copyToClipboard() {
        var personForCopy: [String] = []
        for person in model.persons {
            personForCopy.append("\(person.name) \(calculateTotalPrice(for: person))")
        }
        UIPasteboard.general.string = personForCopy.joined(separator: "\n")
    }
}

private extension Double {
    
    var roundedMoney: Double {
        (self * 100).rounded(.up)/100
    }
}

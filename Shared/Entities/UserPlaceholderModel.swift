import SwiftUI

class UserPlaceholderModel: ObservableObject {
    
    @Published public var names: [String] = ["", ""]
    @Published public var prices: [String] = ["", ""]
    
    func addName(_ name: String, at index: Int) {
        names[index] = name
    }
    
    func addPrice(_ price: String, at index: Int) {
        prices[index] = price
    }
    
    func addNewPerson() {
        names.append("")
        prices.append("")
    }
}

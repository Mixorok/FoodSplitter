import Combine

final class DataModel: ObservableObject {
    
    @Published public var nameOfEvent = "Delivery"
    @Published public var persons: [Person] = []
    @Published public var deliveryPrice: String = ""
    
    func addPerson(_ person: Person) {
        persons.append(person)
    }
    
    func saveDeliveryPrice(_ price: String) {
        deliveryPrice = price
    }
    
    func changeNameOfEvent(to name: String) {
        nameOfEvent = name
    }
    
}

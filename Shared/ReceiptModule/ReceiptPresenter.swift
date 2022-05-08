import SwiftUI

class ReceiptPresenter: ObservableObject {
    
    private let interactor: ReceiptInteractor
    
    init(interactor: ReceiptInteractor) {
        self.interactor = interactor
    }
    
    func getPersons() -> [Person] {
        interactor.getPersons()
    }
    
    func getNameOfEvent() -> String {
        interactor.getNameOfEvent()
    }
    
    func getDeliveryPriceForPerson() -> String {
        interactor.getDeliveryPriceForPerson()
    }
    
    func calculateTotalPrice(for person: Person) -> String  {
        interactor.calculateTotalPrice(for: person)
    }
    
    func copyToClipboard() {
        interactor.copyToClipboard()
    }
}

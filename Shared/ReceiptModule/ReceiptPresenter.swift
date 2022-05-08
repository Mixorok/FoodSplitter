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
}

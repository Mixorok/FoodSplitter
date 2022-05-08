import SwiftUI

class MainPresenter: ObservableObject {
    
    private let interactor: MainInteractor
    private let router = MainRouter()
    
    init(interactor: MainInteractor) {
        self.interactor = interactor
    }

    func getNumberOfNames() -> Int {
        interactor.getNumberOfNames()
    }
    
    func addName(_ name: String, at index: Int) {
        interactor.addName(name, at: index)
    }
    
    func addPrice(_ price: String, at index: Int) {
        interactor.addPrice(price, at: index)
    }
    
    func getName(at index: Int) -> String {
        interactor.getName(at: index)
    }
    
    func getPrice(at index: Int) -> String {
        interactor.getPrice(at: index)
    }
    
    func changeNameOfEvent(to event: String) {
        interactor.changeNameOfEvent(to: event)
    }
    
    func getNameOfEvent() -> String {
        interactor.getNameOfEvent()
    }
    
    func getDeliveryPrice() -> String {
        interactor.getDeliveryPrice()
    }
    
    func changeDeliveryPrice(to price: String) {
        interactor.changeDeliveryPrice(to: price)
    }
    
    func isReadyForGetReceipt() -> Bool {
        interactor.getNumberOfNames() > 2 && !getDeliveryPrice().isEmpty
    }
    
    func createPersons() {
        interactor.createPersons()
    }
    
    func routeToRecept(isActive: Binding<Bool>) -> some View {
        return NavigationLink(
            isActive: isActive,
            destination: { router.makeReceipt(model: interactor.model) },
            label: EmptyView.init
        )
    }
}

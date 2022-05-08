class ReceiptInteractor {
    
    private let model: DataModel
    
    init(model: DataModel) {
        self.model = model
    }
    
    func getPersons() -> [Person] {
        model.persons
    }
    
    func getNameOfEvent() -> String {
        model.nameOfEvent
    }
}

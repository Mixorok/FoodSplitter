class MainInteractor {
    
    let model: DataModel
    let userPlaceholderModel: UserPlaceholderModel
    
    init(model: DataModel, userPlaceholderModel: UserPlaceholderModel) {
        self.model = model
        self.userPlaceholderModel = userPlaceholderModel
    }
    
    func getNumberOfNames() -> Int {
        userPlaceholderModel.names.count
    }
    
    func addName(_ name: String, at index: Int) {
        userPlaceholderModel.addName(name, at: index)
        if !name.isEmpty, index + 1 == userPlaceholderModel.names.count {
            userPlaceholderModel.addNewPerson()
        }
    }
    
    func addPrice(_ price: String, at index: Int) {
        userPlaceholderModel.addPrice(price, at: index)
    }
    
    func getName(at index: Int) -> String {
        userPlaceholderModel.names[index]
    }
    
    func getPrice(at index: Int) -> String {
        userPlaceholderModel.prices[index]
    }
    
    func changeNameOfEvent(to name: String) {
        model.changeNameOfEvent(to: name)
    }
    
    func getNameOfEvent() -> String {
        model.nameOfEvent
    }
    
    func getDeliveryPrice() -> String {
        model.deliveryPrice
    }
    
    func changeDeliveryPrice(to price: String) {
        model.saveDeliveryPrice(price)
    }
    
    func createPersons() {
//        print("COUNTPERSONS ==>", userPlaceholderModel.names.count)
//        for name in userPlaceholderModel.names {
//            print("NAME ==>", name)
//            for price in userPlaceholderModel.prices {
//                print("PRICE ==>", price)
//                guard let price = Double(price) else {
//
//                    return
//                }
//                model.addPerson(Person(name: name, price: price))
//
//            }
//        }
//        print("PERSON ==>", model.persons)
        for (nameIndex, name) in userPlaceholderModel.names.enumerated() {
            let userPrice = userPlaceholderModel.prices[nameIndex]
            guard let price = Double(userPrice) else {
                return
            }
            model.addPerson(Person(name: name, price: price))
        }
    }
}

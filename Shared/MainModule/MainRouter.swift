import SwiftUI

class MainRouter {
    
    func makeReceipt(model: DataModel) -> some View {
        let presenter = ReceiptPresenter(interactor: ReceiptInteractor(model: model))
        return ReceiptView(presenter: presenter)
    }
}

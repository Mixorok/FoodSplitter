import SwiftUI

public struct MainView: View {
    
    @ObservedObject private var presenter: MainPresenter
    @State private var routeToReceipt: Bool = false
    
    init(presenter: MainPresenter) {
        self.presenter = presenter
    }
    
    public var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 16) {
                VStack(spacing: 24) {
                    ForEach(0..<presenter.getNumberOfNames(), id: \.self) { index in
                        HStack(spacing: 20) {
                            TextField(
                                "Name",
                                text: Binding(
                                    get: { presenter.getName(at: index) },
                                    set: { presenter.addName($0, at: index) }
                                )
                            )
                            
                            TextField(
                                "Price",
                                text: Binding(
                                    get: { presenter.getPrice(at: index) },
                                    set: { presenter.addPrice($0, at: index) }
                                )
                            )
                            .keyboardType(.decimalPad)
                            .frame(maxWidth: 90)
                        }
                    }
                }
                
                
                Spacer()
                
                VStack(spacing: 16) {
                    TextField("Delivery", text: Binding(
                        get: {presenter.getDeliveryPrice()}, set: { presenter.changeDeliveryPrice(to: $0)}))
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .frame(maxWidth: 126)
//                    TextField("Delivery", text: $delivery)
//                        .frame(maxWidth: 70)
                    Button(action: {
                        presenter.createPersons()
                        routeToReceipt = true
                    }, label: {
                        Text("Ready")
                            .padding(.vertical, 4)
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .disabled(!presenter.isReadyForGetReceipt())
                    
                }
//                .frame(maxHeight: .infinity)
                
            }
            .padding(.horizontal, 16)
            .padding(.top, 30)
            .padding(.bottom, 30)
            
            presenter.routeToRecept(isActive: $routeToReceipt)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Button {
                    print("Hello")
                } label: {
                    HStack {
                        Text(presenter.getNameOfEvent())
                            .font(.title)
                        Image(systemName: "pencil")
                    }
                    .foregroundColor(.black)
                    
                    
                }

            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView(presenter: MainPresenter(interactor: MainInteractor(model: DataModel(), userPlaceholderModel: UserPlaceholderModel())))
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

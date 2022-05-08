//
//  ReceiptView.swift
//  FoodSplitter (iOS)
//
//  Created by Maksim Bezdrobnoi on 06.05.2022.
//

import SwiftUI

struct ReceiptView: View {
    
    @ObservedObject private var presenter: ReceiptPresenter
    
    init(presenter: ReceiptPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("Totall")
                }
                Divider()
                
                ForEach(presenter.getPersons(), id: \.self) { person in
                    HStack(spacing: 16) {
                        Text(person.name)
                        Spacer()
                        Text("\(person.price.formattedMoney) + \(presenter.getDeliveryPriceForPerson())")
                        Spacer()
                        Text("\(presenter.calculateTotalPrice(for: person))")
                    }
                }
                .padding(.bottom, 18)
                
                Spacer()
                
                Button {
                    presenter.copyToClipboard()
                } label: {
                    Text("Coppy")
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationTitle(presenter.getNameOfEvent())
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        let fakeModel = DataModel()
        fakeModel.persons = [Person(name: "Maks", price: 20.2), Person(name: "Igor", price: 19.2)]
        
        return ReceiptView(presenter: ReceiptPresenter(interactor: ReceiptInteractor(model: fakeModel)))
    }
}

private extension Double {
    
    var formattedMoney: String {
        self.formatted(.number.precision(.fractionLength(2)))
    }
}

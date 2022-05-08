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
                    Text("Finally")
                }
                Divider()
                
                ForEach(presenter.getPersons(), id: \.self) { person in
                    HStack(spacing: 16) {
                        Text(person.name)
                        Spacer()
                        Text("22")
                        Spacer()
                        Text("\(person.price)")
                    }
                }
                
                Spacer()
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

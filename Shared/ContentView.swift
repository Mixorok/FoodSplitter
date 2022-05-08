//
//  ContentView.swift
//  Shared
//
//  Created by Maksim Bezdrobnoi on 06.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = false
    @State private var text = ""
    
    @ObservedObject private var model: DataModel
    @StateObject private var userPlaceholderModel = UserPlaceholderModel()
    
    init(model: DataModel) {
        self.model = model
    }
    
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        NavigationView {
            MainView(presenter: MainPresenter(interactor: MainInteractor(model: model, userPlaceholderModel: userPlaceholderModel)))
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: DataModel())
    }
}

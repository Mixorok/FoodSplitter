//
//  FoodSplitterApp.swift
//  Shared
//
//  Created by Maksim Bezdrobnoi on 06.05.2022.
//

import SwiftUI

@main
struct FoodSplitterApp: App {
    
    @StateObject private var model = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}

//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 29/04/26.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    
    @State private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MovieListView(coordinator: coordinator)
        }
    }
}

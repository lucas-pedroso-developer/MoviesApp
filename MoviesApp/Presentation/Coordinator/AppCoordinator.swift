//
//  AppCoordinator.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

import SwiftUI

enum Route: Hashable {
    case movieDetail(Movie)
}

@Observable
final class AppCoordinator {
    var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

//
//  NavigationManager.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import Foundation

class NavigationManager: ObservableObject {
    @Published var path = [Route]()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func isCurrentRoute(_ route: Route) -> Bool {
        return path.last == route
    }
}

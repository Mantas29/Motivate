//
//  TabBarViewModel.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import Foundation
import SwiftUI
import Combine

enum TabItem {
    case home
    case library
    case friends
    case settings
    
    var selectedIcon: Image {
        switch self {
        case .home:
            return Image(systemName: "house.fill")
        case .library:
            return Image(systemName: "list.dash")
        case .friends:
            return Image(systemName: "person.2.fill")
        case .settings:
            return Image(systemName: "gearshape.fill")
        }
    }
    
    var deselectedIcon: Image {
        switch self {
        case .home:
            return Image(systemName: "house")
        case .library:
            return Image(systemName: "list.dash")
        case .friends:
            return Image(systemName: "person.2")
        case .settings:
            return Image(systemName: "gearshape")
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .library:
            return "Library"
        case .friends:
            return "Friends"
        case .settings:
            return "Settings"
        }
    }
}

class TabBarViewModel: ObservableObject {
    
    @Published var selectedTabItem: TabItem = .home
    @Published var tabBarHeight: CGFloat = 0
    @Published var cameraClicked = false
    @Published var tabBarIsActive = true
}

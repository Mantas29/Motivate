//
//  TabBarView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import SwiftUI

private enum Const {
    static let photoButtonSize: CGFloat = 70
}

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

struct TabBarView: View {
    
    @State private var selectedTabItem: TabItem = .home
    @Binding var cameraClicked: Bool
    
    var body: some View {
        ZStack {
            HStack {
                ItemView(tabItem: .home, selectedTabItem: $selectedTabItem)
                Spacer()
                ItemView(tabItem: .library, selectedTabItem: $selectedTabItem)
                Spacer()
                    .frame(width: Const.photoButtonSize * 1.7)
                ItemView(tabItem: .friends, selectedTabItem: $selectedTabItem)
                Spacer()
                ItemView(tabItem: .settings, selectedTabItem: $selectedTabItem)
            }
            .setSmallPadding(.horizontal)
            .setExtraSmallPadding(.top)
            .setBigPadding(.bottom)
            .background(Color(hex: "c7eae4"))
            
            PhotoCircle(cameraClicked: $cameraClicked)
                .offset(y: -Const.photoButtonSize * 0.3)
        }
    }
}

private struct PhotoCircle: View {
    
    @Binding var cameraClicked: Bool
    
    var body: some View {
        Circle()
            .frame(width: Const.photoButtonSize, height: Const.photoButtonSize)
            .foregroundColor(Color(hex: "ffebeb"))
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 2, y: 2)
            .overlay(Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Const.photoButtonSize * 0.4)
                        .opacity(0.5))
            .onTapGesture {
                cameraClicked = true
            }
    }
}

private struct ItemView: View {
    
    let tabItem: TabItem
    @Binding var selectedTabItem: TabItem
    
    private var isSelected: Bool {
        selectedTabItem == tabItem
    }
    
    private var icon: Image {
        isSelected ? tabItem.selectedIcon : tabItem.deselectedIcon
    }
    
    var body: some View {
        VStack {
            icon
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(tabItem.title)
                .setRegularStyle()
        }
        .foregroundColor(isSelected ? .myRed : .black)
        .onTapGesture {
            selectedTabItem = tabItem
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(cameraClicked: .constant(false))
    }
}

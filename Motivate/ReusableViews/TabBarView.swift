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

struct TabBarView: View {
    
    var model: TabBarViewModel
    
    var body: some View {
        ZStack {
            HStack {
                ItemView(tabItem: .home, model: model)
                Spacer()
                ItemView(tabItem: .library, model: model)
                Spacer()
                    .frame(width: Const.photoButtonSize * 1.7)
                ItemView(tabItem: .friends, model: model)
                Spacer()
                ItemView(tabItem: .settings, model: model)
            }
            .setSmallPadding(.horizontal)
            .setExtraSmallPadding(.top)
            .setBigPadding(.bottom)
            .background(Color(hex: "c7eae4")
                            .overlay(GeometryReader { geometry in
                                Color.clear.onAppear {
                                    model.tabBarHeight = geometry.size.height
                                }
                            })
                            .edgesIgnoringSafeArea(.bottom))
            
            PhotoCircle(model: model)
                .offset(y: -Const.photoButtonSize * 0.3)
        }
        .align(.bottom)
    }
}

private struct PhotoCircle: View {
    
    var model: TabBarViewModel
    
    @State private var showAlert = false
    
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
                if MotivationGeneratorManager.shared.uiImage != nil {
                    showAlert = true
                    return
                }
                model.cameraClicked = true
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Would you like to take another photo?"),
                      message: Text("Currently taken picture will be lost"),
                      primaryButton: Alert.Button.default(Text("OK"), action: { model.cameraClicked = true }),
                      secondaryButton: Alert.Button.cancel()
            )})
    }
}

private struct ItemView: View {
    
    let tabItem: TabItem
    @ObservedObject var model: TabBarViewModel
    
    private var isSelected: Bool {
        model.selectedTabItem == tabItem
    }
    
    private var icon: Image {
        isSelected ? tabItem.selectedIcon : tabItem.deselectedIcon
    }
    
    private var color: Color {
        if !model.tabBarIsActive {
            return .gray
        }
        
        return isSelected ? .myRed : .black
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
        .foregroundColor(color)
        .onTapGesture {
            if model.tabBarIsActive {
                model.selectedTabItem = tabItem
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(model: TabBarViewModel())
    }
}

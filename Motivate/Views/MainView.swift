//
//  TabBarView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var userLoginManager: UserLoginManager
    @ObservedObject var model = TabBarViewModel()
    @ObservedObject var generator = MotivationGeneratorManager.shared
        
    var body: some View {
        ZStack {
            VStack {
                if generator.showPhotoPreview {
                    PhotoPreviewView() { generator.showPhotoPreview = false }
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                } else {
                    switch model.selectedTabItem {
                    case .home:
                        HomeView()
                    case .library:
                        LibraryView()
                    case .friends:
                        Text("FRIENDS")
                    case .settings:
                        VStack {
                            Text("SETTINGS")
                            Button(action: {
                                userLoginManager.signOut()
                            }, label: {
                                Text("Click here to sign out")
                            })
                        }
                    }
                }
            }
            .padding(.bottom, model.tabBarHeight)
            
            TabBarView(model: model)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .fullScreenCover(isPresented: $model.cameraClicked, content: {
            ImagePicker(sourceType: .camera) { image in
                generator.setImage(uiImage: image)
            }
            .edgesIgnoringSafeArea(.all)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

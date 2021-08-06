//
//  TabBarView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var userLoginManager: UserLoginManager
    @ObservedObject var tabBarViewModel = TabBarViewModel()
    @ObservedObject var model = MainViewModel()
    @ObservedObject var generator = MotivationGeneratorManager.shared
        
    var body: some View {
        ZStack {
            ZStack {
                switch tabBarViewModel.selectedTabItem {
                case .home:
                    HomeView(mainViewModel: model)
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
                
                if generator.showPhotoPreview {
                    PhotoPreviewView() { generator.showPhotoPreview = false }
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
            }
            .padding(.bottom, tabBarViewModel.tabBarHeight)
            
            TabBarView(model: tabBarViewModel, mainViewModel: model)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .fullScreenCover(isPresented: $model.presentImagePicker, content: {
            ImagePicker(sourceType: model.currentImagePickerType) { image in
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

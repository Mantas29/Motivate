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
    @ObservedObject var mainViewModel = MainViewModel()
        
    var body: some View {
        ZStack {
            ZStack {
                switch tabBarViewModel.selectedTabItem {
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
                
                if mainViewModel.presentPhotoPreview {
                    PhotoPreviewView() { mainViewModel.presentPhotoPreview = false }
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
            }
            .padding(.bottom, tabBarViewModel.tabBarHeight)
            
            TabBarView(tabBarViewModel: tabBarViewModel)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .environmentObject(mainViewModel)
        .fullScreenCover(isPresented: $mainViewModel.presentImagePicker, content: {
            ImagePicker(sourceType: mainViewModel.currentImagePickerType) { image in
                MotivationGeneratorManager.shared.setImage(uiImage: image)
                mainViewModel.presentPhotoPreview = true
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

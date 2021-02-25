//
//  TabBarView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import SwiftUI

struct MainView: View {
    
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
                        Text("HOME")
                    case .library:
                        Text("LIBRARY")
                    case .friends:
                        Text("FRIENDS")
                    case .settings:
                        Text("SETTINGS")
                    }
                }
            }
            .padding(.bottom, model.tabBarHeight)
            
            TabBarView(model: model)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .fullScreenCover(isPresented: $model.cameraClicked, content: {
            ImagePicker(selectedImage: $generator.uiImage, showPhotoPreview: $generator.showPhotoPreview, sourceType: .camera)
                .edgesIgnoringSafeArea(.all)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

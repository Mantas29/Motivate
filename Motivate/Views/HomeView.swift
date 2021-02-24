//
//  HomeView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
     
    var body: some View {
        VStack {
            Spacer()
            TabBarView(cameraClicked: $isShowPhotoLibrary)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .fullScreenCover(isPresented: $isShowPhotoLibrary, content: {
            ImagePicker(selectedImage: $image, sourceType: .camera)
                .edgesIgnoringSafeArea(.all)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State private var presentSourceTypeActionSheet = false
        
    var body: some View {
        ScrollView {
            VStack {
                HomeItem(title: createInspirationItemTitle, imageName: "nature") {
                    presentSourceTypeActionSheet = true
                }
                HomeItem(title: somethingElseItemTitle, imageName: "nature2") {
                    print("do something else")
                }
            }
        }
        .setSmallPadding(.vertical)
        .actionSheet(isPresented: $presentSourceTypeActionSheet) {
            ActionSheet(title: Text("Choose the source of you picture"),
                        buttons: [
                            .default(Text("Camera roll"), action: {
                                mainViewModel.presentImagePicker(type: .camera)
                            }),
                            .default(Text("Gallery"), action: {
                                mainViewModel.presentImagePicker(type: .photoLibrary)
                            }),
                            .cancel()
                        ])
        }
    }
    
    private var createInspirationItemTitle: some View {
        Text("Create an inspiration")
            .font(.dancingScript, size: 26)
            .foregroundColor(.white)
            .setBigPadding(.all)
            .align(.bottom, .trailing)
    }
    
    private var somethingElseItemTitle: some View {
        Text("Something else")
            .font(.longCang, size: 34)
            .foregroundColor(.white)
            .setBigPadding(.all)
            .align(.bottom, .leading)
    }
}

private struct HomeItem<Title: View>: View {
    
    let title: Title
    let imageName: String
    let clickAction: () -> Void
    
    var body: some View {
        Button {
            clickAction()
        } label: {
            ZStack {
                GeometryReader { geometry in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 200)
                        .cornerRadius(8)
                }
                title
            }
            .frame(height: 200)
            .setSmallPadding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

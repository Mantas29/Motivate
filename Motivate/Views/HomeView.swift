//
//  HomeView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct HomeView: View {
        
    var body: some View {
        ScrollView {
            VStack {
                HomeItem(title: createInspirationItem, imageName: "nature")
                HomeItem(title: somethingElseItem, imageName: "nature2")
            }
        }
        .setSmallPadding(.vertical)
    }
    
    private var createInspirationItem: some View {
        Text("Create an inspiration")
            .font(.dancingScript, size: 26)
            .foregroundColor(.white)
            .setBigPadding(.all)
            .align(.bottom, .trailing)
    }
    
    private var somethingElseItem: some View {
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
    
    var body: some View {
        Button {
            print("Clicked")
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

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
            HomeItem(title: "Create an inspiration", imageName: "nature")
        }
        .setSmallPadding(.vertical)
    }
}

private struct HomeItem: View {
    
    let title: String
    let imageName: String
    
    var body: some View {
        Button {
            print("Clicked")
        } label: {
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                Text(title)
                    .font(.dancingScript, size: 26)
                    .foregroundColor(.white)
                    .setBigPadding(.all)
                    .align(.bottom, .trailing)
            }
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

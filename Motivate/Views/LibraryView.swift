//
//  LibraryView.swift
//  Motivate
//
//  Created by T1001 on 2021-03-11.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        Button(action: {
            Networking.request()
        }, label: {
            Text("Make HTTP request")
        })
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

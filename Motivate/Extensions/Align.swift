//
//  Align.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

extension View {
    func align(_ edges: Edge.Set...) -> some View {
        VStack {
            if edges.contains(.bottom) { Spacer() }
            HStack {
                if edges.contains(.trailing) { Spacer() }
                self
                if edges.contains(.leading) { Spacer() }
            }
            if edges.contains(.top) { Spacer() }
        }
    }
}

//
//  Backgrounds.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct MainBackground: View {
    var body: some View {
        ZStack {
            Color.myWhite
            BackgroundShape()
                .fill(Color.myElectric)
                .frame(height: EnvironmentInfo.screenHeight * 0.8)
                .align(.bottom)
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct BackgroundShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.maxX, y: -rect.maxY * 0.05),
                      control1: CGPoint(x: rect.width * 0.4, y: rect.height * 0.1),
                      control2: CGPoint(x: rect.width * 0.6, y: rect.height * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

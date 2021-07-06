//
//  View.swift
//  Motivate
//
//  Created by T1001 on 2021-02-26.
//

import SwiftUI

private enum Const {
    static let dragThreshold: CGFloat = 130
}

extension View {
    func addDragToCloseGesture(yOffset: Binding<CGFloat>, closeAction: @escaping () -> Void) -> some View {
        opacity(Double(1 - (yOffset.wrappedValue - Const.dragThreshold) / 300))
        .offset(y: yOffset.wrappedValue)
        .gesture(
            DragGesture()
                .onChanged { gesture  in
                    if gesture.translation.height > 0 {
                        yOffset.wrappedValue = gesture.translation.height / 1.3
                    }
                }
                .onEnded({ _ in
                    withAnimation(.spring()) {
                        if yOffset.wrappedValue > Const.dragThreshold {
                            closeAction()
                        } else {
                            yOffset.wrappedValue = .zero
                        }
                    }
                }))
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

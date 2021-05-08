//
//  ActivityIndicator.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct LoadingView: View {
    var body: some View {
        GeometryReader { geometry in
            Spacer()
                VStack {
                    Text("Loading")
                        .kerning(-0.525)
                        .font(.custom(Assests.Font.helveticaBold, size: 16))
                    ActivityIndicator(style: .large)
                }
                .padding(20)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Assests.Color.background)
                .foregroundColor(Assests.Color.titleColor)
                .cornerRadius(20)
               Spacer()
        }
    }
}

//
//  Font+Extensions.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import SwiftUI

struct CustomFont: ViewModifier {
    var name: String
    var size: CGFloat
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension Text {
    func addKerning(value: CGFloat) -> some View {
        self.kerning(value)
    }
}

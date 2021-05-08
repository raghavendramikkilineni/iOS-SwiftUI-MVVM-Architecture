//
//  View+Extensions.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import Combine
import SwiftUI

extension View {
    func anyView() -> AnyView {
        AnyView(self)
    }
}

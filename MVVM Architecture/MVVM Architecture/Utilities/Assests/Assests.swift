//
//  Assests.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import SwiftUI

struct Assests {
    
    struct Color {
        
    }
    
    struct Font {
        static func displayAll() {
            for family in UIFont.familyNames.sorted() {
                let names = UIFont.fontNames(forFamilyName: family)
                print("Family: \(family) Font names: \(names)")
            }
        }
    }
}

//MARK: Color
extension Assests.Color {
    static var titleColor: Color { Color(#function) }
    static var barColor: Color { Color(#function) }
    static var cellBackground: Color { Color(#function) }
    static var background: Color { Color(#function) }
}

//MARK: Fonts
extension Assests.Font {
    static var helveticaLight: String { "HelveticaNeue-Light" }
    static var helveticaMedium: String { "HelveticaNeue-Medium" }
    static var helveticaBold: String { "HelveticaNeue-Bold" }
    static var helveticaCondensedBold: String { "HelveticaNeue-CondensedBold" }
}


//
//  EmptyListView.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//
import SwiftUI

struct EmptyListView: View {
    var title: String
    var iconName: String
    
    var body: some View {
        GeometryReader { geometry  in
            VStack {
                Text(title)
                    .foregroundColor(Assests.Color.titleColor)
                    .kerning(-0.525)
                    .font(.custom(Assests.Font.helveticaBold, size: 20))
                    .padding(15)
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(title: "List is Empty!", iconName: "xmark.octagon")
    }
}

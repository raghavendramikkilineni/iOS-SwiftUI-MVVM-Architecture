//
//  UsersList.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import SwiftUI

struct UsersList<Content>: View where Content: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                self.content()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
            .background(Assests.Color.background)
        }
    }
}

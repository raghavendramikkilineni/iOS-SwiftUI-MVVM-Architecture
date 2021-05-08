//
//  UsersCell.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import SwiftUI

struct UserCell: View {
    var favoriteTapped: () -> Void
    var user: UserPresentationModel
    
    private var cellContent: some View {
        HStack {
            Rectangle()
                .frame(width: 3, alignment: .leading)
                .background(Color.clear)
                .foregroundColor(Color.clear)
            
            VStack(alignment: .leading, spacing: 1.5) {
                Text(user.name)
                    .addKerning(value: UserCell.kerningValue)
                    .modifier(CustomFont(name: Assests.Font.helveticaBold, size: UserCell.size16))
                    .foregroundColor(Assests.Color.titleColor)
                Text(user.companyName)
                    .addKerning(value: UserCell.kerningValue)
                    .modifier(CustomFont(name: Assests.Font.helveticaMedium, size: UserCell.size14))
                    .foregroundColor(Assests.Color.titleColor)
                Text(user.email)
                    .addKerning(value: UserCell.kerningValue)
                    .modifier(CustomFont(name: Assests.Font.helveticaLight, size: UserCell.size14))
                    .foregroundColor(Assests.Color.titleColor)
                
                HStack {
                    Text(user.address)
                        .addKerning(value: UserCell.kerningValue)
                        .modifier(CustomFont(name: Assests.Font.helveticaCondensedBold, size: UserCell.size14))
                        .foregroundColor(Assests.Color.titleColor)
                    Spacer()
                    Image(systemName: user.isFavorite ? "heart.fill" : "heart").imageScale(.large)
                        .foregroundColor(Assests.Color.titleColor)
                        .onTapGesture {
                            favoriteTapped()
                        }
                }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Assests.Color.cellBackground)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, y: 2)
    }
    
    var body: some View {
        cellContent
    }
    
    static let kerningValue: CGFloat = -0.525
    static let size16: CGFloat = 16
    static let size14: CGFloat = 14
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(favoriteTapped: {}, user: UserPresentationModel.loadMock())
    }
}

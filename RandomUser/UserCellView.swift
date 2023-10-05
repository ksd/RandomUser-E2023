//
//  UserCellView.swift
//  RandomUser
//
//  Created by ksd on 21/09/2023.
//

import SwiftUI

struct UserCellView: View {
    @Binding var user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: user.picture.large) { image in
                AvatarView(image: image)
            } placeholder: {
                ProgressView()
            }
            
            Text(user.fullName)
                .padding()
            

        }
    }
}


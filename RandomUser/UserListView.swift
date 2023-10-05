//
//  UserListView.swift
//  RandomUser
//
//  Created by ksd on 21/09/2023.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var stateController: StateController
    
    var body: some View {
        List($stateController.users) { $user in
            UserCellView(user: $user)
                .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    UserListView().environmentObject(StateController())
}

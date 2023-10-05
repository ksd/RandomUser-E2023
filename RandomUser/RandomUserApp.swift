//
//  RandomUserApp.swift
//  RandomUser
//
//  Created by ksd on 21/09/2023.
//

import SwiftUI

@main
struct RandomUserApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView().environmentObject(StateController())
        }
    }
}

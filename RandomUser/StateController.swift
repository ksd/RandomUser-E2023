//
//  StateController.swift
//  RandomUser
//
//  Created by ksd on 21/09/2023.
//

import SwiftUI

class StateController: ObservableObject {
    @Published var users: [User] = []
    
    init(){
        guard let randomUserURL  = URL(string: "https://randomuser.me/api/?nat=DK&results=50") else {return}
        fetchUsers(from: randomUserURL)
    }
    
    private func fetchUsers(from url: URL) {
        Task(priority: .low){
            guard let rawUserData = await NetworkService.getData(from: url) else {return}
            let decoder = JSONDecoder()
            do {
                let randomUserResult = try decoder.decode(RandomUserResult.self, from: rawUserData)
                Task.detached { @MainActor in
                    self.users = randomUserResult.results
                }
               
            } catch {
                fatalError("Konverteringen fra JSON gik ad helvede til")
            }
        }
    }
}

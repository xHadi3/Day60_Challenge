//
//  ContentView.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 25/08/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    var body: some View {
        NavigationStack{
            List(users){ user in
                NavigationLink(destination: UserDetailView(user: user)){
                    VStack(alignment:.leading){
                        Text(user.name).font(.headline)
                        Text(String(user.age)).font(.subheadline).foregroundColor(.gray)
                    }

                }
            }
            .navigationTitle("Users")
            
                .task{
                    do{
                        users = try await UserService.fetchUsers()
                        
                    }catch{
                        print("Failed to decode users: \(error)")
                    }
                }
            
        }
    }
}

#Preview {
    ContentView()
}

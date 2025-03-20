//
//  ContentView.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 25/08/1446 AH.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var users: [User]
    
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
                        if(users.isEmpty){
                            let users = try await UserService.fetchUsers()
                            
                            for user in users{
                                context.insert(user)
                            }
                            print("loading data ....")
                        }
                       
                    }catch{
                        print("Failed to decode users: \(error)")
                    }
                }
            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [User.self, Friend.self])
}

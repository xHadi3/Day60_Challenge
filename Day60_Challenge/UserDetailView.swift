//
//  UserDetailView.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 19/09/1446 AH.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Age: \(user.age)")
                    .font(.title2)
                
                Text("Friends:")
                    .font(.headline)
                
                ForEach(user.friends){ friend in
                    Text(friend.name)
                        .font(.body)
                }
            }
            
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
        }
        .navigationTitle("Details")
       
    }
}

#Preview {
    UserDetailView(user: User(id: "", name: "", age: 1, company: "", friends: []))  .modelContainer(for: User.self)
}

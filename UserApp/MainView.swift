//
//  MainView.swift
//  UserApp
//
//  Created by Gabriel Lourenço on 10/08/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: NewUserView()){
                    Text("Novo Usuário")
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                }
                .padding()
                
                NavigationLink( destination: UserListView()){
                    Text("Lista de Usuários")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Menu Principal")
        }
    }
}

#Preview {
    MainView()
}

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
                    Text("Novo Usuário").foregroundStyle(.white)
                }
                .padding()
                .frame(width:200 ,height: 50)
                .background(.blue)
                .cornerRadius(8)
                .padding()
                
                NavigationLink( destination: UserListView()){
                    Text("Lista de Usuários").foregroundStyle(.white)
                }
                .padding()
                .frame(width:200 ,height: 50)
                .background(.green)
                .cornerRadius(8)
                .padding()
            }
            .navigationTitle("Menu Principal")
        }
    }
}

#Preview {
    MainView()
}

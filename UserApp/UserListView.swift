//
//  UserListView.swift
//  UserApp
//
//  Created by Gabriel Lourenço on 10/08/24.
//

import SwiftUI
import Alamofire

struct UserListView: View {
    @State var users: [UserModel] = []
    @State var errorMessage: String?
    
    var body: some View {
        VStack{
            Text("Usuários")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding()
                .multilineTextAlignment(.center) // Centraliza o texto
                .lineLimit(1).padding(50)
            
            List(users){ user in
                VStack (alignment:.leading){
                    Text("ID:").font(.title).foregroundStyle(.green) + Text(" \(user.id)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Nome: ").font(.headline).foregroundColor(.green) + Text(user.name)
                    Text("Idade: ").font(.headline).foregroundColor(.green) + Text("\(user.age)")
                    Text("Documento: ").font(.headline).foregroundColor(.green) + Text(user.document)
                    Text("Endereço: ").font(.headline).foregroundColor(.green) + Text(user.address)
                }.padding()
            }.listStyle(PlainListStyle())
            .onAppear{
                callApi()
            }
        }
    }
    
    func callApi(){
        AF.request("http://localhost:8000/user/list").responseDecodable(of: [UserModel].self){
            response in self.users = response.value ?? []
            self.errorMessage = response.error?.localizedDescription ?? ""
            }
        }
    }

#Preview {
    UserListView()
}

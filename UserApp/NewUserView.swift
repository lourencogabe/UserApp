//
//  NewUserView.swift
//  UserApp
//
//  Created by Gabriel Lourenço on 10/08/24.
//

import SwiftUI
import Alamofire

struct NewUserView: View {
    @State var newId: Int = 0
    @State var newName: String = ""
    @State var newAge: Int = 0
    @State var newDocument: String = ""
    @State var newAddress: String = ""
    @State var errorMessage: String = ""
    
    var body: some View {
        VStack{
            Text("Novo Usuário")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
                .multilineTextAlignment(.center) // Centraliza o texto
                .lineLimit(1).padding(50)
            TextField("ID: ", value: $newId, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Nome: ", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Idade: ", value: $newAge, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Documento: ", text: $newDocument)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Endereço: ", text: $newAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                createUser()
            }){
                Text("Criar")
                    .font(.headline)
                    .foregroundColor(.white)
            }.frame(width:250 ,height: 50)
                .background(Color.blue)
                .cornerRadius(10).padding(50)
        }
    }
    
    func createUser(){
        let newUser = UserModel(id: newId, name: newName, age: newAge, document: newDocument, address: newAddress)
        let urlApi = "http://localhost:8000/user/create"
        
        AF.request(urlApi, method: .post, parameters: newUser, encoder: JSONParameterEncoder.default).response{
            response in self.errorMessage = response.error?.localizedDescription ?? "Usuário criado com sucesso!"
        }
    }
}

#Preview {
    NewUserView()
}

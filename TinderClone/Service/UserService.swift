//
//  UserService.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 15/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    let users: [User] = [
      User(id: 101, name: "Maria Silva", age: 19, match: true, slogan: "O último a dar match chama", photo: "pessoa-1"),
      User(id: 102, name: "Debora Lima", age: 25, match: false, slogan: "Deu like sem querer?", photo: "pessoa-2"),
      User(id: 103, name: "Sandra Souza", age: 24, match: false, slogan: "Acho q a gente combina", photo: "pessoa-3"),
      User(id: 104, name: "Anna Beatriz", age: 22, match: true, slogan: "Não bebo não fumo e não curto balada", photo: "pessoa-4"),
      User(id: 105, name: "Laura Oliveira", age: 26, match: true, slogan: "Quer saber mais sobre mim?", photo: "pessoa-5"),
      User(id: 106, name: "Silva Paz", age: 19, match: false, slogan: "Se não for conversar nem dá like", photo: "pessoa-6"),
      User(id: 107, name: "Debora Lima", age: 25, match: false, slogan: "Em busca de novas amizades", photo: "pessoa-7"),
      User(id: 108, name: "Sandra Souza", age: 24, match: true, slogan: "photos sem camisa não me impressionam", photo: "pessoa-8"),
      User(id: 109, name: "Tah Beatriz", age: 22, match: false, slogan: "Oi pelo visto a gente combina", photo: "pessoa-9"),
      User(id: 110, name: "Laura Oliveira", age: 26, match: true, slogan: "Procurando um bom papo", photo: "pessoa-10"),
      User(id: 111, name: "Sabrina Santos", age: 21, match: false, slogan: "Quem se descreve se limita", photo: "pessoa-11"),
      User(id: 112, name: "Amelia Margaret", age: 30, match: false, slogan: "Não quero nada casual", photo: "pessoa-12"),
      User(id: 113, name: "Laura Komako", age: 26, match: true, slogan: "Bom humor é fundamental", photo: "pessoa-13"),
      User(id: 114, name: "Rosa Oliveira", age: 25, match: false, slogan: "Não sei me descrever", photo: "pessoa-14"),
      User(id: 115, name: "Nadia Joana", age: 20, match: false, slogan: "Quer saber mais? é só dar like", photo: "pessoa-15"),
      User(id: 116, name: "Mary Dandara", age: 20, match: false, slogan: "Tenho um relacionamento aberto", photo: "pessoa-16"),
      User(id: 117, name: "Anita Eleanor", age: 23, match: false, slogan: "Bonita demais pra ser verdade", photo: "pessoa-17"),
      User(id: 118, name: "Helen Aung San", age: 24, match: true, slogan: "Espero q vc seja mente aberta", photo: "pessoa-18"),
      User(id: 119, name: "Laura Nelle", age: 18, match: false, slogan: "Estou aqui para fazer novas amizades", photo: "pessoa-19"),
      User(id: 120, name: "Maria Virginia", age: 18, match: false, slogan: "Adoro balada", photo: "pessoa-20")
    ]
    
    func getUsers(completion: @escaping ([User]?, Error?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(self.users, nil)
        }
    }
}

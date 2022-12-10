//
//  User.swift
//  LogInAppNew
//
//  Created by Sergey Kosichkin on 10.12.2022.
//

struct User {
    let login: String
    let password: String
    let data: Person
    
    static func getUser() -> User {
        User(login: "n",
             password: "m",
             data: Person(name: "Sergey",
                          surname: "Kosichkin",
                          age: 25,
                          profession: "Engineer",
                          desiredProfession: "Software Engineer"))
    }
}


struct Person {
    let name: String
    let surname: String
    let age: Int
    let profession: String
    let desiredProfession: String
    
    var fullName: String {
        name + " " + surname
    }
}

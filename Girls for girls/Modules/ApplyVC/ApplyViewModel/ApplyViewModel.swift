//
//  ApplyViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 10/4/23.
//

import Foundation

//class ApplyViewModel {
//    
//    // MARK: Запрос на Добавление Заявки
//    
//    func postApplications(fullName:String, dateOfBirth: String, email: String, address: String, workFormat: String, motivation: String, aboutMe:String, achievements: String, myFails: String, mySkills: String, mentorProgramId: String, completion: @escaping ()-> Void) {
//        let aplications = ["fullName":"\(fullName)",
//                           "dateOfBirth":"\(dateOfBirth)",
//                           "email": "\(email)",
//                           "address":"\(address)",
//                           "workFormat":"\(workFormat)",
//                           "motivation":"\(motivation)",
//                           "aboutMe": "\(aboutMe)",
//                           "achievements":"\(achievements)",
//                           "myFails":"\(myFails)",
//                           "mySkills":"\(mySkills)",
//                           "mentorProgramId":"\(mentorProgramId)"].toData()
//        NetworkManager().sendRequest(urlRequest: Register.postApplications(aplications: aplications).makeUrlRequest()) { response in
//            switch response {
//            case .success(let string):
//                print(string)
//                completion()
//            case .unauthorized(let string):
//                print(string)
//            case .forebidden(let string):
//                print(string)
//            case .notfound(let string):
//                print(string)
//            case .badrequest(let string):
//                print(string)
//            case .failerror(let string):
//                print(string)
//            }
//        }
//    }
//}

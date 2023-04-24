//
//  ImageServices.swift
//  Girls for girls
//
//  Created by Adinay on 24/4/23.
//

import Foundation

//class ImageServices {
//    
//    static let shared = ImageServices()
//    
//    func downloadImage(from url: URL) {
//        contentMode = .scaleAspectFit
//        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                  let data = data , error == nil,
//                  let image = UIImage(data: data)
//            else {
//                print("Произошла ошибка при доступе к изображению с URL-адреса")
//                return
//            }
////           DispatchQueue.main.async { [weak self] in
////                self?.image = image
////            }
//        })
//        dataTask.resume()
//    }
//}

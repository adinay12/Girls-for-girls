//
//  ExtensionUIImageView.swift
//  Girls for girls
//
//  Created by Adinay on 18/4/23.
//

import UIKit

//extension UIImageView {
//    func downloadImage(from url: URL) {
//        contentMode = .scaleToFill
//        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                  let myType = response?.mimeType, myType.hasPrefix("image"),
//                  let data = data , error == nil,
//                  let image = UIImage(data: data)
//            else {
//                print("Произошла ошибка при доступе к изображению с URL-адреса \(String(describing: error))")
//                return
//            }
//            
//            DispatchQueue.main.async {
//                self.image = image
//            }
//                    
//        })
//        
//        dataTask.resume()
//    }
//}

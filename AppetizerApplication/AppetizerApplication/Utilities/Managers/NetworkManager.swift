//
//  NetworkManager.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/25/24.
//

import UIKit
import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    private let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            print("Error1")
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response, error in
            if let _ = error {
                print("Error2")
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error3")

                completed(.failure(.invalidResponse))
                
                return
            }
            guard let data = data else{
                print("Error4")

                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        //Check if URL object can be created from the string
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let cacheKey = NSString(string: urlString)
        
        //If image is already stored in the cache
        if let image = cache.object(forKey: cacheKey){
            completed(image)
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            
            guard let data = data, let image = UIImage(data: data)else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        task.resume()
  
        
    }
    
}

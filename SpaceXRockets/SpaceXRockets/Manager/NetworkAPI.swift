//
//  NetworkAPI.swift
//  SpaceXRockets
//
//  Created by Spiky WU7 on 30.05.2022.
//

import Foundation

protocol RocketsAPIDelegate {
    func updateRocketsInfo(_ networkManager: NetworkAPI, rockets: RocketData)
}

class NetworkAPI {
    
    let spacexDataURL = "https://api.spacexdata.com/v4/rockets"
    private let decoder = JSONDecoder()
    private let dateFormater = DateFormatter()
    private let session = URLSession(configuration: .default)
    
    var delegate: RocketsAPIDelegate?
    
    func fetchDataForRockets<T: Decodable>(dataType: T.Type, url: String, formaterString: String, completion: @escaping(T) -> Void) {
        guard let urlString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, _, error in
            guard let data = data else {
                print(error ?? "error getting data")
                return
            }
            do {
                self.dateFormater.dateFormat = formaterString
                self.decoder.dateDecodingStrategy = .formatted(self.dateFormater)
                let type = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(type)
                }
            } catch {
                print("Error fetching data - \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringUrl = url else { return nil }
        guard let imageURL = URL(string: stringUrl) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
}

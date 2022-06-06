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
    private let session = URLSession(configuration: .default)
    
    var delegate: RocketsAPIDelegate?
    
    func fetchDataForRockets(completion: @escaping (Result<[RocketModel]?, Error>) -> Void ){
        guard let url = URL(string: spacexDataURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Response error \(error)")
            }
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode([RocketModel].self, from: data)
                completion(.success(json))
            } catch {
                print("Parsing error: \(error)")
            }
        }.resume()
    }
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringUrl = url else { return nil }
        guard let imageURL = URL(string: stringUrl) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
}

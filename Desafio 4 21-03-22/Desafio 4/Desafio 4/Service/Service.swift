//
//  Service.swift
//  Desafio 4
//
//  Created by Felipe Brigagão de Almeida on 21/03/22.
//

import Foundation

enum PersonalityError: Error {
    case invalidURL
    case noDataAvailable
    case onProcessData
}

protocol ServiceProtocol {
    func getPersonalities(completion: @escaping(Result<[Personality], PersonalityError>) -> Void)
}

class Service: ServiceProtocol {
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    static var shared: Service = {
        let instance = Service()
        
        return instance
    }()
    
    func getPersonalities(completion: @escaping (Result<[Personality], PersonalityError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.invalidURL)) }
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode([Personality].self, from: jsonData)
                completion(.success(userResponse))
            } catch {
                completion(.failure(.onProcessData))
            }
        }
        
        dataTask.resume()
    }
}

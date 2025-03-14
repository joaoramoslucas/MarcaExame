//
//  WebService.swift
//  Vollmed
//
//  Created by Joao Lucas on 26/02/25.
//

import UIKit

struct WebService {
    
    private let baseURL = "http://localhost:3000"
    
    let imageCache = NSCache<NSString, UIImage>()
    
    func donwloadImage(from imageURL: String) async throws -> UIImage? {
        
        guard let url = URL(string: imageURL) else {
            print("Erro ao fazer a requisicao das imagens")
            return nil
        }
        
        if let cachedImage = imageCache.object(forKey: imageURL as NSString) {
                print("Imagem carregada do cache")
                return cachedImage
        } else {
            print("Imagem baixada da internet")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
           guard let image = UIImage(data: data) else {
               return nil
           }
        
        imageCache.setObject(image, forKey: imageURL as NSString)
        
        return image
    }
    
    func getAllSpecialists() async throws -> [Specialist]? {
        let endpoint = baseURL + "/especialista"
        
        guard let url = URL(string: endpoint) else {
            print("Erro ao criar URL")
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let specialists = try JSONDecoder().decode([Specialist].self, from: data)
        
        return specialists
    }
}

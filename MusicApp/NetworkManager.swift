//
//  NetworkManager.swift
//  MusicApp
//
//  Created by Manu on 02/06/23.
//

import Foundation


class NetworkManager {
    func getMusicList(urlString: String, searchString: String, completion: @escaping (_ data: MusicModel?, _ isError: Bool)-> Void){
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil, true)
                return
            }
            
            guard error == nil else{
                completion(nil, true)
                return
            }
            let decoder = JSONDecoder()
            
            do{
                let data = try decoder.decode(MusicModel.self, from: data)
                completion(data, false)
            }catch {
                print(error.localizedDescription)
                completion(nil, true)
            }
        }.resume()
    }
}

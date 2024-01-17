//
//  SearchBarViewModel.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 17/01/2024.
//

import Foundation

class SearchBarViewModel: ObservableObject {
    static let shared = SearchBarViewModel()
    @Published var flickrPhotos: [Photo] = []
    
    func searchPhotos(for query: String, page: Int, completion: @escaping (Bool) -> Void) {
        self.flickrPhotos = []
        guard let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=13a6dc3855f61a1b29cc785754781ce1&format=json&nojsoncallback=1&per_page=30&page=\(page)&safe_search=1&text&tags='\(query)'&sort=relevance&extras=tags") else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(FlickrPhotosInfoResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        for photo in response.photosInfo.photos {
                            self.flickrPhotos.append(photo)
                            
                        }
                        
                        completion(true)
                        print(self.flickrPhotos.first?.tagsArray)
                        
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(false)
                }
            } else if let error = error {
                print("Error making API request: \(error)")
                completion(false)
            }
        }
        .resume()
        
        
    }
    
    
}




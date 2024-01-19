//
//  UserInfoViewModel.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import Foundation

class UserInfoViewModel : ObservableObject {
    
    
    static let shared = UserInfoViewModel()
    
    @Published var userPhotos: [UsersPhotoModel] = []
    
    func searchPhotos(for userID: String, page: Int, completion: @escaping (Bool) -> Void) {
        self.userPhotos = []
        guard let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.people.getphotos&api_key=13a6dc3855f61a1b29cc785754781ce1&format=json&nojsoncallback=1&user_id=\(userID)") else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(UserPhotosInfoResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        for photo in response.photosInfo.photos{
                            self.appendUserDataToPhoto(photo: photo){photoResponse in
                                self.appendExtraPhotoData(photo: photoResponse){photo in
                                    self.userPhotos.append(photo)
                                    
                                }
                                
                            }
                            
                        }
                        
                        completion(true)
                        
                        
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
    
    func appendUserDataToPhoto(photo : UsersPhotoModel, completion: @escaping (UsersPhotoModel) -> Void)  {
        guard let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.people.getInfo&api_key=13a6dc3855f61a1b29cc785754781ce1&format=json&nojsoncallback=1&user_id=\(photo.owner)") else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(UserInfoResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        let userInfo = response.person
                        
                        completion(UsersPhotoModel(title: photo.title, farm: photo.farm, id: photo.id, secret: photo.secret, server: photo.server, owner: photo.owner, userInfo: userInfo))
                        
                        
                        
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    
                }
            } else if let error = error {
                print("Error making API request: \(error)")
                
            }
        }
        .resume()
        
    }
    
    func appendExtraPhotoData(photo : UsersPhotoModel, completion: @escaping (UsersPhotoModel) -> Void)  {
        guard let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=13a6dc3855f61a1b29cc785754781ce1&format=json&nojsoncallback=1&photo_id=\(photo.id)") else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(AdditionalPhotoDetailsResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        let additionalDetails = response.photo
                        
                        completion(UsersPhotoModel(title: photo.title, farm: photo.farm, id: photo.id, secret: photo.secret, server: photo.server, owner: photo.owner, userInfo: photo.userInfo, additionalDetails: additionalDetails))
                        
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    
                }
            } else if let error = error {
                print("Error making API request: \(error)")
                
            }
        }
        .resume()
        
    }
    
    
    
}

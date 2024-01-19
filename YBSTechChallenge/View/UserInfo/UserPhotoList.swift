//
//  UserPhotoList.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import SwiftUI

struct UserPhotoList : View {
    @EnvironmentObject var userViewModel : UserInfoViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(userViewModel.userPhotos, id: \.self){photo in
                
                if let userInfo = photo.userInfo,
                   let additionalDetails = photo.additionalDetails {
                    
                    
                    var Newphoto = Photo(title: photo.title, farm: photo.farm, id: photo.id, secret: photo.secret, server: photo.server, tags: "", owner: photo.owner, userInfo: userInfo, additionalDetails: additionalDetails )
                    
                    
                    PhotoCard(tags: false, photo: Newphoto)
                }
                
            }
        }
    }
}

#Preview {
    UserPhotoList().environmentObject(UserInfoViewModel())
}

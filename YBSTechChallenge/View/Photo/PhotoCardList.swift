//
//  PhotoList.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 17/01/2024.
//

import SwiftUI


struct PhotoCardList : View {
    @EnvironmentObject var searchBarViewModel : SearchBarViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(searchBarViewModel.flickrPhotos, id: \.self){photo in
                PhotoCard(tags: true, photo: photo)
            }
        }
    }
}

#Preview {
    PhotoCardList()
}

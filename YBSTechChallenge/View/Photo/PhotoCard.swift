//
//  PhotoCard.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 17/01/2024.
//

import SwiftUI

struct PhotoCard: View {
    @EnvironmentObject var searchBarViewModel : SearchBarViewModel
    var photo : Photo
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: screenWidth * 0.9, height: screenWidth * 1.1)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)
            
            VStack(alignment: .leading){
                PhotoImg(imgURL: photo.imageURL)
                Spacer()
                Text("\(photo.title)").padding(.horizontal).font(.system(size: 23, weight: .semibold))
                
            }.frame(width: screenWidth * 0.9, height: screenWidth * 1.1)
        }
    }
}

struct PhotoImg : View {
    var imgURL : URL
    var body: some View {
        AsyncImage(url: imgURL){image in
            image.resizable()
                .frame(width: screenWidth * 0.9, height: screenWidth * 0.8)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        
    placeholder: {
        ProgressView().frame(width: screenWidth * 0.9, height: screenWidth * 0.8)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    }
}



#Preview {
    PhotoCard(photo: Photo(title: "Example image", farm: 66, id: "53469764284", secret: "f910a8b00c", server: "65535", tags: "farmland tree pylon sky cloud northyorkshire"))
}

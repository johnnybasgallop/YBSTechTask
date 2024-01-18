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
                .frame(width: screenWidth * 0.9, height: screenWidth * 1.3)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)
            
            VStack(alignment: .leading){
                if let userInfo = photo.userInfo{
                    ProfileSection(imgURL: userInfo.profileURL, content: userInfo.username.content)
                    
                    PhotoImg(imgURL: photo.imageURL)
                    Spacer()
                    Text("\(photo.title)").padding(.horizontal).font(.system(size: 23, weight: .semibold))
                }
                
                
                
            }.frame(width: screenWidth * 0.9, height: screenWidth * 1.3)
        }
        
    }
}

struct PhotoImg : View {
    var imgURL : URL
    var body: some View {
        AsyncImage(url: imgURL){image in
            image.resizable()
                .frame(width: screenWidth * 0.9, height: screenWidth * 0.8)
        }
        
    placeholder: {
        ProgressView().frame(width: screenWidth * 0.9, height: screenWidth * 0.8)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    }
}

struct ProfileSection : View {
    var imgURL : URL
    var content : String
    var body: some View {
        
        Button(action: {
            
        }, label: {
            HStack{
                AsyncImage(url: imgURL){image in
                    image.resizable()
                        .frame(width: screenWidth * 0.1, height: screenWidth * 0.1)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
            placeholder: {
                ProgressView().frame(width: screenWidth * 0.9, height: screenWidth * 0.8)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
                
                Text(content).padding(.horizontal,2).font(.system(size: 18, weight: .semibold)).foregroundColor(.black)
            }.padding()
        })
        
    }
}



#Preview {
    PhotoCard(photo: Photo(title: "Example image", farm: 66, id: "53469764284", secret: "f910a8b00c", server: "65535", tags: "farmland tree pylon sky cloud northyorkshire", owner: "27813073@N03", userInfo: UserInfo(nsid: "27813073@N03", iconServer: "4784", iconFarm: 5, username: Username(content: "Example Username123"))))
}

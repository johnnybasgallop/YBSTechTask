//
//  PhotoInfoView.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import SwiftUI

struct PhotoInfoView: View {
    var photo : Photo
    var tags : Bool
    var body: some View {
        
        if let photoDetails = photo.additionalDetails{
            
            NavigationView{
                VStack(alignment: .leading){
                    infoViewImage(imgURL: photo.imageURL)
                    
                    Text("\(photo.title)").padding(.horizontal).font(.system(size: 23, weight: .semibold)).foregroundColor(.black)
                    if tags{
                        tagsList(tags: photo.tagsArray, max: 3).padding(.vertical)
                    }
                    Text("Uploaded: \(photoDetails.formattedDate)").padding(.horizontal).foregroundColor(.gray)
                    
                    Text("\(photoDetails.description.description)").padding().foregroundColor(.black).font(.system(size: 20))
                    Spacer()
                }
            }.navigationTitle(photo.title)
        }
    }
}

struct infoViewImage : View {
    var imgURL : URL
    var body: some View {
        AsyncImage(url: imgURL){image in
            image.resizable()
                .frame(width: screenWidth, height: screenWidth)
        }placeholder: {
            ProgressView()
        }.padding(.vertical,10)
    }
}

#Preview {
    PhotoInfoView(photo: Photo(title: "Example image", farm: 66, id: "53469764284", secret: "f910a8b00c", server: "65535", tags: "farmland tree pylon sky cloud northyorkshire", owner: "27813073@N03", userInfo: UserInfo(nsid: "27813073@N03", iconServer: "4784", iconFarm: 5, username: Username(content: "Example Username123")), additionalDetails: AdditionalPhotoDetails(dateUploaded: "1705665092", description: Description(description: "Elevate your space with custom-made blah ablsw  ioiwfb efbouef e heoifnewj behwoifnew fuewbhfoiew fewouhfioew ewh foiew f"))), tags: true)
}

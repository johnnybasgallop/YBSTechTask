//
//  UserInfoView.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import SwiftUI

struct UserInfoView: View {
    @EnvironmentObject var userViewModel : UserInfoViewModel
    var photo : Photo
    var body: some View {
        
        VStack{
            UserPhotoList().environmentObject(userViewModel)
            
        }.onAppear{
            userViewModel.searchPhotos(for: photo.owner, page: 1){success in
                if success{
                    print("loaded")
                }
            }
        }
    }
}

#Preview {
    UserInfoView( photo: Photo(title: "Example image", farm: 66, id: "53469764284", secret: "f910a8b00c", server: "65535", tags: "farmland tree pylon sky cloud northyorkshire", owner: "27813073@N03", userInfo: UserInfo(nsid: "27813073@N03", iconServer: "4784", iconFarm: 5, username: Username(content: "Example Username123")), additionalDetails: AdditionalPhotoDetails(dateUploaded: "1705665092", description: Description(description: "Elevate your space with custom-made blah ablsw  ioiwfb efbouef e heoifnewj behwoifnew fuewbhfoiew fewouhfioew ewh foiew f")))).environmentObject(UserInfoViewModel())
}

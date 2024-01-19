//
//  SearchBarView.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 17/01/2024.
//

import SwiftUI

struct SearchBarView: View {
    @State var text : String = "Yorkshire"
    @EnvironmentObject var searchBarViewModel : SearchBarViewModel
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $text)
                Spacer()
                PhotoCardList().environmentObject(searchBarViewModel)
                Spacer()
            }
            
        }
    }
}



struct SearchBar: View {
    @EnvironmentObject var searchBarViewModel : SearchBarViewModel
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text, onCommit: {
                searchBarViewModel.searchPhotos(for: text,page: 1){completion in
                    if completion{
                        if let url = searchBarViewModel.flickrPhotos.first?.userInfo?.profileURL {
                            print(url)
                        }
                    }
                }
            })
            .padding(.horizontal, 10)
            .frame(width: screenWidth * 0.75, height: 40)
            .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
            
            SearchButton(text: $text)
            
        }.padding(.horizontal, 30)
    }
}

struct SearchButton : View {
    @EnvironmentObject var searchBarViewModel : SearchBarViewModel
    @Binding var text: String
    var body: some View {
        Button(action: {
            searchBarViewModel.searchPhotos(for: text, page: 1){completion in}
        }, label: {
            Image(systemName: "magnifyingglass")
                .padding(.trailing)
                .font(.system(size: 25))
                .foregroundColor(.black)
        })
    }
}


#Preview {
    SearchBarView().environmentObject(SearchBarViewModel())
}


//
//  ViewModel.swift
//  MusicApp
//
//  Created by Manu on 02/06/23.
//

import Foundation
class MusicListViewModel{
    var music: [Result] = []
}


//MARK: - All the function in View Model
extension MusicListViewModel{
    func getMusicList(searchString:String = "", comp: @escaping (_ isError: Bool)-> Void){
        NetworkManager().getMusicList(urlString: "https://itunes.apple.com/search?term=adele", searchString: searchString) { data, isError in
            self.music = data?.results ?? []
            comp(isError)
        }
    }
}

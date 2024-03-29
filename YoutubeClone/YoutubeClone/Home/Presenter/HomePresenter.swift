//
//  HomePresenter.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 03/05/23.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[Any]])
}

class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    private var objectList: [[Any]] = []
    
    init(delegate: HomeViewProtocol, provider: HomeProviderProtocol=HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getVideo() async {
        
        objectList.removeAll()
        
        do {
            let channel = try await provider.getChannel(channelId: Constants.channelId).items
            let playlist = try await provider.getPlaylists(channelId: Constants.channelId).items
            let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
            
            let playlistItems = try await provider.getPlaylistsItems(playlistId: playlist.first?.id ?? "").items
            
            objectList.append(channel)
            objectList.append(playlistItems)
            objectList.append(videos)
            objectList.append(playlist)
        }
        catch {
            print(error)
        }
    }
}

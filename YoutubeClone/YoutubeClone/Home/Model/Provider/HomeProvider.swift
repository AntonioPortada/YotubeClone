//
//  HomeProvider.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 03/05/23.
//

import Foundation

protocol HomeProviderProtocol {
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel
    func getChannel(channelId: String) async throws -> ChannelModel
    func getPlaylists(channelId: String) async throws -> PlaylistModel
    func getPlaylistsItems(playlistId: String) async throws -> PlaylistItemsModel
}

class HomeProvider: HomeProviderProtocol {
    
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        
        var queryParams: [String : String] = ["part":"snippet"]
        
        if !channelId.isEmpty {
            queryParams["channelId"] = channelId
        }
        
        if !searchString.isEmpty {
            queryParams["channelId"] = searchString
        }
        
        let requestModel = RequestModel(endpoint: .search, queryItems: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, VideoModel.self)
            return model
        }
        catch {
            print(error)
            throw error
        }
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        
        var queryParams: [String : String] = ["part":"snippet, statistics, brandingSettings",
                                              "id":channelId]
     
        let requestModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, ChannelModel.self)
            return model
        }
        catch {
            print(error)
            throw error
        }
    }
    
    func getPlaylists(channelId: String) async throws -> PlaylistModel {
        
        var queryParams: [String : String] = ["part":"snippet, contentDetails",
                                              "channelId":channelId]
     
        let requestModel = RequestModel(endpoint: .playlists, queryItems: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, PlaylistModel.self)
            return model
        }
        catch {
            print(error)
            throw error
        }
    }
    
    func getPlaylistsItems(playlistId: String) async throws -> PlaylistItemsModel {
        
        var queryParams: [String : String] = ["part":"snippet, id, contentDetails",
                                              "playlistId":playlistId]
     
        let requestModel = RequestModel(endpoint: .playlistsItems, queryItems: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, PlaylistItemsModel.self)
            return model
        }
        catch {
            print(error)
            throw error
        }
    }
}

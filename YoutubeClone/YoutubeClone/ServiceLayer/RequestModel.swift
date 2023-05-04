//
//  RequestModel.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 26/04/23.
//

import Foundation

struct RequestModel  {
    let endpoint : Endpoints
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .youtube
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }

    enum Endpoints : String   {
        case search = "/search"
        case channels = "/channels"
        case playlists = "/playlists"
        case playlistsItems = "/playlistsItems"
        case empty = ""
    }

    enum URLBase : String{
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://othereweb.com/v2"
    }
}

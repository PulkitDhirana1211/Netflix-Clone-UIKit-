//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 07/11/23.
//

/*
 items =     (
             {
         etag = "banKEvLf_JcijLHSfA90drVhTis";
         id =             {
             kind = "youtube#video";
             videoId = 0oGJNWOtFsw;
         };
         kind = "youtube#searchResult";
     },
 */

import Foundation

struct YoutubeSearchResponse: Decodable {
    let items: [VideoElement]
}

struct VideoElement: Decodable {
    let id: IdVideoElement
}

struct IdVideoElement: Decodable {
    let kind: String
    let videoId: String
}

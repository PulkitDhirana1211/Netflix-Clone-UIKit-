//
//  TrendingTitle.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 06/11/23.
//

import Foundation

struct TrendingTitleResponse: Decodable {
    let results : [Title]
}

struct Title: Decodable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Double
    let release_date: String?
    let vote_average: Double
}

/*
{
    adult = 0;
    "backdrop_path" = "/kHlX3oqdD4VGaLpB8O78M25KfdS.jpg";
    "genre_ids" =             (
        9648,
        53,
        80
    );
    id = 945729;
    "media_type" = movie;
    "original_language" = en;
    "original_title" = "A Haunting in Venice";
    overview = "Celebrated sleuth Hercule Poirot, now retired and living in self-imposed exile in Venice, reluctantly attends a Halloween s\U00e9ance at a decaying, haunted palazzo. When one of the guests is murdered, the detective is thrust into a sinister world of shadows and secrets.";
    popularity = "743.075";
    "poster_path" = "/1Xgjl22MkAZQUavvOeBqRehrvqO.jpg";
    "release_date" = "2023-09-13";
    title = "A Haunting in Venice";
    video = 0;
    "vote_average" = "6.8";
    "vote_count" = 930;
},
 
 */

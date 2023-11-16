//
//  RequestManager.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 16/11/23.
//

import Foundation

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

enum RequestCalls: String {
    case trendingMovies = "https://api.themoviedb.org/3/trending/movie/day?api_key=955ccfce0233f3b4ee2f28dbc4f2451a"
    case trendingTv = "https://api.themoviedb.org/3/trending/tv/day?api_key=955ccfce0233f3b4ee2f28dbc4f2451a"
    case popular = "https://api.themoviedb.org/3/movie/popular?api_key=955ccfce0233f3b4ee2f28dbc4f2451a&language=en-US&page=1"
    case upcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=955ccfce0233f3b4ee2f28dbc4f2451a&language=en-US&page=1"
    case topRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=955ccfce0233f3b4ee2f28dbc4f2451a&language=en-US&page=1"
    case discoverMovies = "https://api.themoviedb.org/3/discover/movie?api_key=955ccfce0233f3b4ee2f28dbc4f2451a&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"
}

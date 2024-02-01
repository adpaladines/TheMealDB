//
//  YouTubeView.swift
//  TheMealDB
//
//  Created by andres paladines on 2/1/24.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    
    let completeUrl: String?
    let videoId: String?
    
    private let embedUrlString = "https://www.youtube.com/embed/"
    private let completeUrlString = "https://www.youtube.com/watch?v="
    
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var url: URL?
        
        if let completeUrl = completeUrl {
            let myVideoId = completeUrl.replacingOccurrences(of: completeUrlString, with: "")
            url = URL(string: "\(embedUrlString)\(myVideoId)")
        }else if let videoId = videoId {
            url = URL(string: "\(embedUrlString)\(videoId)")
        }
        
        let demoURL = url ?? URL(string: "https://www.youtube.com/embed/5TxnwlDn7w0")!
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}


#Preview {
    YouTubeView(completeUrl: nil, videoId: "1IszT_guI08")
}

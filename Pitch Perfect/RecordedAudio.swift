//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by HhhotDog on 15/12/21.
//  Copyright © 2015年 Alexscott. All rights reserved.
//

import Foundation

class RecordedAudio:NSObject {
    let filePathUrl:NSURL!
    let title:String!
    init(filePathUrl:NSURL, title:String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}

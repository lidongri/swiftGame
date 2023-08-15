//
//  LIPlayAudio.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/14.
//

import Foundation
import AudioToolbox
//播放铃声
class LIPlayAudio {
    class func play(score: Int) {
        var soundFileObject: SystemSoundID = 0
        var path = ""
        if score > 10 {
            path = "\(Bundle.main.resourcePath ?? "")\("/fiveSuccess.m4a")"
        } else if score > 0 {
            path = "\(Bundle.main.resourcePath ?? "")\("/success.m4a")"
        }
        else {
            path = "\(Bundle.main.resourcePath ?? "")\("/fail.m4a")"
        }
        AudioServicesCreateSystemSoundID(URL(fileURLWithPath: path) as CFURL, &soundFileObject)
        AudioServicesPlaySystemSound(soundFileObject)
    }
}

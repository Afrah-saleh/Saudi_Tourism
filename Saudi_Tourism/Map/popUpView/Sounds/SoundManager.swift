//
//  SoundManager.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?

    func playSound(soundName: String) {
        guard let bundlePath = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let soundURL = URL(fileURLWithPath: bundlePath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Could not locate and play the sound file.")
        }
    }
}

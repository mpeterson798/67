//
//  ContentView.swift
//  67
//
//  Created by Matthew Peterson on 9/15/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var six = ""
    @State private var seven = ""
    @State private var middleEmoji = ""
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Spacer ()
            Spacer()
            
            HStack {
                Text(six)
                
                Text(middleEmoji)
            
                Text(seven)
            }
            .font(.system(size: 150, weight: .black))
            
            Spacer()
            
            Button("🤫") {
                if six == "" {
                    six = "6"
                } else if six == "6" && seven == "" {
                    seven = "7"
                } else if six == "6" && seven == "7" {
                    middleEmoji = "🤷🏿‍♂️"
                    playSound(soundName: "6-7")
                }
            }
            .font(.system(size: 200))

        }
        .padding()
    }
    
    func playSound(soundName: String) {

        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡ERROR: \(error.localizedDescription) creating audioPlayer")
        }
        
    }
    
}

#Preview {
    ContentView()
}

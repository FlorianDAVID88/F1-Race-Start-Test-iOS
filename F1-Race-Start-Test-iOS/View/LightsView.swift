//
//  LightsView.swift
//  F1 Race Start Test
//
//  Created by Florian DAVID on 23/11/2023.
//

import SwiftUI
import AVKit

struct LightItemView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.gray)
                .scaledToFit()
            Circle()
                .foregroundColor(.gray)
                .scaledToFit()
            Circle()
                .foregroundColor(isOn ? .red : .gray)
                .scaledToFit()
            Circle()
                .foregroundColor(isOn ? .red : .gray)
                .scaledToFit()
        }
        .padding(10)
        .background(
            Rectangle()
                .foregroundColor(.primary)
                .cornerRadius(20)
        )
    }
}

struct LightsView: View {
    @State private var audioLight: AVAudioPlayer?

    @State private var lightsAppear = Array(repeating: false, count: 5)
    @State private var buttonHidden = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    ForEach(lightsAppear.indices, id: \.self) { i in
                        LightItemView(isOn: $lightsAppear[i])
                    }
                }
                .background(
                    Rectangle()
                        .frame(height: 15)
                )
            }
            
            Spacer()
            
            if !buttonHidden {
                Button {
                    startLights()
                    buttonHidden.toggle()
                } label: {
                    Text("START")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .background(.green)
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
    
    func startLights() {
        for (i, _) in lightsAppear.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                lightsAppear[i] = true
                playAudio()
            }
        }
        
        let time = Double(lightsAppear.count) + Double.random(in: 0.0..<2.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            lightsAppear = Array(repeating: false, count: 5)
        }
    }
    
    func playAudio() {
        guard let audioPath = Bundle.main.path(forResource: "bip_steX0pCO", ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        do {
            audioLight = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            audioLight?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
        
        if let player = audioLight {
            player.play()
        }
    }
}

#Preview {
    LightsView()
}

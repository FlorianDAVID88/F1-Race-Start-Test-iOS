//
//  TimerView.swift
//  F1 Race Start Test
//
//  Created by Florian DAVID on 23/11/2023.
//

import SwiftUI

struct TimerView: View {
    @State private var counter: Double = 0.0
    @State private var timer: Timer?
    @Binding var isStarted: Bool
    
    var body: some View {
        VStack {
            Text(String(format: "%.3f", counter))
                .font(.system(size: 60))
                .padding()
            
        }
        .onChange(of: isStarted, perform: { value in
            if value {
                startTimer()
            } else {
                stopTimer()
            }
        })
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            counter += 0.001
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        counter += 0
        timer = nil
    }
    
    func resetTimer() {
        if timer == nil {
            stopTimer()
            counter = 0.0
        }
    }
}

#Preview {
    TimerView(isStarted: .constant(false))
}

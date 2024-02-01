//
//  MainJailbreakView.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

struct JailbreakCheckView: View {
    
    @Environment(\.openURL) var openURL
    
    @State var isJailbroken = false
    @State private var isChecking = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(systemName: isJailbroken ? "exclamationmark.triangle.fill" : "checkmark.seal.fill")
                    .font(.system(size: 100))
                    .foregroundColor(isJailbroken ? Color.red : Color.green)
                
                Text(isJailbroken ? "Jailbroken Device Detected" : "Device Not Jailbroken")
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Please note that jailbreaking your device can compromise its security and your privacy.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                if !isJailbroken {
                    Text("Close this app and open it again ;)")
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 24)
                }
                
                Spacer()
                
                Button(action: {
                    isChecking = true
                    // Simulate the jailbreak check
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isJailbroken = UIDevice.current.isJailBroken
                        //                            isJailbroken.toggle()
                        isChecking = false
                    }
                }) {
                    Text(isChecking ? "Checking..." : "Check Jailbreak")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(isJailbroken ? Color.red : Color.green)
                        .cornerRadius(10)
                        .opacity(isChecking ? 0.7 : 1.0)
                        .disabled(isChecking)
                }
                
                if isJailbroken {
                    Button {
                        openURL(URL(string: "https://appletoolbox.com/how-to-undo-a-jailbreak/")!)
                    }label: {
                        Text("Learn How to Remove Jailbreak")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("Jailbreak Check", displayMode: .inline)
    }
}

#Preview {
    JailbreakCheckView()
}


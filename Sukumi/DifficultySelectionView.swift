//
//  DifficultySelectionView.swift
//  Sukumi
//
//  Created by HKinfoway Tech. on 15/01/25.
//

import SwiftUI

struct DifficultySelectionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var gameMode: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                Spacer()
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                
            }
            .padding(.top, 20)
            
            Spacer()

            VStack(spacing: 40) {
                IconButton(icon: "hare", label: "Easy", color: Color(hex: "#1D313A"))
                    .scaleEffect(gameMode == "Easy" ? 1.1 : 1)
                    .onTapGesture {
                        UserDefaultsManager.shared.save("Easy", forKey: String.difficultyMode)
                        withAnimation(.easeInOut(duration: 0.5)) {
                            gameMode = "Easy"
                        }
                    }
                IconButton(icon: "tortoise", label: "Medium", color: Color(hex: "#1D313A"))
                    .scaleEffect(gameMode == "Medium" ? 1.1 : 1)
                    .onTapGesture {
                        UserDefaultsManager.shared.save("Medium", forKey: String.difficultyMode)
                        withAnimation(.easeInOut(duration: 0.5)) {
                            gameMode = "Medium"
                        }
                    }
                IconButton(icon: "lion", label: "Hard", color: Color(hex: "#1D313A"))
                    .scaleEffect(gameMode == "Hard" ? 1.1 : 1)
                    .onTapGesture {
                        UserDefaultsManager.shared.save("Hard", forKey: String.difficultyMode)
                        withAnimation(.easeInOut(duration: 0.5)) {
                            gameMode = "Hard"
                        }
                    }
            }
            .padding()
            .cornerRadius(12)

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                        colors: [Color(hex: "#FFBF4C"), Color(hex: "#FF7B1B"), Color(hex: "#FF9F4E")],
                        startPoint: .top,
                        endPoint: .bottom
                    )
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            if let mode: String = UserDefaultsManager.shared.retrieve(forKey: String.difficultyMode) {
                gameMode = mode
            }else{
                gameMode = "Easy"
            }
            
        }
    }
}


//#Preview{
//    DifficultySelectionView()
//}

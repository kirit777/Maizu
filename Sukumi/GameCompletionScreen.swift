//
//  GameCompletionScreen.swift
//  Sukumi
//
//  Created by HKinfoway Tech. on 15/01/25.
//

import SwiftUI
import Lottie

struct GameCompletionScreen: View {
    @State var isHomeButtonTapped = false
    @Binding var isPlayAgainButtonTapped:Bool
    @Binding var isPLay:Bool
    var mistakes:Int
    var timeTaken:String
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @State var gameMode: String = ""
    
    var body: some View {
        VStack {
            // Lottie Animation
            LottieView(filename: "ice") // Ensure you have a Lottie JSON file
                .frame(width: 150, height: 150)
                .padding(.top, 50)

            // Game Completion Stats
            VStack(spacing: 30) {
                Text("Game Over")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                GameStatView(title: "Total Mistakes", value: "\(mistakes)")
                GameStatView(title: "Time Taken", value: timeTaken)
                GameStatView(title: "Difficulty Mode", value: "\(gameMode)")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: "#1D313A"))
            )
            .padding(.top, 30)
            
            // Buttons for Play Again and Home
            HStack {
                Button(action: {
                    isPlayAgainButtonTapped.toggle()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Play Again")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#FF7B1B"))
                        .cornerRadius(12)
                }
                
                Spacer()
                
                Button(action: {
                    isHomeButtonTapped.toggle()
                    isPLay = false
                }) {
                    Text("Home")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#FF7B1B"))
                        .cornerRadius(12)
                }
            }
            .padding()
            
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
            
            if let time1: String = UserDefaultsManager.shared.retrieve(forKey: String.bestTime) {
                UserDefaultsManager.shared.save(compareTimes(time1, timeTaken), forKey: String.bestTime)
            }else{
                UserDefaultsManager.shared.save(timeTaken, forKey: String.bestTime)
            }
            
            UserDefaultsManager.shared.save(mistakes, forKey: String.totalWrongMoves)
           
            
            
        }
    }
}

struct GameStatView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                Spacer()
                Text(value)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
            }
            .padding(.vertical, 10)
        }
    }
}

// Lottie Animation View
struct LottieView: View {
    var filename: String
    @State private var animationView = LottieAnimationView()
    
    var body: some View {
        LottieViewRepresentable(filename: filename)
            .frame(width: 150, height: 150)
    }
}

struct LottieViewRepresentable: UIViewRepresentable {
    var filename: String
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let animationView = LottieAnimationView(name: filename)
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

//#Preview {
//    GameCompletionScreen()
//}

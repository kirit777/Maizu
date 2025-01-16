//
//  AchievementScreen.swift
//  Sukumi
//
//  Created by HKinfoway Tech. on 15/01/25.
//

import SwiftUI

struct AchievementScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var totalPlayedCount: String = "0"
    @State var bestTime: String = ""
    @State var totalWrongMoves: String = "0"
    var body: some View {
        VStack {
            Spacer()
            
            // Header Section
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
                Text("Achievements")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                
            }
            .padding(.top, 20)
            
            // Main Stats Section
            VStack(spacing: 30) {
                AchievementStatView(title: "Total Wins", value: "50")
                AchievementStatView(title: "Total Wrong Moves", value: "25")
                AchievementStatView(title: "Best Time", value: "2m 30s")
                AchievementStatView(title: "Total Played", value: "75")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: "#1D313A"))
            )
            .padding(.top, 30)
            
            // Badges Section
            VStack(spacing: 20) {
                Text("Earned Badges")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                HStack {
                    BadgeView(name: "First Win", progress: 100)
                    BadgeView(name: "Fast Learner", progress: 60)
                    BadgeView(name: "Champion", progress: 90)
                }
            }
            .padding()
            
            Spacer()

            // Footer Section (Rate Us & Follow Us)
            HStack {
                CircularButton(icon: "hand.thumbsup", label: "Rate Us", color: Color(hex: "#1D313A"))
                Spacer()
                CircularButton(icon: "person.3.fill", label: "Follow Us", color: Color(hex: "#1D313A"))
            }
            .padding()
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
            if let timeLowest: String = UserDefaultsManager.shared.retrieve(forKey: String.bestTime) {
                bestTime = timeLowest
            }
            
            if let wrongMoves: String = UserDefaultsManager.shared.retrieve(forKey: String.totalWrongMoves) {
                totalWrongMoves = wrongMoves
            }
            
            if let numberOfGamesPlayed: String = UserDefaultsManager.shared.retrieve(forKey: String.totalPlayed) {
                totalPlayedCount = numberOfGamesPlayed
            }
        }
    }
}

struct AchievementStatView: View {
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

struct BadgeView: View {
    var name: String
    var progress: Int
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(hex: "#FFBF4C"))
                    .frame(width: 70, height: 70)
                Text(name.prefix(2)) // Show initials or short name
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
            }
            
            ProgressBar(progress: CGFloat(progress)/100)
                .frame(height: 10)
        }
        .padding(.horizontal)
    }
}

struct ProgressBar: View {
    var progress: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 10)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(hex: "#FF7B1B"))
                .frame(width: progress * 100, height: 10)
        }
        .padding(.top, 5)
    }
}
//
//#Preview {
//    AchievementScreen()
//}

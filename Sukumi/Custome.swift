//
//  Custome.swift
//  Sukumi
//
//  Created by HKinfoway Tech. on 15/01/25.
//
import SwiftUI
import Foundation

class GameSettings: ObservableObject {
    @Published var difficultyMode: String = "Easy"
}




class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    // Save value to UserDefaults
    func save<T>(_ value: T, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    // Retrieve value from UserDefaults
    func retrieve<T>(forKey key: String) -> T? {
        return UserDefaults.standard.object(forKey: key) as? T
    }
    
    // Remove value from UserDefaults
    func remove(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    // Clear all UserDefaults data
    func clearAll() {
        let dictionary = UserDefaults.standard.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}


extension String {
    static var difficultyMode = "difficultyMode"
    static var totalWins = "totalWins"
    static var totalWrongMoves = "totalWrongMoves"
    static var bestTime = "bestTime"
    static var totalPlayed = "totalPlayed"
}

func timeToSeconds(_ time: String) -> Int {
    let components = time.split(separator: " ")
    var totalSeconds = 0
    
    for component in components {
        if component.contains("m") {
            if let minutes = Int(component.replacingOccurrences(of: "m", with: "")) {
                totalSeconds += minutes * 60
            }
        } else if component.contains("s") {
            if let seconds = Int(component.replacingOccurrences(of: "s", with: "")) {
                totalSeconds += seconds
            }
        }
    }
    
    return totalSeconds
}

func compareTimes(_ time1: String, _ time2: String) -> String {
    let time1InSeconds = timeToSeconds(time1)
    let time2InSeconds = timeToSeconds(time2)
    
    // Compare the two times in seconds and return the lowest
    if time1InSeconds <= time2InSeconds {
        return time1
    } else {
        return time2
    }
}

func secondsToTime(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    return "\(minutes)m \(remainingSeconds)s"
}

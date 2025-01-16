//import SwiftUI
//
//struct SudokuCell: View {
//    var value: Int
//    var isEditable: Bool
//    var isSelected: Bool
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .foregroundColor(isSelected ? Color(hex: "#FF9F4E") : (isEditable ? Color(hex: "#FFBF4C") : Color(hex: "#FF7B1B")))
//                .border(Color.black, width: 1)
//
//            Text(value == 0 ? "" : "\(value)")
//                .font(.title)
//        }
//        .frame(width: 40, height: 40)
//        .cornerRadius(5)
//    }
//}
//
//struct SudokuGameView: View {
//    @State private var grid: [[Int]] = [
//        [5, 3, 0, 0, 7, 0, 0, 0, 0],
//        [6, 0, 0, 1, 9, 5, 0, 0, 0],
//        [0, 9, 8, 0, 0, 0, 0, 6, 0],
//        [8, 0, 0, 0, 6, 0, 0, 0, 3],
//        [4, 0, 0, 8, 0, 3, 0, 0, 1],
//        [7, 0, 0, 0, 2, 0, 0, 0, 6],
//        [0, 6, 0, 0, 0, 0, 2, 8, 0],
//        [0, 0, 0, 4, 1, 9, 0, 0, 5],
//        [0, 0, 0, 0, 8, 0, 0, 7, 9]
//    ]
//
//    private let solutionGrid: [[Int]] = [
//        [5, 3, 4, 6, 7, 8, 9, 1, 2],
//        [6, 7, 2, 1, 9, 5, 3, 4, 8],
//        [1, 9, 8, 3, 4, 2, 5, 6, 7],
//        [8, 5, 9, 7, 6, 1, 4, 2, 3],
//        [4, 2, 6, 8, 5, 3, 7, 9, 1],
//        [7, 1, 3, 9, 2, 4, 8, 5, 6],
//        [9, 6, 1, 5, 3, 7, 2, 8, 4],
//        [2, 8, 7, 4, 1, 9, 6, 3, 5],
//        [3, 4, 5, 2, 8, 6, 1, 7, 9]
//    ]
//
//    @State private var incorrectMoves = 0
//    @State private var showCompletionAlert = false
//    @State private var selectedCell: (row: Int, col: Int)? = nil
//
//    var body: some View {
//        VStack(spacing: 10) {
//            Text("Sudoku")
//                .font(.largeTitle)
//                .padding()
//
//            VStack(spacing: 2) {
//                ForEach(0..<9, id: \..self) { row in
//                    HStack(spacing: 2) {
//                        ForEach(0..<9, id: \..self) { col in
//                            SudokuCell(
//                                value: grid[row][col],
//                                isEditable: grid[row][col] == 0,
//                                isSelected: selectedCell?.row == row && selectedCell?.col == col
//                            )
//                            .onTapGesture {
//                                if grid[row][col] == 0 {
//                                    selectedCell = (row, col)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .padding(5)
//            .background(Color(hex: "#1D313A"))
//            .cornerRadius(8)
//
//            HStack {
//                ForEach(0..<10, id: \..self) { num in
//                    Button(action: {
//                        if let cell = selectedCell {
//                            handleInput(num, atRow: cell.row, col: cell.col)
//                        }
//                    }) {
//                        Text("\(num)")
//                            .font(.title)
//                            .frame(width: 35, height: 35)
//                            .background(Color(hex: "#FF7B1B"))
//                            .foregroundColor(.white)
//                            .cornerRadius(5)
//                    }
//                }
//            }
//            .padding()
//
//            Text("Incorrect Moves: \(incorrectMoves)")
//                .foregroundColor(.red)
//                .padding()
//
//            Button("Check Completion") {
//                if isComplete() {
//                    showCompletionAlert = true
//                }
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.green)
//            .cornerRadius(8)
//            .alert(isPresented: $showCompletionAlert) {
//                Alert(title: Text("Sudoku Completed"), message: Text("Incorrect Moves: \(incorrectMoves)"), dismissButton: .default(Text("OK")))
//            }
//        }
//        .padding()
//    }
//
//    private func handleInput(_ input: Int, atRow row: Int, col: Int) {
//        if grid[row][col] == 0 {
//            if input == solutionGrid[row][col] {
//                grid[row][col] = input
//            } else {
//                incorrectMoves += 1
//            }
//        }
//    }
//
//    private func isComplete() -> Bool {
//        for row in 0..<9 {
//            for col in 0..<9 {
//                if grid[row][col] != solutionGrid[row][col] {
//                    return false
//                }
//            }
//        }
//        return true
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        SudokuGameView()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//extension Color {
//    init(hex: String) {
//        let hexString = hex.replacingOccurrences(of: "#", with: "")
//        var rgb: UInt64 = 0
//        Scanner(string: hexString).scanHexInt64(&rgb)
//        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
//        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = Double(rgb & 0x0000FF) / 255.0
//        self.init(red: red, green: green, blue: blue)
//    }
//}



import SwiftUI

struct SudokuCell: View {
    var value: Int
    var isEditable: Bool
    var isSelected: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isSelected ? Color(hex: "#FF9F4E") : (isEditable ? Color(hex: "#FFBF4C") : Color(hex: "#FF7B1B")))
                .border(Color.black, width: 1)

            Text(value == 0 ? "" : "\(value)")
                .font(.title)
        }
        .frame(width: 40, height: 40)
        .cornerRadius(5)
    }
}

struct SudokuGameView: View {
    @State private var startTime: Date = Date()
    @State private var elapsedTimeInSeconds: Int = 0
    @State private var formattedTime: String = "0m 0s"
    @State private var grid: [[Int]] = []
    @State private var solutionGrid: [[Int]] = []

    @State private var incorrectMoves = 0
    @State private var showCompletionAlert = false
    @State private var selectedCell: (row: Int, col: Int)? = (0,0)

    @State private var difficulty: Difficulty = .medium
    @Environment(\.presentationMode) var presentationMode
    @State private var isPlayAgainButtonTapped:Bool = false
    @State private var isGameCompletionPresent:Bool = false
    @Binding var isPLay:Bool
    
    enum Difficulty: Int {
        case easy = 30
        case medium = 45
        case hard = 60
    }

    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: "#1D313A"))
                }
                Spacer()
                Text("Sudoku")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(hex: "#1D313A"))
                Spacer()
                
            }
            

            VStack(spacing: 2) {
                if grid.count > 0 {
                    ForEach(0..<9, id: \..self) { row in
                        HStack(spacing: 2) {
                            ForEach(0..<9, id: \..self) { col in
                                SudokuCell(
                                    value: grid[row][col],
                                    isEditable: grid[row][col] == 0,
                                    isSelected: selectedCell?.row == row && selectedCell?.col == col
                                )
                                .onTapGesture {
                                    if grid[row][col] == 0 {
                                        selectedCell = (row, col)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(5)
            .background(Color(hex: "#1D313A"))
            .cornerRadius(10)
            .padding(.top, 20)
            
            

            HStack {
                // First Row
                VStack {
                    HStack {
                        ForEach(0..<5, id: \.self) { num in
                            Button(action: {
                                if let cell = selectedCell {
                                    handleInput(num, atRow: cell.row, col: cell.col)
                                }
                            }) {
                                Text("\(num)")
                                    .font(.system(size: 24))
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color(hex: "#1D313A"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .shadow(radius: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    HStack {
                        ForEach(5..<10, id: \.self) { num in
                            Button(action: {
                                if let cell = selectedCell {
                                    handleInput(num, atRow: cell.row, col: cell.col)
                                }
                            }) {
                                Text("\(num)")
                                    .font(.system(size: 24))
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color(hex: "#1D313A"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .shadow(radius: 1)
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
            }
            .padding(.top , 20)

            Spacer()
            HStack{
                Spacer()
                Text("Incorrect Moves: \(incorrectMoves)")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
                Spacer()
            }
            .frame(height: 40)
            .background(Color(hex: "#FFBF4C"))
            .cornerRadius(10)

            HStack{
                Spacer()
                Button("Check Completion") {
                    
                    let currentTime = Date()
                    elapsedTimeInSeconds = Int(currentTime.timeIntervalSince(startTime))
                    
                    // Convert elapsed time to minutes and seconds
                    let minutes = elapsedTimeInSeconds / 60
                    let seconds = elapsedTimeInSeconds % 60
                    
                    formattedTime = "\(minutes)m \(seconds)s"
                    
                    
                    isGameCompletionPresent.toggle()
                    if isComplete() {
                        showCompletionAlert = true
                    }
                }
                .padding()
                .foregroundColor(Color(hex: "#1D313A"))
                .cornerRadius(8)
                .alert(isPresented: $showCompletionAlert) {
                    Alert(title: Text("Sudoku Completed"), message: Text("Incorrect Moves: \(incorrectMoves)"), dismissButton: .default(Text("OK")))
                }
                Spacer()
            }
            .frame(height: 40)
            .background(Color(hex: "#FFBF4C"))
            .cornerRadius(10)
            
            Spacer()
//            Picker("Difficulty", selection: $difficulty) {
//                Text("Easy").tag(Difficulty.easy)
//                Text("Medium").tag(Difficulty.medium)
//                Text("Hard").tag(Difficulty.hard)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding()
//            .onChange(of: difficulty) { _ in
//                generateNewPuzzle()
//            }
            
            NavigationLink(
                destination: GameCompletionScreen(isPlayAgainButtonTapped: $isPlayAgainButtonTapped,isPLay: $isPLay,mistakes: incorrectMoves,timeTaken: formattedTime),
                isActive: $isGameCompletionPresent,
                label: {
                    EmptyView() // Invisible view to trigger navigation
                }
            )
            .hidden()
        }
        .padding()
        .background(
            LinearGradient(
                        colors: [Color(hex: "#FFBF4C"), Color(hex: "#FF7B1B"), Color(hex: "#FF9F4E")],
                        startPoint: .top,
                        endPoint: .bottom
                    )
        )
        .onChange(of: isPlayAgainButtonTapped) { _ in
            generateNewPuzzle()
        }
        .onAppear(){
            generateNewPuzzle()
            startTime = Date()
            
//            if let totalPlayed = UserDefaultsManager.shared.retrieve(forKey: String.totalPlayed) as? String{
//                var newPlayedCount = Int(totalPlayed) ?? 0 + 1
//                UserDefaultsManager.shared.save("\(newPlayedCount)", forKey: String.totalPlayed)
//            }else{
//                UserDefaultsManager.shared.save("1", forKey: String.totalPlayed)
//            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarBackButtonHidden(true)
    }

    private func handleInput(_ input: Int, atRow row: Int, col: Int) {
        if grid[row][col] == 0 {
            if input == solutionGrid[row][col] {
                grid[row][col] = input
            } else {
                incorrectMoves += 1
            }
        }
    }

    private func isComplete() -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if grid[row][col] != solutionGrid[row][col] {
                    return false
                }
            }
        }
        return true
    }

    private func generateNewPuzzle() {
        if let mode: String = UserDefaultsManager.shared.retrieve(forKey: String.difficultyMode) {
            let (generatedGrid, solvedGrid) = SudokuGenerator.generatePuzzle(emptyCells: mode == "Easy" ? 30 : mode == "Medium" ? 45 : 60)
            grid = generatedGrid
            solutionGrid = solvedGrid
        }else{
            let (generatedGrid, solvedGrid) = SudokuGenerator.generatePuzzle(emptyCells: 30)
            grid = generatedGrid
            solutionGrid = solvedGrid
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        SudokuGameView()
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

extension Color {
    init(hex: String) {
        let hexString = hex.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

struct SudokuGenerator {
    static func generatePuzzle(emptyCells: Int) -> ([[Int]], [[Int]]) {
        // Sample static puzzle; implement random generation for full functionality
        let solution: [[Int]] = [
            [5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]
        ]
        var puzzle = solution
        var cellsToRemove = emptyCells

        while cellsToRemove > 0 {
            let row = Int.random(in: 0..<9)
            let col = Int.random(in: 0..<9)
            if puzzle[row][col] != 0 {
                puzzle[row][col] = 0
                cellsToRemove -= 1
            }
        }

        return (puzzle, solution)
    }
}

import SwiftUI

struct HomeView: View {
    
    @State var isPLay = false
    @State var isSettingsPresent = false
    @State var isAchivmentPresent = false
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                
                Image("iconMain")
                
                Spacer()
                
                VStack(spacing: 20) {
                    IconButton(icon: "play.circle", label: "Play", color: Color(hex: "#1D313A"))
                        .onTapGesture {
                            isPLay = true
                        }
                    IconButton(icon: "star.circle", label: "Achievements", color: Color(hex: "#1D313A"))
                        .onTapGesture {
                            isAchivmentPresent = true
                        }
                    IconButton(icon: "gearshape.circle", label: "Settings", color: Color(hex: "#1D313A"))
                        .onTapGesture {
                            isSettingsPresent = true
                        }
                }
                .padding()
                .cornerRadius(12)
                
                Spacer()
                
                HStack {
                    CircularButton(icon: "hand.thumbsup", label: "Rate Us", color: Color(hex: "#1D313A"))
                    Spacer()
                    CircularButton(icon: "person.3.fill", label: "Follow Us", color: Color(hex: "#1D313A"))
                }
                .padding()
                
                NavigationLink(
                    destination: SudokuGameView(isPLay: $isPLay),
                    isActive: $isPLay,
                    label: {
                        EmptyView() // Invisible view to trigger navigation
                    }
                )
                .hidden()
                
                NavigationLink(
                    destination: DifficultySelectionView(),
                    isActive: $isSettingsPresent,
                    label: {
                        EmptyView() // Invisible view to trigger navigation
                    }
                )
                .hidden()
                
                NavigationLink(
                    destination: AchievementScreen(),
                    isActive: $isAchivmentPresent,
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
            .navigationBarBackButtonHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct IconButton: View {
    var icon: String
    var label: String
    var color: Color

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(color)
                    .frame(height: 60)
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: "#FFBF4C"))
                        .padding(.leading , 20)
                    Text(label)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.leading , 10)
                    Spacer()
                }
            }
        }
    }
}

struct CircularButton: View {
    var icon: String
    var label: String
    var color: Color

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding()
                .background(color)
                .clipShape(Circle())
                .foregroundColor(.white)

            Text(label)
                .foregroundColor(.white)
                .font(.caption)
        }
    }
}
#Preview{
    HomeView()
}

import SwiftUI

// This component creates an iMessage-style confetti animation when a button is pressed.
// The button is designed as a floating action button with a plus icon.
// The confetti animation is triggered when the button is pressed and falls from top to bottom under gravity.

struct ContentView: View {
    // 1. Create a state property to control the confetti animation.
    @State private var showConfetti = false

    var body: some View {
        ZStack {
            // 2. Display the confetti animation when the state property is true.
            if showConfetti {
                ConfettiView()
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()

                    // 3. Create a floating action button with a plus icon.
                    Button(action: {
                        // 4. Toggle the confetti animation state when the button is pressed.
                        withAnimation {
                            showConfetti.toggle()
                        }
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 60, height: 60)
                            .background(Color.primary)
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    }
                    .padding()
                }
            }
        }
    }
}

// ConfettiView is a separate view that creates the confetti animation.
struct ConfettiView: View {
    let confettiColors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 1. Create multiple confetti pieces with random colors, sizes, and positions.
                ForEach(0..<100) { _ in
                    ConfettiPiece()
                        .fill(confettiColors.randomElement()!)
                        .frame(width: CGFloat.random(in: 5...10), height: CGFloat.random(in: 20...30))
                        .position(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: 0...geometry.size.height))
                        .rotationEffect(.degrees(Double.random(in: 0...360)))
                        // 2. Add gravity and animation to make the confetti fall from top to bottom.
                        .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10).delay(Double.random(in: 0...1)))
                        .offset(y: geometry.size.height)
                }
            }
        }
    }
}

// ConfettiPiece is a separate view that creates a single confetti piece.
struct ConfettiPiece: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
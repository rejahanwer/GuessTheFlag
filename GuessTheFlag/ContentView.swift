//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rejah Anuvar on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingAlert = false
    @State var showingScore = false
    @State var scoreTitle = ""
    @State var score = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                        Text("Tap the flag of")
                        
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }.foregroundColor(.white)
                
                ForEach(0 ..< 3) { index in
                    Button(action: {
                        self.flagTapped(index)
                       }) {
                           Image(self.countries[index])
                               .renderingMode(.original)
                               .clipShape(Capsule())
                               .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                               .shadow(color: .black, radius: 2)

                       }
                }
                
                Text("Score: \(self.score)")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
            }
        }
        .alert(isPresented: self.$showingScore) {
            Alert(title: Text(self.scoreTitle),
                  message: Text("Your score: \(self.score)"),
                          dismissButton: .default(Text("continue")) {
                        self.askQuestion()
                    })
        }
    }

    func flagTapped(_ index: Int) {
        if index == correctAnswer {
            scoreTitle = "Correct"
            self.score += 1
        } else {
            scoreTitle = "Wrong, Thats the flag of \(self.countries[index])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

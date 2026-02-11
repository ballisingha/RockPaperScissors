//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Guriqbal Singh Amroke on 11.02.26.
//

import SwiftUI

struct ContentView: View {
    @State private var appChoices = ["Rock", "Paper", "Scissors"]
    @State private var appsChoice = Int.random(in: 0...2)
    let playerChoices = ["Rock", "Paper", "Scissors"]
    @State private var score = 0
    @State private var showingAlert = ""
    @State private var showingScore = false
    var body: some View {
        VStack {
            Text("Let´s play Rock, Paper, Scissors!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Your score is \(score)")
                .font(.title2)
                .padding()

            VStack {
                ForEach(0 ..< 3) { number in
                    Button {
                        buttonTapped(number)
                    } label: {
                        ButtonImage(number)
                    }
                }
            }.alert(showingAlert, isPresented: $showingScore) {
                Button("Continue", action: shuffledChoices)
            } message: {
                Text("Your score is \(score) the app chose\(appChoices[appsChoice])")
                Text("")
            }
        }
        .padding()
    }

    func shuffledChoices() {
        appChoices.shuffle()
        appsChoice = Int.random(in: 0...2)
        showingScore = false
    }

    func buttonTapped(_ number: Int) {
        if number == appsChoice {
            showingAlert = "It´s a draw!"
            showingScore = true
        } else if (number == 0 && appsChoice == 2) || (number == 1 && appsChoice == 0) || (number == 2 && appsChoice == 1) {
            showingAlert = "You win!"
            score += 1
            showingScore = true
        } else {
            showingAlert = "You lose!"
            score -= 1
            showingScore = true
        }
    }

    func ButtonImage(_ number: Int) -> some View {
        Text(playerChoices[number])
            .font(.title)
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(.thinMaterial, in: Capsule())
            .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}

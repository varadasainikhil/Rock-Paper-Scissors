//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Sai Nikhil Varada on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var choiceArray = ["Rock", "Paper", "Scissors"]
    
    @State private var cpuChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var showingAlert = false
    @State private var alertTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Player Score")
                Text("\(playerScore)")
                Text("CPU's Move")
                Text(choiceArray[cpuChoice])
                
                if shouldWin{
                    Text("You should Win")
                }
                else{
                    Text("You should Lose")
                }
                
                HStack{
                    Spacer()
                    
                    Button(action: {checkIfUserWon(userChoice: "Rock")}, label: {
                        Text("🪨")
                    })
                    .font(.system(size: 70))
                    
                    Spacer()
                    
                    Button(action: {checkIfUserWon(userChoice: "Paper")}, label: {
                        Text("📜")
                    })
                    .font(.system(size: 70))
                    
                    Spacer()
                    
                    Button(action: {checkIfUserWon(userChoice: "Scissors")}, label: {
                        Text("✂️")
                    })
                    .font(.system(size: 70))
                    
                    Spacer()
                }
                .padding()
            }
        }
        .alert(alertTitle, isPresented: $showingAlert){
            Button("Continue") {
                randomizeQuestion()
            }
        } message: {
            Text("Your score is \(playerScore)")
        }
    }
 
    func randomizeQuestion(){
        cpuChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func checkIfUserWon(userChoice : String){
        let cpuSelectedOption =  choiceArray[cpuChoice]
        let winningPairs : [String:String] = [
            "Rock":"Paper",
            "Paper":"Scissors",
            "Scissors":"Paper"
        ]
        
        if userChoice == choiceArray[cpuChoice]{
            alertTitle = "You Lose"
            playerScore -= 1
        }
        else if shouldWin{
            if winningPairs[cpuSelectedOption] == userChoice{
                alertTitle = "You Won"
                playerScore += 1
            }
            else{
                alertTitle = "You Lost"
                playerScore -= 1
            }
        }
        else{
            if winningPairs[cpuSelectedOption] == userChoice{
                alertTitle = "You Lose"
                playerScore -= 1
            }
            else{
                alertTitle = "You Won"
                playerScore += 1
            }
        }
        showingAlert = true
        randomizeQuestion()
    }
}




#Preview {
    ContentView()
}

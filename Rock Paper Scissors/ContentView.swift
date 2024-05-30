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
    @State private var numberOfQuestions = 1
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock Paper Scissors")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color(.black))
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    VStack{
                        Text("Player Score")
                            .font(.title2)
                        Text("\(playerScore)")
                            .font(.title.bold())
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU's Move")
                            .font(.title2)
                        Text(choiceArray[cpuChoice])
                            .font(.title.bold())
                    }
                    
                    Spacer()
                }
                       
                Spacer()
                
                if shouldWin{
                    Text("You should Win")
                        .font(.title.bold())
                }
                else{
                    Text("You should Lose")
                        .font(.title.bold())
                }
                
                Spacer()
                
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
                
                Spacer()
                Spacer()
            }
        }
        .alert(alertTitle, isPresented: $showingAlert){
            if numberOfQuestions == 10 {
                Button("Restart"){
                    randomizeQuestion()
                    playerScore = 0
                    numberOfQuestions = 1
                }
            }
            else{
                Button("Continue") {
                    randomizeQuestion()
                }
            }
            
        } message: {
            if numberOfQuestions == 10{
                Text("Your score is \(playerScore)/10")
            }
            else{
                Text("Your score is \(playerScore)")
            }
            
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
            "Scissors":"Rock"
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
        numberOfQuestions += 1
        if numberOfQuestions == 10 {
            alertTitle = "Game Ended"
        }
        showingAlert = true
        
        
    }
}

#Preview {
    ContentView()
}

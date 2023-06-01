//
//  ContentView.swift
//  MileStoneOneRockPaperScissors
//
//  Created by Brian Tavares on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    let rockPaperScissors = ["🪨", "📰", "✂️"]
    @State private var playerSelection = "Rock"
    @State private var phoneChoice = "Rock"
    @State private var choice = Bool.random()
    @State private var phoneSelection = Int.random(in: 0...2)
    @State private var gameScore = 0
    @State private var turns = 0 // Limit user to 10 turns
    
    var body: some View {

        ZStack{
            Color(red: 0.15, green: 0.7, blue: 0.89)
            
            VStack{
                Image("RockPaperScissors")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text("Milestone 1 Game")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text(choice == false ? "Choose winning move" : "Choose losing move")
                    .font(.title).bold()
                    .foregroundColor(choice == false ? .mint : .pink)
                
                Text("iOS Selection is:")
                    .font(.headline)
                
                Text(rockPaperScissors[phoneSelection])
                    .font(.system(size: 60))
                    .padding()
                
                
                Section{
                    Picker("Player selection", selection:
                            $playerSelection){
                        ForEach(rockPaperScissors, id: \.self){
                            Text($0)
                                .font(.system(size: 60))
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Player selection")
                        .font(.headline)
                    
                }
                
                
                Button("Submit Selection"){
                    //print("Player selection is: ", playerSelection)
                    //print("iOS Selection is: ", rockPaperScissors[phoneSelection])
                    //print("Phone selection int is: \(phoneSelection)")
                    
                    choiceCompare(iOS: rockPaperScissors[phoneSelection], player: playerSelection, winLoose: choice)
                    
                    // Count the total number of turns
                    turns += 1
                    
                    // Pick a differnt iOS choice
                    choice.toggle()
                    
                    if turns >= 10{
                        resetGame()
                    }
                    
                    
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .buttonStyle(.borderedProminent)
                .tint(.gray)
                .padding()
                
                Text("Turn count: \(turns)")
                Text("Your score: \(gameScore)")
                
                
                
            }
        }
        .ignoresSafeArea()
            
        
    }
    
    
    func choiceCompare(iOS: String, player: String, winLoose: Bool){
        
        // false means player chooses wining option
        if winLoose == false {
            switch iOS{
                case "🪨":
                    switch player{
                    case "🪨":
                        gameScore =  gameScore
                        
                    case "📰":
                        gameScore += 1
                        
                    case "✂️":
                        gameScore -= 1
                        
                    default:
                        gameScore = gameScore
                    }
                case "📰":
                    switch player{
                    case "🪨":
                        gameScore -= 1
                        
                    case "📰":
                        gameScore = gameScore
                        
                    case "✂️":
                        gameScore += 1
                        
                    default:
                        gameScore = gameScore
                    }
                case "✂️":
                    switch player{
                    case "🪨":
                        gameScore += 1
                        
                    case "📰":
                        gameScore -= 1
                        
                    case "✂️":
                        gameScore = gameScore
                        
                    default:
                        gameScore = gameScore
                    }
                    
                default:
                    gameScore = gameScore
                    
                }
            } else {
                // Choose loosing option
                switch iOS{
                    case "🪨":
                        switch player{
                        case "🪨":
                            gameScore =  gameScore
                            
                        case "📰":
                            gameScore -= 1
                            
                        case "✂️":
                            gameScore += 1
                            
                        default:
                            gameScore = gameScore
                        }
                    case "📰":
                        switch player{
                        case "🪨":
                            gameScore += 1
                            
                        case "📰":
                            gameScore = gameScore
                            
                        case "✂️":
                            gameScore -= 1
                            
                        default:
                            gameScore = gameScore
                        }
                    case "✂️":
                        switch player{
                        case "🪨":
                            gameScore -= 1
                            
                        case "📰":
                            gameScore += 1
                            
                        case "✂️":
                            gameScore = gameScore
                            
                        default:
                            gameScore = gameScore
                        }
                        
                    default:
                        gameScore = gameScore
                        
                    }
            }
            
            // Select a new iOS choice
            phoneSelection = Int.random(in: 0...2)
    }
    
    func resetGame(){
        gameScore = 0
        turns = 0
        
        // Select a new iOS choice
        phoneSelection = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

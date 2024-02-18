//
//  TestView.swift
//  WordQuizDaily
//
//  Created by 정종원 on 1/25/24.
//

import SwiftUI

struct TestView: View {
    
    @ObservedObject var wordNetwork = WordNetwork()
    @State var searchWord: String = ""
    let hardKoreanWords = HardKoreanWords()
    
    var body: some View {
        VStack {
            Spacer()

//            Button("Fetch Word Data") {
//                wordNetwork.searchWord(hardKoreanWords.hardWords.randomElement()!)
//            }
            if let wordData = wordNetwork.wordData {
                Text("Word: \(wordData.channel.item.first?.word ?? "None")")
                let _ = print("Word: \(wordData.channel.item.first?.word ?? "None")")
                
                Text("Definition: \(wordData.channel.item.first?.sense.first?.definition ?? "None")")
                let _ = print(wordData.channel.item.first?.sense.first?.definition ?? "None")
                
                Text("Pos: \(wordData.channel.item.first?.sense.first?.pos ?? "None")")
                let _ = print(wordData.channel.item.first?.sense.first?.pos ?? "None")
            }
            
            Spacer()
            
//            Button("TEST") {
//                wordNetwork.searchWord(hardKoreanWords.hardWords.randomElement()!)
//            }
            
            Spacer()

            
        }
    
    }
}

#Preview {
    TestView()
}

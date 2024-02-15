//
//  QuizView.swift
//  WordQuizDaily
//
//  Created by 정종원 on 1/24/24.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject var quizViewModel = QuizViewModel()
    @State private var isAnswerCorrect = false
    
    var body: some View {
        
        VStack{
            
            Text("QuizView")
                .padding(.top, 50)
            
            Spacer()
            
            if quizViewModel.isLoading {
                ProgressView("Loading...")
            } else {
                Image(systemName: "square.and.arrow.up")
                Text(quizViewModel.correctWordDefinition)
            }
            
            Spacer()
            
            VStack(){
                
                HStack {
                    ForEach(quizViewModel.choiceWord.prefix(2), id: \.self) { word in
                        Button(action: {
                            // 선택된 단어에 대한 동작을 추가하세요
                            isAnswerCorrect = quizViewModel.checkAnswer(selectedWord: word)
                            print("선택된 단어: \(word), 정답?: \(isAnswerCorrect)")
                        }) {
                            Text(word)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding()
                    }
                }
                
                HStack {
                    ForEach(quizViewModel.choiceWord.dropFirst(2), id: \.self) { word in
                        Button(action: {
                            // 선택된 단어에 대한 동작을 추가하세요
                            isAnswerCorrect = quizViewModel.checkAnswer(selectedWord: word)
                            print("선택된 단어: \(word), 정답?: \(isAnswerCorrect)")
                        }) {
                            Text(word)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding()
                    }
                }
            }
            
            Text(isAnswerCorrect ? "정답입니다!" : "오답입니다.")
            
            Spacer()
        }//VStack
    }
}


#Preview {
    QuizView()
}

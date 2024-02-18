//
//  QuizView.swift
//  WordQuizDaily
//
//  Created by 정종원 on 1/24/24.
//

import SwiftUI
import Kingfisher
struct QuizView: View {
    
    @StateObject var quizViewModel = QuizViewModel()
    @State private var isAnswerCorrect = false
    
    var body: some View {
        
        VStack{
            
            Text("QuizView")
                .padding(.top, 50)
            
            Spacer()
            
            VStack{
                if quizViewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    if let imageData = quizViewModel.imageData {
                        if let firstImage = imageData.items.first {
                            KFImage(URL(string: firstImage.link))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        }
                    }
                    
                    Text(quizViewModel.correctWordDefinition)
                }
            }
//            .onAppear {
//                quizViewModel.fetchImageForWord(quizViewModel.correctWord)
//            }
            .onReceive(quizViewModel.$imageData) { imageData in
                if let imageData = imageData {
                    print("ImageData updated: \(imageData)")
                } else {
                    print("ImageData is nil")
                }
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

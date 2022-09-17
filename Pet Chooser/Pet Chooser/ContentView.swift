//
//  ContentView.swift
//  Pet Chooser
//
//  Created by Karson Eskind on 8/28/22.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound() {
        guard let url = Bundle.main.url(forResource: "tada", withExtension: ".mp3") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch let error {
            print("Error playing sound.\(error.localizedDescription)")
        }
    }
    
}
class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()

    }
}

extension UIScreen{

    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct ContentView: View {
    
    @State var currentScreen: Int = 0
    @State var QuestionAllergicAnswer: Bool = false
    @State var QuestionLooksAnswer: Bool = false
    @State var QuestionOutsideAnswer: Bool = false
    @State var QuestionNoisyAnswer: Bool = false
    @State var QuestionPlayAnswer: Bool = false
    @State var QuestionCutenessScaleAnswer: Bool = false
    @State var QuestionCrowdAnswer: Bool = false
    
    var body: some View {
        switch (true) {
        case currentScreen == 11:
            QuestionAllergic(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer)
        case currentScreen == 21:
            QuestionLooks(currentScreen: $currentScreen, QuestionLooksAnswer: $QuestionLooksAnswer)
        case currentScreen == 22:
            QuestionOutside(currentScreen: $currentScreen, QuestionOutsideAnswer: $QuestionOutsideAnswer)
        case currentScreen == 31:
            QuestionNoisy(currentScreen: $currentScreen, QuestionNoisyAnswer: $QuestionNoisyAnswer)
        case currentScreen == 32:
            QuestionPlay(currentScreen: $currentScreen, QuestionPlayAnswer: $QuestionPlayAnswer)
        case currentScreen == 41:
            QuestionCrowd(currentScreen: $currentScreen, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case currentScreen == 42:
            QuestionCutenessScale(currentScreen: $currentScreen, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer)
            
        case (currentScreen == 99 && QuestionAllergicAnswer == true && QuestionLooksAnswer == true && QuestionNoisyAnswer == true):
            AnimalParrot(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == true && QuestionLooksAnswer == true && QuestionNoisyAnswer == false):
            AnimalBettaFish(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == true && QuestionLooksAnswer == false && QuestionPlayAnswer == false):
            AnimalScorpion(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == true && QuestionLooksAnswer == false && QuestionPlayAnswer == true):
            AnimalTarantula(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == false && QuestionOutsideAnswer == false && QuestionCutenessScaleAnswer == false):
            AnimalRat(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == false && QuestionOutsideAnswer == false && QuestionCutenessScaleAnswer == true):
            AnimalHamster(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == false && QuestionOutsideAnswer == true && QuestionCrowdAnswer == true):
            AnimalDog(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        case (currentScreen == 99 && QuestionAllergicAnswer == false && QuestionOutsideAnswer == true && QuestionCrowdAnswer == false):
            AnimalGoat(currentScreen: $currentScreen, QuestionAllergicAnswer: $QuestionAllergicAnswer, QuestionLooksAnswer: $QuestionLooksAnswer, QuestionOutsideAnswer: $QuestionOutsideAnswer, QuestionNoisyAnswer: $QuestionNoisyAnswer, QuestionPlayAnswer: $QuestionPlayAnswer, QuestionCutenessScaleAnswer: $QuestionCutenessScaleAnswer, QuestionCrowdAnswer: $QuestionCrowdAnswer)
        default:
            Home(currentScreen: $currentScreen)
        }
    }
}

struct Home: View {
    
    @Binding var currentScreen: Int
    
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("The Ultimate Pet Chooser!")
                .bold()
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            Rectangle()
                .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/3.3)
                .onTapGesture{
                    HapticManager.instance.impact(style: .heavy)
                    currentScreen = 11
                }
                .cornerRadius(15)
            Text("Click here to start!")
                .fontWeight(.heavy)
                .font(.system(size: UIScreen.screenWidth/8))
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

                .edgesIgnoringSafeArea(.vertical)
                .onTapGesture {
                    HapticManager.instance.impact(style: .heavy)
                    currentScreen = 11
            }
        }
    }
}

struct QuestionAllergic: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("Are you allergic to pet fur?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionAllergicAnswer = true
                            currentScreen = 21
                        }
                    Text("Yes")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionAllergicAnswer = true
                            currentScreen = 21
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionAllergicAnswer = false
                            currentScreen = 22
                        }
                    Text("No")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionAllergicAnswer = false
                            currentScreen = 22
                        }
                }
            }
        }
    }
}

struct QuestionLooks: View {
    @Binding var currentScreen: Int
    @Binding var QuestionLooksAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("Should your pet be cute or creepy?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionLooksAnswer = true
                            currentScreen = 31
                        }
                    Text("Cute")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionLooksAnswer = true
                            currentScreen = 31
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionLooksAnswer = false
                            currentScreen = 32
                        }
                    Text("Creepy")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionLooksAnswer = false
                            currentScreen = 32
                        }
                }
            }
        }
    }
}

struct QuestionOutside: View {
    @Binding var currentScreen: Int
    @Binding var QuestionOutsideAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("Do you like going outside?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionOutsideAnswer = true
                            currentScreen = 41
                        }
                    Text("Yes")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionOutsideAnswer = true
                            currentScreen = 41
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionOutsideAnswer = false
                            currentScreen = 42
                        }
                    Text("No")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionOutsideAnswer = false
                            currentScreen = 42
                        }
                }
            }
        }
    }
}

struct QuestionNoisy: View {
    @Binding var currentScreen: Int
    @Binding var QuestionNoisyAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("Should the pet be noisy?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionNoisyAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("Yes")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionNoisyAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionNoisyAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("No")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionNoisyAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
            }
        }
    }
}

struct QuestionPlay: View {
    @Binding var currentScreen: Int
    @Binding var QuestionPlayAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("Do you want to play with the pet?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionPlayAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("Yes")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionPlayAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionPlayAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("No")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionPlayAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
            }
        }
    }
}

struct QuestionCrowd: View {
    @Binding var currentScreen: Int
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("Would you rather go with the crowd or be different?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCrowdAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("Crowd")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCrowdAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCrowdAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("Different")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCrowdAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
            }
        }
    }
}

struct QuestionCutenessScale: View {
    @Binding var currentScreen: Int
    @Binding var QuestionCutenessScaleAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            Text("How cute should the pet be?")
                .font(.system(size: round(UIScreen.screenWidth/8)))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.screenWidth/2, y: UIScreen.screenWidth/4)
                .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCutenessScaleAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("Very Cute")
                        .font(.system(size: round(UIScreen.screenWidth/8)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCutenessScaleAnswer = true
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/8)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCutenessScaleAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                    Text("Medium Cute")
                        .font(.system(size: round(UIScreen.screenWidth/9)))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            QuestionCutenessScaleAnswer = false
                            currentScreen = 99
                            SoundManager.instance.playSound()
                        }
                }
            }
        }
    }
}

struct AnimalParrot: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a parrot!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("parrot")
                    .resizable()
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/1.24, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/1.8)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalBettaFish: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a betta fish!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("betta_fish")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*2.7, height: UIScreen.screenHeight/1.24, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/1.8)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalRat: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a rat!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("rat")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*2.5, height: UIScreen.screenHeight/1.2, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/2.3)
                    .padding(.leading)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalHamster: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a hamster!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("hamster")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*1.7, height: UIScreen.screenHeight/1.2, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/1.5)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalScorpion: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a scorpion!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("scorpion")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*1.5, height: UIScreen.screenHeight/1.24, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/1.8)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalDog: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a dog!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("dog")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*1.5, height: UIScreen.screenHeight/1.2, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/1.5)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalGoat: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a goat!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("goat")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*2, height: UIScreen.screenHeight/1.24, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/1.8)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}

struct AnimalTarantula: View {
    @Binding var currentScreen: Int
    @Binding var QuestionAllergicAnswer: Bool
    @Binding var QuestionLooksAnswer: Bool
    @Binding var QuestionOutsideAnswer: Bool
    @Binding var QuestionNoisyAnswer: Bool
    @Binding var QuestionPlayAnswer: Bool
    @Binding var QuestionCutenessScaleAnswer: Bool
    @Binding var QuestionCrowdAnswer: Bool
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 235 / 255, blue: 156 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -70) {
                Text("Get a tarantula!")
                    .bold()
                    .font(.system(size: round(UIScreen.screenWidth/8)))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 77 / 255, green: 87 / 255, blue: 95 / 255))
                    .padding(.top)
                Image("tarantula")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*2, height: UIScreen.screenHeight/1.2, alignment: .center)
                    .scaleEffect(UIScreen.screenHeight/UIScreen.screenHeight/2.2)
                ZStack {
                    Rectangle()
                        .fill(Color(red: 130 / 255, green: 0 / 255, blue: 255 / 255))
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/UIScreen.screenHeight*100, alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                    Text("Choose another \n animal!")
                        .font(.system(size: UIScreen.screenWidth/10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .heavy)
                            currentScreen = 0
                            QuestionAllergicAnswer = false
                            QuestionLooksAnswer = false
                            QuestionOutsideAnswer = false
                            QuestionNoisyAnswer = false
                            QuestionPlayAnswer = false
                            QuestionCutenessScaleAnswer = false
                            QuestionCrowdAnswer = false
                        }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

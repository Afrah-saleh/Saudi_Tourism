//
//  PopupView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 12/07/1445 AH.
//

import SwiftUI
import AVFoundation

struct PopupView: View {
    @Binding var showPopup: Bool
    func playPhraseSound(_ phrase: String) {
          SoundManager.shared.playSound(soundName: phrase)
      }
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showPopup = false
                }

            // Popup content
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showPopup = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .padding(.top, -30)
                    .padding(.trailing, 20)
                }
                
                TabView {
                    // Page 1 content
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Community Guidelines for a Positive and Stylish Experience")
                            .bold()

                        Text("1. Warm Welcome 🌟")
                        Text("• Embrace the vibrant community spirit.")
                        Text("• Foster good vibes and positivity.")

                        Text("2. Respectful Atmosphere 💒")
                        Text("• Show love and respect for religious places and properties.")

                        Text("3. Local Etiquette 🤝")
                        Text("• Maintain friendly interactions without excessive physical contact.")
                        Text("• Avoid kissing or shaking hands with women unless invited.")
                        Text("• Feel free to hold hands with loved ones in welcoming spaces.")

                        Text("4. Fashion Tips 👗😎")
                        Text("• Keep it classy and fabulous.")
                        Text("• Reveal just enough to stay effortlessly cool.")
                        
                        Spacer()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 20)
                    
                    // Page 2 content
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Locality Phrases you could use with local people")
                            .bold()
                        Text("Warm Welcoming")
                        
                        
                        HStack{
                            Text("Locality Phrase")
                                Spacer()
                            Image(systemName: "speaker.wave.3")
                                    .foregroundColor(Color("BTCOLOR"))
                            .onTapGesture {
                                // Call the playPhraseSound method with the correct sound name
                                self.playPhraseSound("sound1")
                            }
                            }
                        HStack {
                            Text("“Ya Hala Ya Hala Yallah, Inik Tahiyyehum”")
                            Spacer()
                            Text("يا هلا يا هلا يالله انك تحييهم")
                        }
                        
                        HStack{
                            Text("Best Reply")
                                Spacer()
                            Image(systemName: "speaker.wave.3")
                                    .foregroundColor(Color("BTCOLOR"))
                            .onTapGesture {
                                // Call the playPhraseSound method with the correct sound name
                                self.playPhraseSound("sound2")
                            }
                            }
                        HStack {
                            Text("“Allah Yahayyik”")
                            Spacer()
                            Text("الله يحييك")
                        }
                        
                        Spacer()
                        Divider()
                        Spacer()
                        
                        Text("If you want lower price use this phrase")
                        
                        HStack{
                            Text("Locality Phrase")
                                Spacer()
                            Image(systemName: "speaker.wave.3")
                                    .foregroundColor(Color("BTCOLOR"))
                            .onTapGesture {
                                // Call the playPhraseSound method with the correct sound name
                                self.playPhraseSound("sound4")
                            }
                            }
                        HStack {
                            Text("“Alaa Kam?”")
                            Spacer()
                            Text("على كم؟")
                        }
                        
                        HStack{
                            Text("Best Reply")
                                Spacer()
                        Image(systemName: "speaker.wave.3")
                                .foregroundColor(Color("BTCOLOR"))
                        .onTapGesture {
                            // Call the playPhraseSound method with the correct sound name
                            self.playPhraseSound("sound3")
                        }
                        }
                        HStack {
                            Text("“Kam baad al-khasm?”")
                            Spacer()
                            Text("كم بعد الخصم؟")
                            
                        }
                        
                        Spacer()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 20)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: 350, height: 600)
                
                Spacer()
                
                Button(action: {
                    showPopup = false
                    //  self.action2()
                }) {
                    Image(systemName: "xmark")
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .offset(x:145,y:-650)
            }
            .frame(width: 350, height: 700)
            .background(Color(red: 0.98, green: 0.96, blue: 0.9))
            .cornerRadius(20)
            .shadow(radius: 20)
            .foregroundColor(.dark)
        }
    }
}

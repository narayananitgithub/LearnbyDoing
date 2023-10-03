//
//  CardsView.swift
//  Learn by Doing
//
//  Created by Narayanasamy on 03/10/23.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROPERTIES
    
    var card: Card
    @State private var fadein: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    var hepticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var gradient:[Color] =  [Color("Color01"),Color("Color02")]

    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadein ? 1.0 : 0.0)
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white
                    )
                    .multilineTextAlignment(.center)
                Text(card.headLine)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218 : 300)
            Button(action: {
                print("button was tapped")
                playSound(sound: "sound-chime", type: "mp3")
                self.hepticImpact.impactOccurred()
                self.showAlert.toggle()
            }) {
                HStack {
                    Text(card.callToAction.uppercased() )
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(Color.white)
                }
                .padding(.vertical)
                .padding(.horizontal,24)
                .background(LinearGradient(gradient:Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6,x: 0,y: 3)
            }
            .offset(y: moveUpward ? 210 : 300)
            
        }
        .frame(width: 335,height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(){
            withAnimation(.linear(duration: 1.2)) {
                self.fadein.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[5])
            .previewLayout(.sizeThatFits)
    }
}

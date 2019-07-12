//
//  ContentView.swift
//  DesignCode
//
//  Created by Mithun x on 7/11/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct ContentView: View {

   @State var show = false

   var body: some View {
      ZStack {
         TitleView()
            .blur(radius: show ? 20 : 0)
            .animation(.default)

         CardBottomView()
            .blur(radius: show ? 20 : 0)
            .animation(.default)

         CardView()
            .background(show ? Color.red : Color("background9"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: show ? -400 : -40)
            .scaleEffect(0.85)
            .rotationEffect(Angle(degrees: show ? 15 : 0))
            .blendMode(.hardLight)
            .animation(.basic(duration: 0.7, curve: .easeInOut))

         CardView()
            .background(show ? Color.red : Color("background8"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: show ? -200 : -20)
            .scaleEffect(0.9)
            .rotationEffect(Angle(degrees: show ? 10 : 0))
            .blendMode(.hardLight)
            .animation(.basic(duration: 0.5, curve: .easeInOut))

         CertificateView()
            .scaleEffect(0.95)
            .rotationEffect(Angle(degrees: show ? 5 : 0))
            .animation(.spring())
            .tapAction {
               self.show.toggle()
            }
      }
   }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif

struct CardView: View {
   var body: some View {
      return VStack {
         Text("Card Back")
      }
      .frame(width: 340.0, height: 220.0)
   }
}

struct CertificateView: View {
   var body: some View {
      return VStack {
         HStack {
            VStack(alignment: .leading) {
               Text("UI Design")
                  .font(.headline)
                  .fontWeight(.bold)
                  .color(Color("accent"))
                  .padding(.top)

               Text("Certificate")
                  .color(.white)
            }
            Spacer()

            Image("Logo")
               .resizable()
               .frame(width: 30, height: 30)
         }
         .padding(.horizontal)
         Spacer()

         Image("Background")
      }
      .frame(width: 340.0, height: 220.0)
      .background(Color.black)
      .cornerRadius(10)
      .shadow(radius: 20)
   }
}

struct TitleView: View {
   var body: some View {
      return VStack {
         HStack {
            Text("Certificates")
               .font(.largeTitle)
               .fontWeight(.heavy)

            Spacer()
         }
         Image("Illustration5")

         Spacer()
      }.padding()
   }
}

struct CardBottomView: View {
   var body: some View {
      return VStack(spacing: 20.0) {
         Rectangle()
            .frame(width: 60, height: 6)
            .cornerRadius(3.0)
            .opacity(0.1)

         Text("This certificate is proof that Mithun has achieved UI Design course with approval from a Design+Code instructor.")
            .lineLimit(nil)

         Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding()
      .padding(.horizontal)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(radius: 20)
      .offset(y: 600)
   }
}

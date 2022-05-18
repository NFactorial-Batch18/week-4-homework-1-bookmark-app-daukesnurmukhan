//
//  ContentView.swift
//  BookmarkUI
//
//  Created by Нұрмұхан Дәукес on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        main
    }
}

var main: some View {
    NavigationView {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        VStack {
            Image("image")
                .edgesIgnoringSafeArea(.all)
            Text("Save all interesting links in one app")
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .black))
                .frame(width: 358, height: 92, alignment: .leading)
                .padding(.bottom, 24)
            Spacer()
            
            

            Button {
                print("Yeaa!")
            } label: {
                
                NavigationLink(destination: BookmarkList()) {
                
            ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .frame(width: 358, height: 58)
                .foregroundColor(.white)
                Text("Let’s start collecting")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
            } .padding(.bottom, 150)
                
                }
          }
        }
    }
}
    
}

struct Navigation: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: BookmarkList()) {
                    Button {
                        print("Yeaa!")
                    } label: {
                    ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: 358, height: 58)
                        .foregroundColor(.white)
                        Text("Let’s start collecting")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    } .padding(.bottom, 37)
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

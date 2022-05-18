//
//  BookmarkList.swift
//  BookmarkUI
//
//  Created by Нұрмұхан Дәукес on 18.05.2022.
//

import Foundation
import SwiftUI


struct BookmarkList: View {
    @State private var showSheet = false
    
    @State var dataArray: [String] = []
    
    @ObservedObject var linkData = ListModel()
    
   
    
    var body: some View {
        list
    }

var list: some View {
    VStack {        
//        Text("Bookmark App")
//            .font(.system(size: 17, weight: .semibold))
//            .padding(.top)
        
        HStack {
            
        Text("\(linkData.title)")
            .foregroundColor(.black)
            .padding(.leading, 16)
            Spacer()
        
        Text("\(linkData.link)")
                .padding(.trailing, 19)
        }
        .padding(.top, 40)
        //Divider()
        
        
        
        HStack {
            
        
        ForEach(dataArray, id: \.self) { data in
            HStack {
                Text(linkData.title)
                .foregroundColor(.black)
                .padding(.leading, 16)
                Spacer()
            Image("Vector")
                    .padding(.trailing, 19)
            }
            //Divider()
        }
        
        ForEach(dataArray, id: \.self) { data in
            HStack {
                Text(linkData.link)
                .foregroundColor(.black)
                .padding(.leading, 16)
                Spacer()
            Image("Vector")
                    .padding(.trailing, 19)
            }
            //Divider()
        }
        }
        Divider()
        
        
        
        
//        Text("\(linkData.title)")
//        Text("\(linkData.link)")
        
        Spacer()
    Text("Save your first bookmark")
        .frame(width: 358, height: 92)
        .font(.system(size: 36, weight: .semibold))
        .multilineTextAlignment(.center)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Bookmark App")
        Spacer()
        
        
        Button {
            showSheet = true
        } label: {
        ZStack {
        RoundedRectangle(cornerRadius: 16)
            .foregroundColor(.black)
            .frame(width: 358, height: 58)
            Text("Add bookmark")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
                .frame(width: 310, height: 22)
            
            }
            
        }
        
        .sheet(isPresented: $showSheet) {
            SheetView(showSheet: $showSheet, textFieldText: self.$linkData.title, textURLText: self.$linkData.link)
            
        }
        
    }
    
    
    
    
  }
//}



struct SheetView: View {
    @Binding var showSheet: Bool
    @Environment(\.presentationMode) var presentationMode
    @Binding var textFieldText: String
    @Binding var textURLText: String
    @State var dataArray: [String] = []
    
    var body: some View {
        //NavigationView {
        VStack {
            
            HStack {
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("x")
                            .padding(.trailing, 22)
                            .padding(.bottom, 22)
                            .padding(.top, 22)
                }
            }
            
            Text("Title")
                .frame(width: 358, height: 22, alignment: .leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 358, height: 46)
                    .foregroundColor(Color(red: 242/255, green: 242/255, blue: 238/255, opacity: 1))
                TextField("Bookmark title", text: $textFieldText)
                    .padding(.leading, 32)
            }
            
            
            Text("Link")
                .frame(width: 358, height: 22, alignment: .leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 358, height: 46)
                    .foregroundColor(Color(red: 242/255, green: 242/255, blue: 238/255, opacity: 1))
                TextField("Bookmark link (URL)", text: $textURLText)
                    .padding(.leading, 32)
            }
            
            
            
            Button {
                saveText()
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 358, height: 58)
                    .background(Color.black.cornerRadius(16))
                    .padding(.top, 24)
            }
            
            
//            ForEach(dataArray, id: \.self) { data in
//                HStack {
//                Text(data)
//                    .foregroundColor(.black)
//                    .padding(.leading, 16)
//                    Spacer()
//                Image("Vector")
//                        .padding(.trailing, 19)
//                }
//                Divider()
//
//            }
            
            
            Spacer()
          }
            
        //}
        
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        dataArray.append(textURLText)
        textFieldText = ""
        textURLText = ""
    }
    
}

    
    
    
}


struct BookmarkList_Preview: PreviewProvider {
    static var previews: some View {
        BookmarkList()
    }
}

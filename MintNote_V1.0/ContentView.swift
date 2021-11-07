//
//  ContentView.swift
//  MintNote_V1.0
//
//  Created by 서동진 on 2021/11/03.
//

import SwiftUI
struct ContentView: View {
    
    var folders = ["😘 감정일기","😥 감정일기"]
    @State var searchString:String = ""
    var body: some View{
        NavigationView{
            List{
                TextField("Search",text:$searchString)
                Section(header:
                    Text("on my Phone")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)){
                    ForEach (folders,id:\.self){folderName in
                        FolderCell(name: folderName)
                    }
                }
                .textCase(nil)
            }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Emotion Dairy")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button("Edit"){
                    print("Edit")
                }
                .buttonStyle(.borderedProminent)
                    .tint(.mint)
            }
            ToolbarItemGroup(placement: .bottomBar){
                Image(systemName: "folder.badge.plus")
                Image(systemName: "square.and.pencil")
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

struct FolderCell: View {
    var name:String
    var body: some View {
        
        HStack{
            
            Image(systemName:"diary")
            Text(name)
        }
    }
}

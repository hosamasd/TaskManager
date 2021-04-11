//
//  TaskSearchView.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 11/04/21.
//

import SwiftUI

struct TaskSearchView: View {
    
    @ObservedObject var taskVM : TaskViewModel
    @State var isSearching = false
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.9171354771, green: 0.9191095233, blue: 0.9391294122, alpha: 1)))
                    .cornerRadius(9)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)))
                    TextField("Search ...", text: $taskVM.searched , onEditingChanged: { (isBegin) in
                        if isBegin {
                            isSearching = true
                        } else {
                            isSearching = false
                        }
                    }).keyboardType(.webSearch)
                    .foregroundColor(.black)
                    
                    if taskVM.searched != "" {
                        Button(action: {
                            taskVM.searched = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.5446127653, green: 0.5465545654, blue: 0.5666400194, alpha: 1)))
                        }
                        
                    }
                    
                    
                }
                .padding(.trailing , 8)
                .padding(.leading , 12)
                
            }.frame(width: 310, height: 38)
            .padding(.leading, 7)
            .padding(.top , 5)
            .animation(.easeInOut(duration: 0.3))
            
            if isSearching {
                Button(action: {
                    hideKeyboard()
                }) {
                    Text("Cancel")
                }
            }
            
        }
    }
}

struct TaskSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSearchView(taskVM: TaskViewModel())
    }
}


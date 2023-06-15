//
//  ContentView.swift
//  Todododo
//
//  Created by user on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    class Task: Identifiable {    //一意のUUIDを含むため、classで宣言
        let id = UUID()
        var taskTitle: String
        var checked: Bool
    
        init(taskTitle: String, checked: Bool){
            self.taskTitle = taskTitle
            self.checked = checked
        }
    }
    
    var tasks = [
        Task(taskTitle: "散歩", checked: false),
        Task(taskTitle: "宿題", checked: true),
        Task(taskTitle: "昼寝", checked: true),
    ]
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(tasks) {task in
                    //                    HStack{
                    if task.checked == true {
                        Text("☑︎ \(task.taskTitle)")
                    }
                    else {
                        Text("□ \(task.taskTitle)")
                    }
            }
                Text("+").font(.title)
        }
        .padding().navigationTitle(Text("ToDo do!"))
        .toolbar {
            ToolbarItem {
                Text("Delete")
            }}
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

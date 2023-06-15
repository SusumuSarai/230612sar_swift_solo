//
//  ContentView.swift
//  Todododo
//
//  Created by user on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    struct Task: Identifiable, Equatable {    //一意のUUIDを含むため、classで宣言、後のエラーでstructに変更
        let id = UUID()
        var taskTitle: String
        var checked: Bool
    
        init(taskTitle: String, checked: Bool){
            self.taskTitle = taskTitle
            self.checked = checked
        }
    }
    
    @State var tasks = [
        Task(taskTitle: "散歩", checked: true),
        Task(taskTitle: "宿題", checked: false),
        Task(taskTitle: "昼寝", checked: true),
    ]
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(tasks) {task in
                    Button(action: {
                        guard let index = self.tasks.firstIndex(of: task) else {
                            return
                        }
                        self.tasks[index].checked.toggle()
                    })

                        {
                            if task.checked {
                                HStack{Text("☑︎")
                                    Text(task.taskTitle).strikethrough().fontWeight(.ultraLight)}
                            }
                            else {
                                HStack{Text("□")
                                    Text(task.taskTitle)}
//                                Text("□ \(task.taskTitle)")
                            }}
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

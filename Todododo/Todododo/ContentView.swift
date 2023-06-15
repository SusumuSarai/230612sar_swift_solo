//
//  ContentView.swift
//  Todododo
//
//  Created by user on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    // タスクの構造定義
    struct Task: Identifiable, Equatable {
        //一意のUUIDを含むため当初classで宣言。後の"Equatable"のエラーでstructに変更
        let id = UUID()
        var taskTitle: String
        var checked: Bool
        
        init(taskTitle: String, checked: Bool){
            self.taskTitle = taskTitle
            self.checked = checked
        }
    }
    
    // 初期タスクのインスタンス配列作成
    @State var tasks = [
        Task(taskTitle: "散歩", checked: true),
        Task(taskTitle: "宿題", checked: false),
        Task(taskTitle: "昼寝", checked: true),
    ]
    
    // タスク入力用
    @State var taskInput = ""
    @State var isEditing :Bool = false
    
    // 画面表示
    var body: some View {
        NavigationStack{
            List{
                //タスク表示処理　※チェックボックス機能付与
                ForEach(tasks) {task in
                    Button(action: {
                        guard let index = self.tasks.firstIndex(of: task) else {
                            return
                        }
                        self.tasks[index].checked.toggle()
                    }){
                        if task.checked {
                            HStack{Text("☑︎")
                                Text(task.taskTitle).strikethrough().fontWeight(.ultraLight)
                            }
                        }
                        else {
                            HStack{Text("□")
                                Text(task.taskTitle)
                            }
                        }
                    }
                }
                //タスク入力処理
                if isEditing {TextField("Plese fill in", text: $taskInput)
                        .onSubmit{tasks.insert(Task(taskTitle: taskInput, checked: false), at: 0)
                            taskInput = ""
                            isEditing = false
                        }
                } else {
                    Button("+"){isEditing = true
                    }
                }
            }
            .padding().navigationTitle(Text("ToDo do!"))
            .toolbar {
                ToolbarItem {
                    Button("Delete"){tasks = tasks.filter({!$0.checked})
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

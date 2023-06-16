//
//  ContentView.swift
//  Todododo
//
//  Created by user on 2023/06/15.
//

import SwiftUI
import MapKit

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
    
    // map関係
    @State var region = MKCoordinateRegion(
        center : CLLocationCoordinate2D(
            latitude: 35.16994578842911,  // 緯度35.710057714926265
            longitude: 136.88515917469581 // 経度139.81071829999996
        ),
        latitudinalMeters: 1000.0, // 南北
        longitudinalMeters: 1000.0 // 東西
    )
    
    // 画面表示
    var body: some View {
        NavigationStack{
            VStack{
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
                Map(coordinateRegion: $region)
                    .edgesIgnoringSafeArea(.bottom)
                
            }
            .navigationTitle(Text("ToDo do!"))
            //タスク完了処理(削除)
            .toolbar {
                ToolbarItem {
                    Button("Delete"){tasks = tasks.filter({!$0.checked})
                    }
                }
            }
        }
    }
}

// 表示用コード
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

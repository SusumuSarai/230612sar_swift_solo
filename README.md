# 230612sar_swift_solo

#Table of content

_[Todo](#Todo_app)_

_[Swift](#swift)_
[Variable](#variable)
[if/switch](#if/switch)
[for-in](#for-in)
[func](#func)
[class](#class)
[struct](#struct)
[enum](#enum)
[protocol](#protocol)
[delegate](#delegate)
[Extension](#Extension)
_[SwiftUI](#swiftUI)_
[View](#View)
[@State](#@State)
[@ObservedObject](#@ObservedObject)
[@EnvironmentObject](#@EnvironmentObject)
[@Binding](#@Binding)
[sheet](#sheet)
[fullScreenCover](#fullScreenCover)
[TextField.onSubmit](#TextField.onSubmit)
[Image.resizable.frame](#Image.resizable.frame)
[Toggle.disabled](#Toggle.disabled)

# Todo_app

# Swift

[【Xcode14/Swift5】SwiftUI で始める iPhone アプリ開発入門講座/Zenn](https://zenn.dev/rikutosato/books/6cee0a2b8aa796)..
[Udemy*Mogi*【iOS】SwiftUI 超入門 - Swift を基礎から学んで iOS (iPhone) アプリを開発しよう](https://toyotajp.udemy.com/course/swiftui-ios-iphone/learn/lecture/25085934#overview).
[Udemy*Yamada*【Swift5 対応】絶対に挫折しない！未経験者がゼロから iOS アプリを開発するための全て！](https://toyotajp.udemy.com/course/swift5ios/learn/lecture/27602562#overview).

文末の `;` は不要

## variable

`var variable = "variable"`.
`let constant = "constant"`.
// Lower camel case.

`let abc: String = "apple"` String 型.
`let def: Int = 3` Int 型：整数型.
`let ghi: Double = 1.2` double 型：浮動小数点型。小数も扱える.
`let isReady: Bool = true` //true or false.

//型推論　〜　型宣言は省略しても書ける.
※注）Double に整数値を入れると型推論しない.

比較演算子
`== , != , > , <`.

配列型：
`ver stringArray = ["a", "b", "c"]`.
`stringArray.append("d")` //　要素の追加.
`stringArray.remove(at: 0)` //　要素の削除.

.map //同じ.
.coontain.

Optional 型：値があるものないものある時に使用.
`let int: Optional<Int> = 1`.
`let intNil: Optional<Int> = nil` //null でなくて nil.
// 型の後ろに ? をつけても Optional 型になる.
`let int: Int? = 1`.
`let intNil: Int? = nil`.
※Optional 型はそのままでは四則演算できず、int 型にする必要あり
`let result = int! + 2 ` // 後ろに ! でアンラップすると演算できる.
// 初期値の設定 "??"
`let one = int ?? = 10`.
`let two = intNull ?? = 20` // intNull は Nil のため初期値 20 が使われる.

## if/switch

if 文　/ js と同じ.
※ オプショナルバインディング.

```
let optionalInt: Int? = nil
if let int = optionalInt {
print(int)
}
// nil でなければ optional 外して実行
// nil の場合は if let 実行しない

```

switch 文.

```
let numberText = "one"
switch numberText {
  case "one":
    print("nunber = 1 です")
  case "two":
    print("nunber = 2 です")
  default:
    print("nunber は１、２以外です")
}

// Range型
`let range = 1...5` // 5 を含む
`let range = 1..<5` // 5 を含まない
```

## for-in

// for-in 文

```
let array = [1, 2, 3]
for element in array {  // "of" ではない
  print(element)
}

let range = 1...3
for i in range {
  print(i)
}

var number =1
while number <= 3 {
  print(number)
  number += 1
}

var countUpNuumber = 1
while countUpNumber <= 10 {
  let isEven:Bool = countUpNumber %2 == 0
  if isEven{
    print("\(countUpNumber)は偶数です。")
  }
  countUpNumber += 1
}

```

## func

```
// 引数の型を定義
func say(text: String) {
print("Hello")
}
say(text: Hello)

// 戻り値あり〜戻り値の型を定義 "-> Int {"
func double(number: Int) -> Int {
let result = number \* 2
return result
}

// Array型の例  ※ 外部引数 "from" 要注意
func getEven(from array: [Int]) -> [Int] {
  var result: [Int] = []
  for element in array {
    let isEven = element % 2 == 0
    if isEven{
      result.append(element)
    }
  }
  return result
}
let array = [1, 2, 3, 4, 5]
let result = getEven(from: array)
print (result)

// guard文　〜 満たさなかった時に終了する
func sum(first: Int?, second: Int?) -> Int {
  guard first != nil, second != nil else {
    print("firstかsecondがnilです")
    return 0
  }
  return first! + second!
}
let result1 = sum(first: 1, second: 2)
print(result1)  // "3"
let result2 = sum(first: nil, second: 2)
print(result2)  // "0"

// Int? : "?" はOptional型のこと
// first! : "!" はOptional型をアンラップ

//guard文その２　オプショナルバインディング〜Optional型を非Optional型へ変換
func sum(one: Int?, two: Int?) -> Int {
  guard let one = one, let two = two else {
    print("firstかsecondがnilです")
    return 0
  }
  return one + two
}
let result1 = sum(one: 1, two: 2)
print(result1)  // "3"
let result2 = sum(one: nil, two: 2)
print(result2)  // "0"
```

// 外部引数（関数を呼び出す時）と内部引数（内部で使うとき）あり

## 構成要素 class 他

### class

// class : 汎用性の高い型、設計図

```
class Automobile {        // 大文字
  var maker = "TOYOTA"    // プロパティ
  var name = "CT"
  var doorCount = 5
  var displacement = 2000 // cc

  func horn() {           // メソッド
    print("puppu")
  }

  // イニシャライザ（＝初期化子）
  init(maker: String, name: String, doorCount: Int,displacement: Int) {
    self.maker = maker
    self.name = name
    self.doorCount = doorCount
    self.displacement = displacement
  }
}

// インスタンス化（＝初期化）
let myCar = Automobile(maker: "NISSAN", name:"フェアレディZ", doorCount: 3, displacement: 3700)

printo(myCar.maker)
printo(myCar.name)

//jsはconstructor、superの時にはthis、イニシャライザなし
```

### struct

// class（プログラムの設計図を表現する型） と似た機能を持つ型。
// struct 　はデータ構造や値を表現する型。構造体 ※イニシャライザ不要

```
struct Drink {
var name: String    // = "お茶"
var price: Int      // = 150 //円
var amount: Int     // = 500 //ml

    func outputData() {
      print(name)
      print(price)
      print(amount)
    }

}

let drink = Drink(name: "コーラ", price: 100, amount: 150)
drink.outputData()
```

// 配列の例

```
struct UserData {
    var tasks = [
        Task(title: "散歩", checked: true),
        Task(title: "料理", checked: false),
        Task(title: "筋トレ", checked: true)
    ]
}

// データ更新時にView変更するには
class UserData: ObservableObject {
    @Published var tasks = [
        Task(title: "散歩", checked: true),
        Task(title: "料理", checked: false),
        Task(title: "筋トレ", checked: true)
    ]
}
```

### enum

// enum（列挙型）： 予め定められた種別を表現する型
※プロパティは定義できず
（storedProperty／値を保有 : X, computedProperty／値を参照 : O ）

```
enum TraficLightType {
  case blue
  case yellow
  case red
}

let signalType = TraficLightType.red
<!-- print(signalType) -->

switch signalType {
  case .blue:
    print("signalはblueです。")
  case .yellow:
    print("signalはyellowです。")
  case .red:
    print("signalはredです。")
}
```

### protocol

複数クラス間で共通のインターフェースや機能を持たせる約束事

```
protocol Animal{
  var subjectName: String { get }
  func say()
}

protocol Pets {
  var ownerName: String { get }
}

class Dog: Animal,Pets {
  var subjectName = "イヌ科"
  var ownerName = "Taroh"
    func say() {
      print("Wan-Wan")
  }
}

class Cat: Animal {
  var subjectName = "ネコ科"
  var ownerName = "Hiroshi"
  func say() {
      print("Nya-Nya")
  }
}

//それぞれのclassをインスタンス化してメソッド実行
let dog = Dog()
dog.say()

let cat = Cat()
cat.say()
```

### Delegate

//（委任・委託）あるクラスの特定の処理完了時に他のクラスに別の処理を実行させる
//難しい 😓

```
protocol BathDelegate {
  func notification(currentStorage: Int)
}

class Controller: BathDelegate {
  let bath = Bath()
  var waterStrageLimit = 0 // L

  func registerDelegate() {
    bath.delegate = self
  }
  func startInject() {
    bath.injectWater()
  }
  func notification(currentStorage: Int) {
    let isStrageLimit = currentStorage >= waterStrageLimit
    if isStrageLimit {
      bath.shouldStopInjection = true
      print("注水を終了します")
    }
  }
}

class Bath {
  var currentStorage = 0 // L
  var shouldStopInjection = false
  var delegate: BathDelegate?

  func injectWater() {
    while !shouldStopInjection {
      currentStorage += 50
      print("現在の水量は\(currentStorage)リットルです。")
      delegate?.notification(currentStorage: currentStorage)
    }
  }
}

let controller = Controller()

controller.waterStrageLimit = 200 // L
controller.registerDelegate()
controller.startInject()
```

### Extension

// クラスや型の拡張機能を持たせる構文

```
class User {
  var name = "Undefined"
}

extension User {
  func printUserName() {
      print(name)
  }
}

let user = User()
//user.printUserName()

// 1.1ファイルあたりのコード量を減らす　＝　プログラムを分割する

// 2.処理ブロックの関心ごとを分割する
protocol TImelineDelegate {
  func post(text: String)
}

extension User: TimelineDelegate {
  func post(text: String) {
    print("TImelineに\(text)が投稿されました")
  }
}
```

## SwiftUI

### View

見た目を作る部品
モディファイア：見た目を変えるもの
View.モディファイア

### Text

```
Text("Hello, world!")
  .foregroundColor(.green)  // 文字色変更
  .padding(.vertical, 20)    // Viewに余白を設定(上下に20ずつ)

// Content View ~選択〜　"⌘+クリック"でShow Swift Inspector からも変更可
```

### List

複数の UI 部品を縦にならべて表示

```
List{
Text("Apple")
.padding()
Text("Orange")
.padding()
Text("Banana")
.padding()
}
```

### NavigationStack(iOS16-)/NavigationView

```
NavigationStack{
  Text("Apple")
    .navigationTitle(Text("Fruits"))
    .toolbar {
      ToolbarItem {
        Text("Item")
      }
  }
}
```

### HStack/VStack

// 水平方向、垂直方向に並べる

```
HStack{
Text("Apple")
  .padding()
Text("Orange")
  .padding()
Text("Banana")
  .padding()
}
```

### Button

```
Button(action:　{
  print("ボタンがおされました")
})
```

### Button.disabled

// ボタンが押せなくなる

```
struct ContentView: View {
    @State var isDisabled = false
    var body: some View {
        Button("ボタン") {
            isDisabled = true
        }
        .disabled(isDisabled)
    }
}
```

### ForEach

```
List {
ForEach(0..<11) { num in
Text("\(num): Hello!")
}
}

//Array の場合
struct Human: Identifiable {
  let id = UUID()
  let name: String
}
struct ArraycontentView: View {
  let humans = [
    Human(name: "tanaka"),
    Human(name: "suzuki"),
    Human(name: "satp")
  ]
  var body: some View{}
    List {
      ForEach(human) { human in
      Text("\(human.name), Hello!")
}}}
```

### @State

//useState
値が更新されたら View がリロード(再描画)される.
struct の中で値を変更することができる.

```
struct ContentView: View {
    @State var lastName = "田中"
    let firstName = "太郎"
    var body: some View {
        VStack {
            Button(action: {self.lastName = "島田"}) {
                Text("名字を変える")
            }
            Text(lastName + firstName)
        }
    }
}
```

### @ObservedObject

//@Published のついた値（インスタンス）が変更されると@ObservedObject が更新される

```
// ContentView
struct ContentView: View {
    @ObservedObject var userData = UserData(name: "鈴木", age: 20)

    var body: some View {
        VStack {
            Button(action: {
                userData.name = "佐藤"
            })
            {
                Text("名前を変える")
                    .padding()
            }

            Button(action: {
                userData.age += 1
            })
            {
                Text("歳を増やす")
                    .padding()
            }

            Text("\(userData.name)の年齢は『\(userData.age) 』歳")
        }
    }
}

// UserDeta
class UserData: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


```

### @EnvironmentObject

@ObservedObject var 変数名 = クラス名()　それぞれ独立した値.
@EnvironmentObject var 変数名：クラス名　共通の値.
@Published.

TextField(プレースホルダー, text:$入力を格納する変数).
.onSubmit{行いたい処理} : リターンきーを押した時の処理

Image("画像の名前")
.resizable()　//サイズ変更可能に.
.frame(width: 横幅, height: 縦幅, alignment:.寄せたい方向)　//サイズ変更.

### @Binding

他の View と値を共有。更新された時に他の View も更新.
別の View の変数を変更するためのカスタム属性.
画面 A の@State を画面 B の@Binding に紐づけることで、画面 B で間接的に@State を変更することができる.

```

struct ContentView: View {
@State var text = "Hello, world!"
@State var isShowBView = false

    var body: some View {
        VStack {
            Text(text)
                .padding()
            Button("画面Bへ") {
                isShowBView = true
            }
        }
        .sheet(isPresented: $isShowBView) {
            BView(text: $text)
        }
    }

}
struct BView: View {
@Binding var text: String

    var body: some View {
        Button("ボタン") {
            text = "こんにちは、世界"
        }
    }

}

```

### sheet

//別の画面を表示

```
struct COntentView: View {
＠State var showingSheet = false

var body: some View {
Button(action: {
showingSheet = true
}) {
Text("sheet を表示")
}
}
}

struct SheetView: View {
var body: someView {
Text("SheetView")
}
}
```

### fullScreenCover

使い方は "sheet" と同じ。
カードを重ねたような表示になるシート（sheet）とは異なり、画面全体を覆うモーダル View を表示

### TextField.onSubmit

// input 要素
// @State で変数宣言(格納)　※useState を return 前に描く感じか
// TextField(プレースホルダー, text: $入力を格納する変数)
// .onSubmit{リターンキー入力で行いたい処理}

```
struct ContentView: View {
  @State var favoriteAnimal = ""
  var body: some View {
    VStack {
      TextField("好きな動物を入力してください", text: $favoriteAnimal)
        .onSubmit {         // 入力フィールドを空にする
          favoriteAnimal = ""
        }
      Text("好きな動物は\(favoriteAnimal)")
      .padding()
    }
  }
}
```

### Image.resizable.frame

// Image("画像の名前")
// .resizable()
// .frame(width: 横幅, height: 縦幅, alignment: .寄せたい方向)
// 左のフォルダ構成のところの [Assets] を選択
// 右クリックで "iport..." を選択し画像を追加
※画像の名前を短くしておく

```
struct ContentView: View {
    @State var favoriteAnimal = ""
    var body: some View {
       Image("dog1")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
        }
    }
```

### Toggle.disabled

// On/Off の切り替えボタン
// Toggle("表示したい文字列", isOn: $bool 型の変数)

```
struct ContentView: View {
    @State var flag = true  // @State で flag 宣言
    var body: some View {   // description で flag の bool型をstring型に変換
        Toggle(flag.description, isOn: $flag)
    }
}
```

### Toggle.toggleStyle

// 難しい

```
struct GenderToggleStyle: ToggleStyle{
struct ContentView: View {
    @State var isMen = true
    var body: some View {
        Toggle("Toggle", isOn: $isMen)
            .toggleStyle(GenderToggleStyle())
    }
  }
}
struct GenderToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Button("男性") {
                configuration.isOn.toggle()
            }
            .disabled(configuration.isOn)
            Button("女性") {
                configuration.isOn.toggle()
            }
            .disabled(!configuration.isOn)
        }
    }
}

```

# CircularSlider
![spm](https://img.shields.io/badge/SwiftPM-compatible-brightgreen?style=flat-square&logo=swift)
![spm](https://img.shields.io/github/license/terlan98/CircularSlider?style=flat-square)

A view that can be interacted with by dragging a knob over a circular path to select a value

## Features
- [x] 🌈 Customizable colors 
- [x] 📐 Customizable size 
- [x] 🔠 Customizable font 
- [x] 🏷 Customizable text with prefix and suffix

## 🛠 How do I install it?
You can install `CircularSlider` by going to your Project settings > Swift Packages and add the repository by providing the GitHub URL. Alternatively, you can go to File > Swift Packages > Add Package Dependencies...

## 🚀 How do I use it?
### Simple Example
<img src="https://github.com/terlan98/CircularSlider/blob/main/Screenshots/1-d.png?raw=true#gh-dark-mode-only" width="150">
<img src="https://github.com/terlan98/CircularSlider/blob/main/Screenshots/1-l.png?raw=true#gh-light-mode-only" width="150">

```swift
struct ContentView: View {
    @State var value = 50.0

    var body: some View {
        VStack {
            CircularSlider(currentValue: $value)
        }
    }
}
```
----

### Fancy Example
<img src="https://github.com/terlan98/CircularSlider/blob/main/Screenshots/2-d.png?raw=true#gh-dark-mode-only" width="150">
<img src="https://github.com/terlan98/CircularSlider/blob/main/Screenshots/2-l.png?raw=true#gh-light-mode-only" width="150">

```swift
struct ContentView: View {
    @State var value = 25.0

    var body: some View {
        VStack {
            CircularSlider(currentValue: $value,
                           minValue: 1,
                           maxValue: 30,
                           knobColor: .orange,
                           progressLineColor: .orange,
                           font: .custom("HelveticaNeue-Light", size: 35),
                           backgroundColor: .gray.opacity(0.05),
                           currentValueSuffix: "$")
        }
    }
}
```
----

### Even Fancier Example...
<img src="https://github.com/terlan98/CircularSlider/blob/main/Screenshots/3-d.png?raw=true#gh-dark-mode-only" width="155">
<img src="https://github.com/terlan98/CircularSlider/blob/main/Screenshots/3-l.png?raw=true#gh-light-mode-only" width="155">

```swift
struct ContentView: View {
    @State var value = 50.0

    var body: some View {
        VStack {
            CircularSlider(currentValue: $value,
                           minValue: 1,
                           maxValue: 60,
                           knobColor: .init(red: 0.5, green: 0.5, blue: 0.5),
                           progressLineColor: .init(red: 0.84, green: 0.93, blue: 0.09),
                           font: .custom("HelveticaNeue-Light", size: 35),
                           backgroundColor: .yellow.opacity(0.09),
                           currentValueSuffix: " min")
        }
    }
}
```

# License
CircularSlider is released under the MIT license. See [LICENSE](https://github.com/terlan98/CircularSlider/blob/main/LICENSE) for details.

<a href="https://www.buymeacoffee.com/terlan98" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 2.5em !important;width: 9em !important;" ></a>


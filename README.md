# CircularSlider

A view that can be interacted with by dragging a knob over a circular path to select a value

## Features


## 🛠 How do I install it?
Using Xcode 11+, you can install `CircularSlider` by going to your Project settings > Swift Packages and add the repository by providing the GitHub URL. Alternatively, you can go to File > Swift Packages > Add Package Dependencies...

## 🚀 How do I use it?
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
                           backgroundColor: .yellow.opacity(0.06),
                           currentValueSuffix: " min")
        }
    }
}
```

# License
CircularSlider is released under the MIT license. See LICENSE for details

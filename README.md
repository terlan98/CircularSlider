# CircularSlider
![spm](https://img.shields.io/badge/SwiftPM-compatible-brightgreen?style=flat-square&logo=swift)
![spm](https://img.shields.io/github/license/terlan98/CircularSlider?style=flat-square)

A view that can be interacted with by dragging a knob over a circular path to select a value

## Features


## 🛠 How do I install it?
You can install `CircularSlider` by going to your Project settings > Swift Packages and add the repository by providing the GitHub URL. Alternatively, you can go to File > Swift Packages > Add Package Dependencies...

## 🚀 How do I use it?
<table>
    <tr>
        <td> 
            
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
            
        </td>
        <td> 300 </td>
    </tr>
</table>


# License
CircularSlider is released under the MIT license. See [LICENSE](https://github.com/terlan98/CircularSlider/blob/main/LICENSE) for details

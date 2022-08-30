//
//  CircularSlider.swift
//  CircularSliderTest
//
//  Created by Tarlan Ismayilsoy on 28.08.22.
//

import SwiftUI

// MARK: - CircularSlider
/// A view that can be interacted by dragging a knob over a circular path to select a value
public struct CircularSlider: View {
    /// The current value of the slider
    @Binding var currentValue: Double
    
    /// The minumum value that can be set
    var minValue: Double = 0
    
    /// The maximum value that can be set. Must be larger than `minValue`
    var maxValue: Double = 100
    
    /// The radius of the knob
    var knobRadius: Double = 11
    
    /// The color of the knob
    var knobColor: Color = .white
    
    /// The radius of the whole slider
    var radius: Double = 80
    
    /// The color of the line that is drawn as the knob moves
    var progressLineColor: Color = .green
    
    /// The color of the track on which the knob moves
    var trackColor: Color = .gray.opacity(0.2)
    
    /// The line width used for the progress line (the line that is drawn upon drag)
    var lineWidth: Double = 5
    
    /// The font used for showing the current value
    var font: Font = .system(size: 30)
    
    /// The background color of the slider
    var backgroundColor: Color = .clear
    
    /// The radius of the background
    var backgroundRadius: Double = 100
    
    /// Controls whether a `Text` showing the current value should be shown
    var showsCurrentValueAsText = true
    
    /// A string that precedes the current value. Shown only if `showsCurrentValueAsText` is set to true
    var currentValuePrefix = ""
    
    /// A string that follows the current value. Shown only if `showsCurrentValueAsText` is set to true
    var currentValueSuffix = ""
        
    /// The angle of the circle that should be filled
    @State private var angle: Double = 0
    
    public var body: some View {
        ZStack {
            Circle() // background
                .foregroundColor(backgroundColor)
                .frame(width: backgroundRadius * 2, height: backgroundRadius * 2)
            
            Circle() // track line (static, remains in the background)
                .stroke(trackColor,
                        style: StrokeStyle(lineWidth: lineWidth * 1.3, lineCap: .butt))
                .frame(width: radius * 2, height: radius * 2)
                
            Circle() // progress line (dynamic, follows the knob)
                .trim(from: 0.0, to: valueAsPercentage(value: currentValue))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(progressLineColor)
                .frame(width: radius * 2, height: radius * 2)
                .rotationEffect(.degrees(-90))
            
            Circle() // knob
                .fill(knobColor)
                .shadow(radius: 1)
                .frame(width: knobRadius * 2.5, height: knobRadius * 2.5)
                .padding(10)
                .offset(y: -radius)
                .rotationEffect(Angle.degrees(angle))
            
            Circle() // knob (invisible, larger, makes user interaction easier)
                .fill(.blue.opacity(0.000001))
                .frame(width: knobRadius * 6, height: knobRadius * 6)
                .padding(10)
                .offset(y: -radius)
                .rotationEffect(Angle.degrees(angle))
                .gesture(DragGesture(minimumDistance: 0.0)
                    .onChanged({ value in
                        change(location: value.location)
                    }))
            
            if showsCurrentValueAsText {
                Text("\(currentValuePrefix + String.init(format: "%.0f", currentValue) + (currentValueSuffix))")
                    .font(font)
                    .minimumScaleFactor(0.01)
                    .foregroundColor(.primary)
            }
        }
        .onAppear {
            currentValue = currentValue < minValue ? minValue : currentValue
            currentValue = currentValue > maxValue ? maxValue : currentValue
            angle = valueToAngle(value: currentValue)
        }
    }
    
    /// Updates the angle and the value of the slider
    private func change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let newAngle = atan2(vector.dy - (knobRadius * 4), vector.dx - (knobRadius * 4)) + .pi/2.0
        
        // convert angle range from (-π to π) to (0 to 2π)
        let fixedAngle = newAngle < 0.0 ? newAngle + 2.0 * .pi : newAngle
        
        // convert angle to value
        let newValue = angleToValue(angleInRadians: fixedAngle)
        
        let currentValueAsPercentage = valueAsPercentage(value: currentValue)
        
        let diff = abs(newValue - currentValue)
        
        let diffThreshold = 0.15 * (maxValue - minValue)
        
        print(currentValueAsPercentage) // TODO: REMOVE
        print(newValue, currentValue, diff) // TODO: REMOVE
        
        if currentValueAsPercentage > 0.9
            && diff > diffThreshold {
            // for smoothing 99% to 100% transition
            currentValue = maxValue
            angle = valueToAngle(value: currentValue)
        }
        else if currentValueAsPercentage < 0.1
                    && diff > diffThreshold {
            // for preventing direct transition to 100 from the right semicircle (ccw movement)
            currentValue = minValue
            angle = valueToAngle(value: currentValue)
        }
        else { // default behavior
            currentValue = newValue
            angle = radiansToDegrees(fixedAngle)
        }
    }
    
    /// Convert the given angle to value
    private func angleToValue(angleInRadians: Double) -> Double {
        let angleAsPercentage = angleInRadians / (2.0 * .pi)
        
        return angleAsPercentage * (maxValue - minValue) + minValue
    }
    
    /// Convert the given value to angle
    private func valueToAngle(value: Double) -> Double {
        return 360 * valueAsPercentage(value: value)
    }
    
    /// Expresses the given value as a percentage of the [minvalue, maxValue] range
    private func valueAsPercentage(value: Double) -> Double {
        return (value - minValue) / (maxValue - minValue)
    }
    
    /// Convert the given radian value to degrees
    private func radiansToDegrees(_ radians: Double) -> Double {
        return radians * 180 / .pi
    }
}

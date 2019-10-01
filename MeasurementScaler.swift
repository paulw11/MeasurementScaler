//
//  MeasurementScaler.swift
//
//  Copyright © 2019 Paul Wilkinson. 
//


extension Measurement where UnitType: Dimension {

    /// Attempt to find a  `UnitType` that produces a value less than `target`
    /// 
    /// See [Scaling Measurement in Swift](https://wilko.me/wordpress/?p=371)
    /// - Parameters:
    ///   - scales: An array of `UnitTypes` that will be applied in order seeking a value less than `target`.  This array should be in increasing order of coefficient
    ///   - target: The target value
    /// - Returns:
    ///   `Self` converted to the `UnitType` that produces a value less than `target` or scaled by the last `UnitType` in the `scales` array
   
    func scale (scales:[UnitType], target: Double) -> Measurement {
        guard !scales.isEmpty, self.value > target else {
            return self
        }
        var returnMeasure = self
        for unit in scales {
            returnMeasure.convert(to: unit)
            if returnMeasure.value < target {
                break
            }
        }
        return returnMeasure
    }
}

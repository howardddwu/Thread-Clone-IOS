//
//  Timestamp.swift
//  Thread Clone
//
//  Created by Howard Wu on 11/11/24.
//

import Firebase

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.weekOfMonth, .day, .hour, .minute, .second]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}

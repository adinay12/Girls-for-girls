//
//  ExtensionSegmentedControl.swift
//  Girls for girls
//
//  Created by Adinay on 31/3/23.
//

import UIKit

extension UISegmentedControl {
    func replaceSegments(segments: Array<String>) {
        self.removeAllSegments()
        for segment in segments {
            self.insertSegment(withTitle: segment, at: self.numberOfSegments, animated: false)
        }
    }
}


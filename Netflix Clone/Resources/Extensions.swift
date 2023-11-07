//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 06/11/23.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

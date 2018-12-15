//
//  Extension.swift
//  ChatApp
//
//  Created by MACBOOK PRO RETINA on 16/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import Foundation

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        return dateFormatter.date(from: customString)!
    }
}

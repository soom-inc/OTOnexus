//
//  OTOSurveyDateQuestion.swift
//  OTOnexus
//
//  Created by Nicholas Schlueter on 11/27/17.
//

import Foundation

public class OTOSurveyDateQuestion: OTOSurveyQuestion {
    public var date:Date?
    
    override func data() -> String? {
        if let date = self.date {
            return OTODateHelper.shared.yearMonthDayParser.string(from: date)
        } else {
            return nil
        }
    }
}
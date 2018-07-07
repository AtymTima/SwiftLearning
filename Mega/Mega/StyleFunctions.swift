//
//  StyleFunctions.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation
import UIKit

func makeRoundCorners() {
    chooseAva.layer.cornerRadius = avaImage.frame.size.width / 2
    chooseAva.clipsToBounds = true
}

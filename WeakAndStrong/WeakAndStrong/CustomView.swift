//
//  CustomView.swift
//  WeakAndStrong
//
//  Created by swuad_11 on 27/06/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit //ios만들떄는 UIKit
//UIView를 상속했다는 것은 기존에 UIView가 가지고 있는 모든 기능은 그대로 사용가능

class CustomView :UIView {
    deinit {
    print("view deinit")
    }
}

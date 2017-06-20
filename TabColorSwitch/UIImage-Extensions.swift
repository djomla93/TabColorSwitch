//
//  UIImage-Extensions.swift
//  TabColorSwitch
//
//  Created by Aleksandar Vacić on 26.3.17..
//  Copyright © 2017. Radiant Tap. All rights reserved.
//

import UIKit


extension UIImage {
	static func imageWithColor(_ tintColor: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(size, false, 0)

		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		context.translateBy(x: 0, y: size.height)
		context.scaleBy(x: 1.0, y: -1.0);
		context.setBlendMode(.normal)

		let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		tintColor.setFill()
		context.fill(rect)

		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		return newImage
	}
}

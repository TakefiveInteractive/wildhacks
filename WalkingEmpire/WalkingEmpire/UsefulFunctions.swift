//
//  UsefulFunctions.swift
//  WalkingEmpire
//
//  Created by Kedan Li on 14/11/23.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class UsefulFunctions: NSObject {
    
    class func changeImageSize(image: UIImage, size: CGSize)->UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        var img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    //Change Alpha of UIImage
    class func imageByApplyingAlpha(image: UIImage, alpha: CGFloat)->UIImage{
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
        var ctx: CGContextRef = UIGraphicsGetCurrentContext()
        var area = CGRectMake(0, 0, image.size.width, image.size.height)
        
        CGContextScaleCTM(ctx, 1, -1)
        CGContextTranslateCTM(ctx, 0, -area.size.height)
        CGContextSetBlendMode(ctx, kCGBlendModeMultiply)
        CGContextSetAlpha(ctx, alpha)
        CGContextDrawImage(ctx, area, image.CGImage)
        
        var newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return newImg
    }

    //Calculate distance between two coordinates
    class func calculateCoordinateDistanceOfTwoPoints(coordinate1: CLLocationCoordinate2D, coordinate2: CLLocationCoordinate2D)->Double{
        var x: Double = 0
        var y: Double = 0
        var out: Double = 0
        var distance: Double = 0
        let pi: Double = 3.14159266
        let e: Double = 2.71828182846
        var r: Double = 6.371228 * pow(e, 6)
        var jd2: Double = coordinate1.longitude
        var wd2: Double = coordinate1.latitude
        var jd1: Double = coordinate2.longitude
        var wd1: Double = coordinate2.latitude
        
        if jd2 >= jd1 {
            x = (jd2 - jd1) * pi * r * cos(Double((wd1 + wd2)/2.0 * pi/180.0))/180
        } else {
            x = (jd1 - jd2) * pi * r * cos(Double((wd1 + wd2)/2.0 * pi/180.0))/180
        }
        
        if wd2 >= wd1{
            y = (wd2 - wd1) * pi * r / 180
        } else {
            y = (wd1 - wd2) * pi * r / 180
        }
        out = hypot(x, y)
        
        return out
    }

}

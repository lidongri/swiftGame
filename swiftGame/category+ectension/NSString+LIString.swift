//
//  LIString.swift
//  yaoxiaziswift
//
//  Created by 李东日 on 2023/5/29.
//

import UIKit

extension String {
    //获取当前时间戳
    static func currentTimeStr() -> String {
        let date = NSDate(timeIntervalSinceNow: 0)
        let time = date.timeIntervalSince1970*1000
        let timeStr = String(format: "%.0f", arguments: [time])
        return timeStr
    }
    
    //获取某个时间的时间戳
    static func getTimesStr(dateStr : String, format: String) -> TimeInterval {
        let dateFormatter = DateFormatter()// 创建一个时间格式化对象
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = format// 设定时间的格式
        let tempDate = dateFormatter.date(from: dateStr)// 将字符串转换为时间对象
        let time = tempDate!.timeIntervalSince1970
//        let timeStr = String(format: "%.0f", arguments: [time])
        return time
    }
}

//: Playground - noun: a place where people can play

import UIKit

//(1)
func getDate(date: Date, zone: Int = 0) -> String {
    let formatter = DateFormatter()  //实例化格式化类
    formatter.dateFormat = "yyyy年MM月dd日EEEE aa KK:mm"  //指定格式化的格式
    formatter.locale = Locale(identifier: "zh_cn")
    if zone >= 0 { //当传入的为正数时，在东半区
        formatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    } else {  //当传入的为负数时，在西半区
        formatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    
    let dateString = formatter.string(from: now)  //将传入的日期格式化为字符串
    return dateString
}

let now = Date()  //获取当前时间日期

let beijing = getDate(date: now, zone: +8)  //获取当前北京的时间
print("北京: \(beijing)")  //输出北京时间

let tokyo = getDate(date: now, zone: 9)  //获取当前东京的时间
print("东京: \(tokyo)")  //输出东京时间

let newYork = getDate(date: now, zone: -5)  //获取当前纽约的时间
print("纽约: \(newYork)")  //输出纽约时间

let london = getDate(date: now)  ////获取当前伦敦的时间
print("伦敦: \(london)")  //输出伦敦时间

//(2)
var str1:String = "Swift is a powerful and intutive programming language for iOS,OS X,tvOS,and watch OS."
var str2=(str1 as NSString).substring(with: NSMakeRange(6,20))
print(str2)
var str3 = str1.replacingOccurrences(of: "OS", with: "")
print(str3)

//(3)
let fileManager = FileManager.default
if var docPath = fileManager.urls(for:.documentDirectory,in:.userDomainMask).first{
    docPath.appendPathComponent("沙盒.txt")
    print(docPath.path)
    try str3.write(to:docPath,atomically:true,encoding:.utf8)
    let dic = ["beijing":beijing,"tokyo":tokyo,"newYork":newYork,"london":london,"string":str3] as AnyObject
    print(dic)
    dic.write(to : docPath,atomically:true)
}
//(4)
var str4:URL?
do{
    let url = URL(string:"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3610766240,711474623&fm=27&gp=0.jpg")
    let data = try Data(contentsOf:url!)
    if var docPath = fileManager.urls(for:.documentDirectory,in:.userDomainMask).first{
        docPath.appendPathComponent("沙盒.txt")
        str4 = docPath
        let picData = data as AnyObject
        print(docPath.path)
        picData.write(to : docPath,atomically:true)
    }
}catch{
    
}

//(5)
do{
    let url = URL(string : "http://www.weather.com.cn/adat/sk/101270101.html")
    let data = try Data(contentsOf: url!)
    
    let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
    if var dic = object as? [String:Any] {
        print(dic["weatherinfo"])
        if let weather = dic["weatherinfo"] as? [String:Any] {
            print(weather["city"])
        }
    }
}catch{
    
}







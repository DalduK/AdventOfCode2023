import UIKit

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}



let fileURL = Bundle.main.url(forResource: "code", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let list = content.split(separator: "\n")

func partOne() {
    var sum = 0
    for i in list {
        let firstNum = i.first(where: {char in Int(char.description) != nil})
        let lastNum = i.last(where: {char in Int(char.description) != nil})
        let calibration = "\(firstNum!)\(lastNum!)"
        sum += Int(calibration) ?? 0
    }
    print(sum)
}

func returnFirstIndex(s: String) -> [String: Int]? {
    if let firstIndex = s.firstIndex(where: {char in Int(char.description) != nil}) {
        let firstNum = s.first(where: {char in Int(char.description) != nil})
        let distance = s.distance(from: s.startIndex, to: firstIndex)
        return ["\(firstNum!)": distance]
    }
    return nil
}

func returnLastIndex(s: String) -> [String: Int]? {
    if let firstIndex = s.lastIndex(where: {char in Int(char.description) != nil}) {
        let firstNum = s.last(where: {char in Int(char.description) != nil})
        let distance = s.distance(from: s.startIndex, to: firstIndex)
        return ["\(firstNum!)": distance]
    }
    return nil
}

func partTwoTwo() {
    let nums = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var sum = 0
    for i in list {
        var numList: [Int: Int] = [:]
        if let firstIndex = i.firstIndex(where: {char in Int(char.description) != nil}) {
            let firstNum = i.first(where: {char in Int(char.description) != nil})
            let distance = i.distance(from: i.startIndex, to: firstIndex)
            if let num = Int(firstNum?.description ?? "0") {
                numList[distance] = num
            }
        }
        if let lastIndex = i.lastIndex(where: {char in Int(char.description) != nil}) {
            let lastNum = i.last(where: {char in Int(char.description) != nil})
            let distance = i.distance(from: i.startIndex, to: lastIndex)
            if let num = Int(lastNum?.description ?? "0") {
                numList[distance] = num
            }
        }
        for j in nums {
            let ranges = i.ranges(of: j)
            for range in ranges {
                let num = i.substring(with: range)
                if let val = nums.firstIndex(where: {$0 == num}) {
                    let distance = i.distance(from: i.startIndex, to: range.lowerBound) + 1
                    numList[distance] = val + 1
                }
            }
        }
        let listFinal = numList.sorted(by: {$0.0 < $1.0})
        let getFirstVal = listFinal.first
        let getLastVal = listFinal.last
        if let firstVal = getFirstVal?.value, let LastVal = getLastVal?.value {
            let str = "\(firstVal)\(LastVal)"
            sum += Int(str) ?? 0
        }
    }
    print(sum)
}

func partTwo() {
    let nums = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var sum = 0
    for i in list {
        var tempList: [String: Int] = [:]
        if let firstIndex = returnFirstIndex(s: String(i)), let lastIndex = returnLastIndex(s: String(i)) {
            if let first = firstIndex.first, let last = lastIndex.first {
                tempList[first.key] = first.value
                tempList[last.key] = last.value
            }
        }
        for j in nums {
            let ranges = i.ranges(of: j)
            for range in ranges {
                let num = i.substring(with: range)
                tempList[j] = i.distance(from: i.startIndex, to: range.lowerBound) + 1
            }
        }
        if tempList.count == 1 {
            var strTemp = ""
            if let key = tempList.first?.key {
                if let val = nums.firstIndex(where: {$0 == key}) {
                   strTemp += "\(val + 1)\(val + 1)"
                }
                sum += Int(strTemp) ?? 0
            }
        } else if tempList.count > 0 {
            let maxVal = tempList.values.max() ?? 0
            let minVal = tempList.values.min() ?? 0
            var strTemp = ""
            if let key = tempList.someKey(forValue: minVal) {
                if let int = Int(key) {
                    strTemp += "\(int)"
                } else if let val = nums.firstIndex(where: {$0 == key}) {
                    strTemp += "\(val + 1)"
                }
            }
            if let key = tempList.someKey(forValue: maxVal) {
                if let int = Int(key) {
                    strTemp += "\(int)"
                } else if let val = nums.firstIndex(where: {$0 == key}) {
                    strTemp += "\(val + 1)"
                }
            }
            sum += Int(strTemp) ?? 0
        
        }
    }
    print(sum)
}

partTwoTwo()


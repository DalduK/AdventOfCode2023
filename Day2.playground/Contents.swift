import UIKit

let fileURL = Bundle.main.url(forResource: "Games", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let list = content.split(separator: "\n")

func partOne() {
    var sum = 0
    for i in list.indices {
    print(i)
        let splited = list[i].split(separator: ":")
        let gamesSplited = splited[1].split(separator: ";")
        var colorsNum = 0
        for colors in gamesSplited {
            let listOfCols = colors.split(separator: ", ")
            let stringsOfCols = listOfCols.map { subString -> String in
                return String(subString)
            }
            let isCorrect = etValOfColors(stringsOfCols)
            if !isCorrect {
                colorsNum += 1
            }
        }
        if colorsNum == 0 {
            print(i+1)
            sum = sum + (i + 1)
        }
    }
    print(sum)
}

func partTwo() {
    var sum = 0
    for i in list.indices {
        let splited = list[i].split(separator: ":")
        let gamesSplited = splited[1].split(separator: ";")
        var colorsNum = 0
        let stringsOfCols = gamesSplited.map { subString -> String in
            return String(subString)
        }
        let val = checkTheHighestPossibleNubmers(stringsOfCols)
        print("\(i) \(val)")
        sum += val
    }
    print(sum)

}

func etValOfColors(_ listOfColors: [String]) -> Bool {
    var red = 0
    var blue = 0
    var green = 0
    for i in listOfColors {
        if i.contains("red") {
            let redVal = i.replacingOccurrences(of: " red", with: "").replacingOccurrences(of: " ", with: "")
            if let num = Int(redVal) {
                red += num
            }
        } else if i.contains("blue") {
            let redVal = i.replacingOccurrences(of: " blue", with: "").replacingOccurrences(of: " ", with: "")
            if let num = Int(redVal) {
                blue += num
            }
        } else if i.contains("green") {
            let redVal = i.replacingOccurrences(of: " green", with: "").replacingOccurrences(of: " ", with: "")
            if let num = Int(redVal) {
                green += num
            }
        }
    }
    
    if red > 12 || green > 13 || blue > 14 {
        print(false)
        return false
    } else {
        return true
    }
}

func checkTheHighestPossibleNubmers(_ listOfColors: [String]) -> Int {
    var red = 0
    var blue = 0
    var green = 0
    for i in listOfColors {
        let listOfCols = i.split(separator: ", ")
        for listOfCol in listOfCols {
            var tempString = String(listOfCol.description).replacingOccurrences(of: " ", with: "")
            if tempString.contains("red") {
                let redVal = tempString.replacingOccurrences(of: "red", with: "")
                if let num = Int(redVal), num > red {
                    red = num
                }
            } else if tempString.contains("blue") {
                let redVal = tempString.replacingOccurrences(of: "blue", with: "")
                if let num = Int(redVal), num > blue {
                    blue = num
                }
            } else if tempString.contains("green") {
                let redVal = tempString.replacingOccurrences(of: "green", with: "")
                if let num = Int(redVal), num > green {
                    green = num
                }
            }
        }
    }
    return red * blue * green
}

partTwo()

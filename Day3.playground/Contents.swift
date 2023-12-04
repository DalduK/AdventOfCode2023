import Foundation

let fileURL = Bundle.main.url(forResource: "engineCodes", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let list = content.split(separator: "\n")

func getEngineCodes() {
    var sum = 0
    for i in list.indices {
        var tempArr = Array(list[i])
        for char in tempArr.indices {
            if tempArr[char] != "." && !tempArr[char].isNumber {
                var firstList: [Substring.Element]? = []
                var thirdList: [Substring.Element]? = []
                if i == 0 {
                    firstList = nil
                    thirdList = Array(list[i + 1])
                } else if i == list.count - 1 {
                    firstList = Array(list[i - 1])
                    thirdList = nil
                } else {
                    firstList = Array(list[i - 1])
                    thirdList = Array(list[i + 1])
                }
                print("index \(list[i])")
                let getNumber = getNumber(firstList: firstList, secondList: tempArr, thirdList: thirdList, middleIndex: char)
            }
        }
    }
    print(sum)
}

func getNumber(firstList: [Substring.Element]?, secondList: [Substring.Element], thirdList: [Substring.Element]?, middleIndex: Int) -> [Int] {
    for i in middleIndex - 1...middleIndex + 1 {
        if firstList == nil, let thirdList {
            print("first")
            if secondList[i].isNumber {
                print("\(secondList[i])")
            } else if thirdList[i].isNumber {
                print("\(thirdList[i])")
            }
        }
        else if thirdList == nil, let firstList {
            print("last")
            if secondList[i].isNumber {
                print("\(secondList[i])")
            } else if firstList[i].isNumber {
                print("\(firstList[i])")
            }
        } else if let firstList, let thirdList {
            if firstList[i].isNumber {
                print("\(firstList[i])")
            } else if secondList[i].isNumber {
                print("\(secondList[i])")
            } else if thirdList[i].isNumber {
                print("\(thirdList[i])")
            }
        }
    }
    
    
    
    return [0]
}


getEngineCodes()

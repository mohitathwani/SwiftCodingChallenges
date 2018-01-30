//https://leetcode.com/problems/add-binary/description/
//Given two binary strings, return their sum (also a binary string).
//
//For example,
//a = "11"
//b = "1"
//Return "100".

func addBinary(_ a: String, _ b: String) -> String {
    var aA = a
    var bB = b
    
    var result = ""
    
    var carry = 0
    var i = aA.count - 1
    var j = bB.count - 1
    
    
    while i >= 0 || j >= 0 || carry == 1 {
        let aDigit = i >= 0 ? Int("\(aA.removeLast())")! : 0
        let bDigit = j >= 0 ? Int("\(bB.removeLast())")! : 0
        
        i -= 1
        j -= 1
        
        carry += aDigit + bDigit
        result = "\(carry % 2)" + result
        carry /= 2
    }
    
    return result
}

addBinary("1010", "1011")

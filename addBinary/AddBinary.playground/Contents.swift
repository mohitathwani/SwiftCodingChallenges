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
    
    if a.count == 0 && b.count == 0 {
        return ""
    }
    
    if a.count == 0 {
        return b
    }
    
    if b.count == 0 {
        return a
    }
    
    var carry = 0
    var result = ""
    while aA.count > 0 && bB.count > 0 {
        let aDigit = Int("\(aA.removeLast())")!
        let bDigit = Int("\(bB.removeLast())")!
        
        let decimalSum = carry + aDigit + bDigit
        
        if decimalSum == 2 || decimalSum == 3 {
            carry = 1
        } else {
            carry = 0
        }
        
        let binarySum = carry ^ aDigit ^ bDigit;
        result = String(binarySum) + result
    }
    
    if(bB.count == 0) {
        while aA.count > 0 {
            let aDigit = Int("\(aA.removeLast())")!
            
            let decimalSum = carry + aDigit
            
            if decimalSum == 2 {
                carry = 1
            } else {
                carry = 0
            }
            
            let binarySum = carry ^ aDigit
            result = String(binarySum) + result
        }
    }
    
    if(aA.count == 0) {
        while bB.count > 0 {
            let bDigit = Int("\(bB.removeLast())")!
            
            let decimalSum = carry + bDigit
            
            if decimalSum == 2 {
                carry = 1
            } else {
                carry = 0
            }
            
            let binarySum = carry ^ bDigit
            result = String(binarySum) + result
        }
    }
    
    if carry == 1 {
        result = String(1) + result
    }
    
    return result
}

addBinary("110", "11")

//https://leetcode.com/problems/integer-to-roman/description/
//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: 3
//Output: "III"
//Example 2:
//
//Input: 4
//Output: "IV"
//Example 3:
//
//Input: 9
//Output: "IX"
//Example 4:
//
//Input: 58
//Output: "LVIII"
//Explanation: C = 100, L = 50, XXX = 30 and III = 3.
//Example 5:
//
//Input: 1994
//Output: "MCMXCIV"
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

func intToRoman(_ num: Int) -> String {
  assert(num != 0, "num cannot be 0")
  var result = String()
  var map = [1:"I", 4:"IV", 5:"V", 9:"IX", 10:"X", 40:"XL", 50:"L", 90:"XC", 100:"C", 400:"CD", 500:"D", 900:"CM", 1000:"M"]
  
  if let num = map[num] {
    return num
  }
  
  func processUnits() {
    let units = num % 10
    if let units = map[units] {
      result += units
      return
    }
    
    if units != 0 {
      if units < 5 {
        for _ in 0..<units {
          result += map[1]!
        }
      }
      
      if units > 5 {
        result += map[5]!
        for _ in 0..<(units - 5) {
          result += map[1]!
        }
      }
    }
  }
  
  func processTens() {
    let tens = (num / 10) * 10
    if let tens = map[tens] {
      result = tens + result
      return
    }
    
    if tens < 50 {
      for _ in 0..<(tens / 10) {
        result = map[10]! + result
      }
    }
    
    if tens > 50 {
      var temp = map[50]!
      for _ in 0..<(tens - 50) / 10 {
        temp += map[10]!
      }
      result = temp + result
    }
  }
  
  processUnits()
  processTens()
  return result
}

intToRoman(1)
intToRoman(2)
intToRoman(3)
intToRoman(4)
intToRoman(5)
intToRoman(6)
intToRoman(7)
intToRoman(8)
intToRoman(9)
intToRoman(10)
intToRoman(11)
intToRoman(12)
intToRoman(13)
intToRoman(14)
intToRoman(15)
intToRoman(16)
intToRoman(17)
intToRoman(18)
intToRoman(19)
intToRoman(20)
intToRoman(90)

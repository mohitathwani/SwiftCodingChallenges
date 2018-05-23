//https://leetcode.com/problems/string-to-integer-atoi/description/
//Implement atoi which converts a string to an integer.
//
//The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
//
//The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
//
//If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
//
//If no valid conversion could be performed, a zero value is returned.
//
//Note:
//
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//
//Input: "42"
//Output: 42
//Example 2:
//
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//Then take as many numerical digits as possible, which gets 42.
//Example 3:
//
//Input: "4193 with words"
//Output: 4193
//Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
//Example 4:
//
//Input: "words and 987"
//Output: 0
//Explanation: The first non-whitespace character is 'w', which is not a numerical
//digit or a +/- sign. Therefore no valid conversion could be performed.
//Example 5:
//
//Input: "-91283472332"
//Output: -2147483648
//Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
//Thefore INT_MIN (−231) is returned.

enum States {
    case start, space, minus, plus, digit, alphaChar, end
}

func isNextStateValid(curState: States, nextState: States) -> Bool {
    switch curState {
    case .start:
        return nextState == .space || nextState == .minus || nextState == .digit || nextState == .plus
        
    case .space:
        return nextState == .space || nextState == .minus || nextState == .digit || nextState == .plus
        
    case .minus:
        return nextState == .digit
        
    case .plus:
        return nextState == .digit
        
    case .digit:
        return nextState == .digit
    default:
        return false
    }
}

func myAtoi(_ str: String) -> Int {
    let charArray = Array(str)
    var curState: States = .start
    
    var result = 0
    var multiplier = 1
    
    for char in charArray {
        if char == " " && isNextStateValid(curState: curState, nextState: .space){
            curState = .space
            continue
        }
        
        if char == "+" && isNextStateValid(curState: curState, nextState: .plus) {
            curState = .plus
            continue
        }
        
        if char == "-" && isNextStateValid(curState: curState, nextState: .minus) {
            curState = .minus
            multiplier = -1
            continue
        }
        
        if let digit = Int(String(char)), isNextStateValid(curState: curState, nextState: .digit) {
            curState = .digit
            result = result * 10 + digit
            
            if(result > Int32.max) {
                break
            }
        } else {
            break
        }
    }
    
    result = result * multiplier
    
    if result < Int32.min {
        return Int(Int32.min)
    }
    
    if result > Int32.max {
        return Int(Int32.max)
    }
    
    return result
}


myAtoi("   ") == 0
myAtoi("  12") == 12
myAtoi("  12 5") == 12
myAtoi("abc 123 5") == 0
myAtoi("123 5 abc") == 123
myAtoi("123asd") == 123
myAtoi("+123") == 123
myAtoi("-123") == -123
myAtoi("   + 123") == 0
myAtoi("  - 123") == 0
myAtoi("+-123") == 0
myAtoi("42") == 42
myAtoi("   -42") == -42
print(Int.max)
myAtoi("20000000000000000000")


//https://leetcode.com/problems/reverse-integer/description/
//Given a 32-bit signed integer, reverse digits of an integer.
//
//Example 1:
//
//Input: 123
//Output:  321
//Example 2:
//
//Input: -123
//Output: -321
//Example 3:
//
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

func reverse(_ x: Int) -> Int {
    var num = x
    var rev = 0
    
    while num != 0 {
        let remainder = num % 10
        rev = (rev * 10) + remainder // overflow can happen while multiplying
        num = num / 10
    }
    
    if(rev > Int32.max || rev < Int32.min) {
        return 0
    }
    return rev
}



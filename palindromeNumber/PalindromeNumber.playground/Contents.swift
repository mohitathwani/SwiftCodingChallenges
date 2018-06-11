//https://leetcode.com/problems/palindrome-number/description/
//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
//Example 1:
//
//Input: 121
//Output: true
//Example 2:
//
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//Follow up:
//
//Coud you solve it without converting the integer to a string?

func isPalindrome(_ x: Int) -> Bool {
  if x < 0 {
    return false
  }
  
  if x >= 0 && x < 10 {
    return true
  }
  
  if x % 10 == 0 {
    return false
  }
  
  var original = x
  var reversed = 0
  
  while original != 0 {
    let remainder = original % 10
    reversed = reversed * 10 + remainder
    original = original / 10
    
    if  reversed  >= original{
      return reversed == original || original == reversed / 10
    }
  }
  
  return false
}

isPalindrome(11) == true
isPalindrome(-5) == false
isPalindrome(3) == true
isPalindrome(-121) == false
isPalindrome(10) == false
isPalindrome(121) == true
isPalindrome(-121) == false
isPalindrome(12321) == true
isPalindrome(0) == true

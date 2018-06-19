//https://leetcode.com/problems/regular-expression-matching/description/
//Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
//
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).
//
//Note:
//
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like . or *.
//Example 1:
//
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//
//Input:
//s = "aa"
//p = "a*"
//Output: true
//Explanation: '*' means zero or more of the precedeng element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
//Example 3:
//
//Input:
//s = "ab"
//p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
//Example 4:
//
//Input:
//s = "aab"
//p = "c*a*b"
//Output: true
//Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore it matches "aab".
//Example 5:
//
//Input:
//s = "mississippi"
//p = "mis*is*p*."
//Output: false
extension String {
  subscript(idx: Int) -> Character {
    return self[self.index(startIndex, offsetBy: idx)]
  }
  subscript(range: Range<Int>) -> String {
    return String(self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.index(self.startIndex, offsetBy: range.upperBound)])
  }
}

func isMatch_Recursion(_ string: String, _ pattern: String) -> Bool {
  
  if pattern.isEmpty {
    return string.isEmpty
  }
  
  let firstMatch = !string.isEmpty && (string[0] == pattern[0] || pattern[0] == ".")
  
  if pattern.count > 1 && pattern[1] == "*" {
    return firstMatch && isMatch(string[1..<string.count], pattern) || isMatch(string, pattern[2..<pattern.count])
  }
  return firstMatch && isMatch(string[1..<string.count], pattern[1..<pattern.count])
}

func isMatch(_ string: String, _ pattern: String) -> Bool {
  var T = [[Bool]](repeating: [Bool](repeating: false, count: pattern.count + 1), count: string.count + 1)
  
  T[0][0] = true
  
  if string.count < 1 || pattern.count < 1 {
    return false // probably needs thinking...
  }
  
  for i in 1...string.count {
    for j in 1...pattern.count {
      if string[i - 1] == pattern[j - 1] || pattern[j - 1] == "." {
        T[i][j] = T[i - 1][j - 1];
      }
    }
  }
  
  
  return T[string.count][pattern.count]
  
}

isMatch("aa", "") == false
isMatch("ab", "aa") == false
isMatch("a", "a.") == false
isMatch("aaa", "a.") == false
isMatch("a", "aa.") == false
isMatch("abc", "a.c") == true
//isMatch("a", "a*") == true
//isMatch("a", ".*") == true
//isMatch("aaabbcd", "a*b*..") == true
//isMatch("cd", "b*..") == true
//isMatch("aaacd", "a*b*..") == true
//isMatch("aaaaaaaaaaaaa", ".*") == true

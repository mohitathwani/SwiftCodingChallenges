//https://leetcode.com/problems/zigzag-conversion/description/
//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//
//Write the code that will take a string and make this conversion given a number of rows:
//
//string convert(string s, int numRows);
//Example 1:
//
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"
//Example 2:
//
//Input: s = "PAYPALISHIRING", numRows = 4
//Output: "PINALSIGYAHRPI"
//Explanation:
//
//P     I    N
//A   L S  I G
//Y A   H R
//P     I

func convert(_ s: String, _ numRows: Int) -> String {
    var i = 0
    let ch = Array(s)
    
    var buckets: [[Character]] = Array(repeating: [Character](), count: numRows)
    
    while(i < s.count) {
        for di in 0..<numRows where i < s.count{
            buckets[di].append(ch[i])
            i += 1
        }
        
        if (numRows <= 2) {
            continue
        }
        for di in (1...(numRows - 2)).reversed() where i < s.count {
            buckets[di].append(ch[i])
            i += 1
        }
    }
    return String(buckets.flatMap{$0})
}

convert("A", 2)

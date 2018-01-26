//https://leetcode.com/problems/two-sum/description/
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var seenNumbers = [Int:Int]()
    
    for (index, val) in nums.enumerated() {
        if seenNumbers[target - val] != nil {
            return [seenNumbers[target - val]!, index]
        }
        seenNumbers[val] = index
    }
    
    return [Int]()
}

twoSum([1,2,3,4,5], 6)

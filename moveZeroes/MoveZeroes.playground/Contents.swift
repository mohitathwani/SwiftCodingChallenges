//https://leetcode.com/problems/move-zeroes/description/
//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
//
//Note:
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.

func moveZeroes(_ nums: inout [Int]) {
    var nonZeroCount = 0
    
    for (index,value) in nums.enumerated() {
        if value != 0 {
            nums[nonZeroCount] = nums[index]
            nonZeroCount = nonZeroCount + 1
        }
    }
    
    while nonZeroCount < nums.count {
        nums[nonZeroCount] = 0
        nonZeroCount = nonZeroCount + 1
    }
}

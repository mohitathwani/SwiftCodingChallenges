//https://leetcode.com/problems/product-of-array-except-self/
//Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
//
//The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
//You must write an algorithm that runs in O(n) time and without using the division operation.
//
//
//
//Example 1:
//
//Input: nums = [1,2,3,4]
//Output: [24,12,8,6]
//Example 2:
//
//Input: nums = [-1,1,0,-3,3]
//Output: [0,0,9,0,0]
//
//
//Constraints:
//
//2 <= nums.length <= 105
//-30 <= nums[i] <= 30
//The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
//
//Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)

// nums =          [1,  2,  3, 4]
// leftProducts =  [1,  1,  2, 6]
// rightProducts = [24, 12 ,4 ,1]
// solution =      [24, 12, 8, 6
class Solution {
  private func reduce(nums: [Int]) -> [Int] {
    var products = [Int]()
    _ = nums.reduce(1) { product, num in
      products.append(product)
      return product * num
    }
    return products
  }

  func productExceptSelf(_ nums: [Int]) -> [Int] {
    let leftProducts = reduce(nums: nums)

    let rightProducts = reduce(nums: nums.reversed()).reversed()

    var solution = [Int]()
    zip(leftProducts, rightProducts).forEach { left, right in
      solution.append(left * right)
    }
    return solution
  }
}

let sol = Solution()
sol.productExceptSelf([1, 2, 3, 4])

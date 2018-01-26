//https://leetcode.com/problems/median-of-two-sorted-arrays/description/
//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//Example 1:
//nums1 = [1, 3]
//nums2 = [2]
//
//The median is 2.0
//Example 2:
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//The median is (2 + 3)/2 = 2.5

func findMedianSortedArrays(_ a: [Int], _ b: [Int]) -> Double {
    if a.count > b.count {
        return findMedianSortedArrays(b, a)
    }
    
    var start = 0
    var end = a.count
    
    while start <= end {
        var numElementsFromAInLeftPartition = (start + end) / 2
        var numElementsFromBInLeftPartition = ((a.count + b.count + 1) / 2) - numElementsFromAInLeftPartition
        
        var maxLeftA = (numElementsFromAInLeftPartition == 0) ? Int.min : a[numElementsFromAInLeftPartition - 1]
        var minRightA = (numElementsFromAInLeftPartition == a.count) ? Int.max : a[numElementsFromAInLeftPartition]
        
        
        var maxLeftB = (numElementsFromBInLeftPartition == 0) ? Int.min : b[numElementsFromBInLeftPartition - 1]
        var minRightB = (numElementsFromBInLeftPartition == b.count) ? Int.max : b[numElementsFromBInLeftPartition]
        
        if (maxLeftA <= minRightB && maxLeftB <= minRightA) {
            if (a.count + b.count) % 2 == 0 {
                return Double(max(maxLeftA, maxLeftB) + min(minRightA, minRightB)) / 2.0
            }
            
            return Double(max(maxLeftA, maxLeftB))
        }
        
        if maxLeftA > minRightB {
            end = numElementsFromAInLeftPartition - 1
        }
        
        if maxLeftB > minRightA{
            start = numElementsFromAInLeftPartition + 1
        }
    }
    
    return 0
}

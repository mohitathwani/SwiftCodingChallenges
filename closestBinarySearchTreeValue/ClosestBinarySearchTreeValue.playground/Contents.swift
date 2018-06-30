//https://leetcode.com/problems/closest-binary-search-tree-value/description/
//Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.
//
//Note:
//
//Given target value is a floating point.
//You are guaranteed to have only one unique value in the BST that is closest to the target.
//Example:
//
//Input: root = [4,2,5,1,3], target = 3.714286
//
//4
/// \
//2   5
/// \
//1   3
//
//Output: 4


public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

func closestValue2(_ root: TreeNode?, _ target: Double) -> Int {
  var root = root
  
  var result = root?.val ?? 0
  
  while root != nil {
    if Double(root!.val) == target {
      return root!.val
    }
    
    if abs(target - Double(result)) > abs(target - Double(root!.val)) {
      result = root!.val
    }
    
    if target < Double(root!.val) {
      root = root?.left
    } else {
      root = root?.right
    }
    
  }
  
  return result
}
func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
  guard let root = root else {
    return 0
  }
  
  var floor: Int?
  var ceil: Int?
  var result = 0
  
  func find(root: TreeNode?) {
    guard root != nil else {
      return
    }
    
    if target == Double(root!.val) {
      result = root!.val
      return
    }
      
    else if target < Double(root!.val) {
      ceil = root!.val
      find(root: root?.left)
    } else {
      floor = root!.val
      find(root: root?.right)
    }
  }
  
  find(root: root)
  
  if result != 0 {
    return result
  }
  
  if floor != nil && ceil != nil {
    let diff1 = abs(target - Double(floor!))
    let diff2 = abs(target - Double(ceil!))
    
    if diff1 <= diff2 {
      result = floor!
    } else {
      result = ceil!
    }
  }
  
  else if floor == nil && ceil != nil {
    result = ceil!
  } else {
    result = floor!
  }
  
  return result
}

let root = TreeNode(4)
let twoNode = TreeNode(2)
let fiveNode = TreeNode(5)
let oneNode = TreeNode(1)
let threeNode = TreeNode(3)

root.left = twoNode
root.right = fiveNode
twoNode.left = oneNode
twoNode.right = threeNode

closestValue2(root, 3.7)

let root2 = TreeNode(28)
let node12 = TreeNode(12)
let node45 = TreeNode(45)
let node4 = TreeNode(4)
let node24 = TreeNode(24)
let node35 = TreeNode(35)
let node47 = TreeNode(47)
let node2 = TreeNode(2)

root2.left = node12
root2.right = node45

node12.left = node4
node12.right = node24

node45.left = node35
node45.right = node47

node4.left = node2

closestValue2(root2, 2.0)



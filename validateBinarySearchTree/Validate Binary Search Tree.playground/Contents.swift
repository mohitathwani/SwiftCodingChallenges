//https://leetcode.com/problems/validate-binary-search-tree/description/
//Given a binary tree, determine if it is a valid binary search tree (BST).
//
//Assume a BST is defined as follows:
//
//The left subtree of a node contains only nodes with keys less than the node's key.
//The right subtree of a node contains only nodes with keys greater than the node's key.
//Both the left and right subtrees must also be binary search trees.
//Example 1:
//2
/// \
//1   3
//Binary tree [2,1,3], return true.
//Example 2:
//1
/// \
//2   3
//Binary tree [1,2,3], return false.


/**
 * Definition for a binary tree node.
 */

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

func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
    var validLeft = false
    var validRight = false
    
    if root == nil {
        return true
    }
    
    let nodeVal = root!.val
    if nodeVal > min && nodeVal < max {
        validLeft = isValidBST(root?.left, min: min, max: nodeVal)
        
        if validLeft == true {
            validRight = isValidBST(root?.right, min: nodeVal, max: max)
            
            return validRight && validLeft
        }
    }
    
    return false
}

func isValidBST(_ root: TreeNode?) -> Bool {
    return isValidBST(root, min: Int.min, max: Int.max)
}


var twoNode = TreeNode(1)
var oneNode = TreeNode(1)

twoNode.left = oneNode
isValidBST(twoNode)

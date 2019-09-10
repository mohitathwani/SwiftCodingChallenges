class BinarySearchTree {
  private var root: BinarySearchTreeNode?
  
  init(rootValue value: Int) {
    root = BinarySearchTreeNode(value: value)
  }
  
  func insert(value: Int) {
    root?.insert(value: value)
  }
  
  func print() {
    root?.printInOrder()
  }
  
  func find(value: Int) -> Bool {
    return root?.find(value: value) ?? false
  }
  
  func delete(value: Int) {
    guard let root = root else {
      return
    }
    
    if root.value == value { // deleting root
      if root.left == nil && root.right == nil {
        self.root = nil
      }
      
      else if root.left == nil {
        self.root = root.right
      }
      
      else {
        let left = root.left
        let right = root.right
        let newRoot = root.getSubstituteForRoot(node: root)
        if let parent = newRoot?.parent, parent.value != root.value {
          newRoot?.parent?.right = nil
        }
        
        self.root = newRoot
        self.root?.left = left
        self.root?.right = right
      }
    }
    
    root.delete(value: value)
  }
}

class BinarySearchTreeNode: CustomStringConvertible {
  public private(set) var value: Int
  public var left: BinarySearchTreeNode?
  public var right: BinarySearchTreeNode?
  var parent:BinarySearchTreeNode?
  
  var description: String {
    return "\(value)"
  }
  
  init(value: Int) {
    self.value = value
  }
  
  func insert(value: Int) {
    if value <= self.value && left == nil {
      left = BinarySearchTreeNode(value: value)
      left?.parent = self
    }
    
    else if value > self.value && right == nil {
      right = BinarySearchTreeNode(value: value)
      right?.parent = self
    }
    
    else if value <= self.value {
      left?.insert(value: value)
    }
    
    else {
      right?.insert(value: value)
    }
  }
  
  func printInOrder() {
    func dfs(root: BinarySearchTreeNode?) {
      if root == nil {
        return
      }
      dfs(root: root?.left)
      print(root!)
      dfs(root: root?.right)
    }
    dfs(root: self)
  }
  
  func find(value: Int) -> Bool {
    return findNode(value: value) == nil ? false : true
  }
  
  func findNode(value: Int) -> BinarySearchTreeNode? {
    var q = [BinarySearchTreeNode]()
    q.append(self)
    
    while !q.isEmpty {
      let first = q.remove(at: 0)
      if first.value == value {
        return first
      }
      
      if let left = first.left {
        q.append(left)
      }
      
      if let right = first.right {
        q.append(right)
      }
    }
    return nil
  }
  
  func getSubstituteForRoot(node: BinarySearchTreeNode) -> BinarySearchTreeNode? {
    var temp = node.left
    while temp?.right != nil {
      temp = temp?.right
    }
    return temp
  }
  
  func delete(value: Int) {
    guard let nodeToDelete = findNode(value: value) else {
      return
    }
    
    if nodeToDelete.left == nil && nodeToDelete.right == nil { //Leaf node
      if nodeToDelete.isLeftChild() {
        nodeToDelete.parent?.left = nil
      }
      
      else if nodeToDelete.isRightChild(){
        nodeToDelete.parent?.right = nil
      }
    }
    
    else if nodeToDelete.right == nil { //has only left child
      if nodeToDelete.isLeftChild() {
        nodeToDelete.parent?.left = nodeToDelete.left
      }
      
      else if nodeToDelete.isRightChild() {
        nodeToDelete.parent?.right = nodeToDelete.left
      }
    }
    
    else if nodeToDelete.left == nil { //has only right child
      if nodeToDelete.isLeftChild() {
        nodeToDelete.parent?.left = nodeToDelete.right
      }
      
      else if nodeToDelete.isRightChild() {
        nodeToDelete.parent?.right = nodeToDelete.right
      }
    }
    
    else {
      if nodeToDelete.isLeftChild() {
        nodeToDelete.parent?.left = nodeToDelete.left
      }
      else if nodeToDelete.isRightChild() {
        nodeToDelete.parent?.right = nodeToDelete.left
      }
    }
  }
  
  func isLeftChild() -> Bool {
    return self.parent?.left?.value == self.value
  }
  
  func isRightChild() -> Bool {
    return self.parent?.right?.value == self.value
  }
}

let tree = BinarySearchTree(rootValue: 5)
tree.insert(value: 3)
tree.insert(value: 2)
tree.insert(value: 1)
tree.insert(value: 4)
tree.insert(value: 6)
tree.insert(value: 7)
//tree.print()
tree.find(value: 3)
tree.find(value: 0)
tree.delete(value: 6)
tree.print()

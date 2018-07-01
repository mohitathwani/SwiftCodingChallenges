//At a lemonade stand, each lemonade costs $5.
//
//Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).
//
//Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill.  You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.
//
//Note that you don't have any change in hand at first.
//
//Return true if and only if you can provide every customer with correct change.
//
//
//
//Example 1:
//
//Input: [5,5,5,10,20]
//Output: true
//Explanation:
//From the first 3 customers, we collect three $5 bills in order.
//From the fourth customer, we collect a $10 bill and give back a $5.
//From the fifth customer, we give a $10 bill and a $5 bill.
//Since all customers got correct change, we output true.
//Example 2:
//
//Input: [5,5,10]
//Output: true
//Example 3:
//
//Input: [10,10]
//Output: false
//Example 4:
//
//Input: [5,5,10,10,20]
//Output: false
//Explanation:
//From the first two customers in order, we collect two $5 bills.
//For the next two customers in order, we collect a $10 bill and give back a $5 bill.
//For the last customer, we can't give change of $15 back because we only have two $10 bills.
//Since not every customer received correct change, the answer is false.


func lemonadeChange(_ bills: [Int]) -> Bool {
  var map = [Int:Int]()
  
  if bills[0] != 5 {
    return false
  }
  
  for bill in bills {
    if map[bill] == nil {
      map[bill] = 1
    } else {
      map[bill] = 1 + map[bill]!
    }
    
    let changeDue = bill - 5
    
    switch changeDue {
    case 0:
      continue
      
    case 5:
      if map[5] != nil && map[5]! >= 1 {
        map[5] = map[5]! - 1
        continue
      } else {
        return false
      }
      
    case 15:
      if  map[10] != nil && map[10]! >= 1 && map[5] != nil && map[5]! >= 1{
        map[10] = map[10]! - 1
        map[5] = map[5]! - 1
      }
      else if map[5] != nil && map[5]! >= 3 {
        map[5] = map[5]! - 3
      } else {
        return false
      }
    default:
      fatalError()
    }
  }
    return true
}

lemonadeChange([5,5,5,5,20,20,5,5,20,5])



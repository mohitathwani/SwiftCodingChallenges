//https://leetcode.com/problems/meeting-rooms-ii/description/
//Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
//
//For example,
//Given [[0, 30],[5, 10],[15, 20]],
//return 2.

//66/77 tests passing. Will revisit the problem later.

/**
 * Definition for an interval.
 */
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


func minMeetingRooms(_ intervals: [Interval]) -> Int {
    if intervals.count == 0 {
        return 0
    }
    
    var changes = [(time: Int, state: Int)]()
    
    var maxRooms = 0, runningRoomsCount = 0
    
    for interval in intervals {
        changes.append((interval.start, 1))
        changes.append((interval.end, -1))
    }
    
    changes.sort {$0.time < $1.time}
    print(changes)
    for change in changes {
        runningRoomsCount += change.state
        maxRooms = max(maxRooms, runningRoomsCount)
    }
    
    return maxRooms
    
}

minMeetingRooms([Interval(13,15), Interval(1,13)])

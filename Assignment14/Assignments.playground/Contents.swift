import UIKit



//

// 1 1  2  3  5  8  13  21  34 .....


// input : a gvien number from fibonicee series like 5
// size of fibnocie , starting gvien fib number = 4

// [5 , 8 , 13, 21]


//  input  8 ,  3
//  output = [8 , 13,  21 ]


// do this using higher order function

// This declares a function named fibonacci that accepts an integer num and returns an integer.
func fibonacci(of num: Int) -> Int {
    // For values of num that are 0 or 1, the function returns the input value itself. This is because the Fibonacci numbers for 0 and 1 are 0 and 1, respectively.
    if num <= 1 { return num }
    
    var twoPrevious = 0 // This variable represents the Fibonacci number two places before the current one. Initialized to 0 (the 0th Fibonacci number).
    var previous = 1 // This variable represents the Fibonacci number one place before the current one. Initialized to 1 (the 1st Fibonacci number).
    var current = 1 //This variable represents the current Fibonacci number. Initialized to 1 (as a starting value, though it will quickly get updated in the loop).
    
    for _ in 2..<num { // This loop runs from 2 up to (but not including) num. The loop does not use the loop variable (hence the use of _), it just runs the body of the loop num - 2 times.
        twoPrevious = previous // The value of previous is moved to twoPrevious.
        previous = current // The value of current is moved to previous.
        current = twoPrevious + previous // The next Fibonacci number is calculated by summing the two previous Fibonacci numbers.
    }
    
    return current
}

func generateFibonacciSequence(startingWith startNumber: Int, ofSize size: Int) -> [Int] {
    var index = 0
    
    // Find the starting index of the given number in the Fibonacci sequence
    while fibonacci(of: index) != startNumber {
        index += 1
    }
    
    // Using `map` to generate the sequence based on the given size
    return (index..<(index+size)).map(fibonacci)
}

print(generateFibonacciSequence(startingWith: 5, ofSize: 4))  // [5, 8, 13, 21]
print(generateFibonacciSequence(startingWith: 8, ofSize: 3))  // [8, 13, 21]


// 1. what is GCD

// GCD is a low-level API in Apple's platforms that facilitates running tasks concurrently. It allows you to dispatch tasks for synchronous and asynchronous execution using dispatch queues.

// 2. What is QOS

// QoS represents the priority of a task. Apple platforms define several QoS classes that determine the priority of tasks and ensure that system resources are utilized optimally.

// 3. what is diff b/w main q and glboal q

// Main Q: It is a serial queue and is used for UI-related tasks. All updates to the user interface should be done on the main queue.
// Global Q: These are concurrent queues provided by the system. Tasks in these queues are executed on a pool of threads managed by the system.

// 4. Default queus provided by GCD

// Main Queue: Serial queue for UI updates.
// Global Queue: Concurrent queues that come with different QoS levels, including .background, .utility, .default, and .userInitiated.

// 5. will you use global q or custom concurrent queue , which one and why

// Global Queue: It's a set of system-provided concurrent queues.
// Custom Concurrent Queue: When you need more control over concurrency or if you want to group related tasks together, you might opt for a custom concurrent queue.
// Which one and why: Use global queues for general tasks that don't require specific ordering or grouping. Use custom concurrent queues when you need tasks to be grouped or want to limit the concurrency for specific operations.

// 6. what is higher order functions , examples

// Functions that accept other functions as arguments and/or return functions as results. In Swift, examples include map, reduce, filter, and flatMap.

// 7. Diff b/w map and compactmap

// Map: Transforms each element of a collection based on a provided function.
// Compact map: Similar to map, but it also removes any nil results from the transformation.

// 8 . what reduce does

// reduce combines all items in a collection to create a single new value, typically using an accumulator.

// 9 . diff b/w sort and sorted

// sort: Modifies the original array in-place to be in order.
// sorted: Returns a new array that is sorted, leaving the original array unchanged.



// Assignment during class

// add delete button in country cell and on click of that delete country from array and refresh tableView

 // Note : don't use swipe delete action.

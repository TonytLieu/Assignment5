import UIKit

/*
 Clocsure
 Higher Order
 Generic data
 */

// MARK: Generic
//creating for generic data this show how quenue works "First in first out"
class Information<N>{//N is the generic so you can put any data type
    var data:N
    
    init(data: N) {
        self.data = data
    }
    func displayTheData(){
        print("Data is = \(self.data)")
    }
}

let i1 = Information(data:"s")
i1.displayTheData()
 
struct MyQueue<T>{//first in first out
    var myqueue:[T]
    mutating func addElement(element:T){
        myqueue.append(element)
    }
    mutating func popElement(){
        myqueue.removeFirst()
    }
}

var numberQueue = MyQueue(myqueue: [])
numberQueue.addElement(element: "A")//add element
numberQueue.addElement(element: 2)
print(numberQueue.myqueue)
numberQueue.popElement()//remove elements
print(numberQueue.myqueue)
//MARK: Closeres
let simpleClosuere:(()->())// unname simeple closeure
//example of closures
func addTwoNumber(n1:Int)->Int{
    return n1 * n1
}
let res = addTwoNumber(n1: 2)
//show how to use a data type and put a func in it
let sayHello = {
    print("Hello there buddy")
}//MARK: trailing closure
func doSquare(n1:Int, completion:(Int)->()){
    let result = n1 * n1 * n1
    completion(result)// this is need to finsh any closure
}//{} this is a way to put in a func or sometime without the key func
doSquare(n1: 5, completion: {output in print("doCubes -\(output)")})

//MARK: escapaing closure
func performApiCallTask(completion: @escaping ()->()){// @escaping is used to inform callers of a function that takes a closure that the closure might be stored or otherwise outlive the scope of the receiving function.
    print("1.We are inside performApiCallTask func")
    DispatchQueue.global().async {
        print("2.We are inside global Queue")
        Thread.sleep(forTimeInterval: 4)// this will delay the run by 4 seconds
        DispatchQueue.main.async {
        print("3.We are inside DispactchQuene.main")
        print("4.After 4 secs delay")       }
        print("5. After dispatchQuenue main")
    }
}
performApiCallTask {
    print("once we get response preformApiCallTask")
}
//MARK: auto Closure
//when a closure doesn't take any parameter not it returns anything from closure then it get self wraped when called is known as Auto Closure
func travelToDestination(action: ()->()){
    action()
}
travelToDestination {}

//MARK: MAP
let numberArray = [1,2,3,4,5,6,7]
//longer way
var ress = [Int]()
for num in numberArray{
    ress.append(num*num)
}
print(res)
//shorter way
let sqaure = numberArray.map{$0 * $0}//single elements but use all element in the array and create a new one with the aurgment applied to each element
print("squares- \(sqaure)")

//MARK: Filter
 
//Fliter take a collection applies a func and return a
let evenNumber = numberArray.filter{ $0 % 2 == 0}//<- this is a shorter way to create a func
print("Even Number-- \(evenNumber)")

//MARK: Reduce performs a task and return one value
let sum = numberArray.reduce(30, -)
print(sum)
//MARK: sort
let unsorted = [8,2,42,21,3,1,21, 4,2]
print(unsorted.sorted())//sort the collection in descending order and if i want to change the order just go to the claas for the sorted type
//MARK: FlapMap
let someWords = ["Hello", "B"]
let resu = someWords.flatMap{$0}// this will separate the String element int separate char
print(resu)
//MARK: CompatMap
let duplicationNilArray = [123, 12334, nil, 0,0,1,3,5]
duplicationNilArray.compactMap{$0}
let arrays = [[123,555],nil,[0,0,1,4],nil,[6,555]]//take out nil from the array
print(arrays.compactMap{$0})
//MARK forEach
numberArray.forEach{print($0)}// another way to use forEach loops
//MARK Zip - combine two arrays
let num2 = ["a", "b", "c"]
let pairs = zip(num2,numberArray)
print(pairs)


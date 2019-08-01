// DataStructures
// processing offers different data structures
// we will mainly be using either arrays or arraylists
// both of them are lists of data
// both of them again are like bags, but they are bags that can store multiple items
// those items have to be of the same type though

// the way you create an array is simple
// you start with the datatype you will be storing followed by "[]"
// and the to initialize the array you use the "new" keyword followed again by "[]"
// but now you need to say how many items you want to store in this array
int[] myFirstArray = new int[5];

// to fill your array with data, you access one of the compartments
// by specifying its index number, if your array is of length "5"
// then your compartments are indexed from 0 to 4
myFirstArray[0] = 7;
myFirstArray[2] = 9;

// this is how you iterate through elements in an array
for (int i=0; i<myFirstArray.length; i++){
    println(myFirstArray[i]);
}

for (int i=0; i<myFirstArray.length; i++){
    myFirstArray[i] = 100 + i;
}

// you can use append to add items, but still
// you need to define a start length at the begining
myFirstArray = append(myFirstArray,888);
for (int i=0; i<myFirstArray.length; i++){
    println(myFirstArray[i]);
}

// an Arraylist is a little bit different
// its a secial kind of bag, an expandable one
// it stores a variable number of objects
// the way you create one is as follows
ArrayList<Integer> myNumbers = new ArrayList<Integer>(10);
// it might be a bit confusing but is you use <int> you will get an error
// int is a datatype only avaliable in processing
// ArrayList is something ported from java and in java there is nothing called int
// instead its called Integer, a bit confusing I know but you will get used to it
// The only difference here is the use of "<>" with the data type that this list will be storing
// instead of the "[]" you use with a normal array, also note when initializing you state the same
// "<>" again with the data type and you also follow it with "()" because here you are calling
// the constrcutor of this class, we will discuss that later when we talk about classes

// now to fill it you use the .add() method
myNumbers.add(8);
myNumbers.add(10);
// to get an item you use the .get() method
println(myNumbers.get(0),myNumbers.get(1));
// to remove an item you use .remove() method
myNumbers.remove(0);
// to know the size of the list you use .size() method
println("this is the size of my list:",myNumbers.size());
// to fill a list with some numbers
for (int i=0; i<10; i++){
    myNumbers.add(i);
}
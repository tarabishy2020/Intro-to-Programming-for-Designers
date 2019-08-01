// when you want to create an instance of your class this is how you do it
// 1 - Declaration : You first declare a variable with your object type
Circle myCircle;

void setup(){
    size(1200,800);
    ellipseMode(RADIUS);
    background(255);
    fill(0);
    noStroke();
    // 2 - Instantiation & Initialization : using the "new" keyword you create the object
    // the new keyword is always followed by a call to the constructor this call initializes the new object
    myCircle = new Circle();

}

void draw(){
    background(255);
    // 3 - now you can access class fields or methods
    // you access any thing in your object by writing the object name followed by "."
    myCircle.pos.x = myCircle.pos.x + 0.5;
    myCircle.display();
    println(myCircle.pos);
}

PVector pickRandomPos(){
    return new PVector(random(0,width),random(0,height));
}

// this is how you define a class
// good practice is to make the first letter capital
// in order to differntiate between variable names and class names
// the main different between doing what we did before in a function
// and doing it in a class is that with a class
class Circle{
    // You first start by declaring any instance variables you want the object to have
    // usually those are refered to as the state of your object or the fields of your class
    PVector pos;
    float radius;

    // you then define the constructor for the class, this is the "method" you will use
    // to create new instances/objects out of your class
    Circle(){
        pos = pickRandomPos();
        radius = random(1,100);
    }

    // then you include any number of methods you want your class to have
    // usually those are refered to as controlling the behavious of your object
    void display(){
        ellipse(pos.x,pos.y,radius,radius);
    }
}

void mousePressed(){
    // you can call the constructor with the "new" keyword again at any time
    // to Instantiate & Initialize your object as a new one
    myCircle = new Circle();
}
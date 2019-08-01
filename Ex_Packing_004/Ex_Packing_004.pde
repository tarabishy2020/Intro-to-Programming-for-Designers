// now we want to add a method in the class to tell us if a circle intersects with another circle
// in this file we will create the method and test if it works or not
Circle testCircle;
Circle testCircleMouse;

void setup(){
    size(1200,800);
    background(255);
    fill(0);
    //noStroke();
    stroke(255,0,0);
    ellipseMode(RADIUS);

    testCircle = new Circle(new PVector(width/2,height/2), 100);
    testCircleMouse = new Circle(new PVector(mouseX,mouseY), 100);
}

void draw(){
    background(255);
    // update the position of the circle with the position of the mouse
    testCircleMouse.pos = new PVector(mouseX,mouseY);
    // test if the moving circle is intersecting with the other circle
    if (testCircleMouse.isIntersect(testCircle)){
        // if intersecting display it in different color
        pushStyle();
        fill(255,0,0);
        testCircleMouse.display();
        popStyle();
    }
    else testCircleMouse.display();
    testCircle.display();
}

PVector pickRandomPos(){
    return new PVector(random(0.5,width),random(0.5,height));
}

class Circle{
    PVector pos;
    float radius;
    Circle(){
        this.pos = pickRandomPos();
        this.radius = random(20,100);
    }
    // we can create more than one constructor, as long as they take different inputs/parameters
    // processing will know which one to use
    // this is called overloading
    Circle(PVector pos,float radius){
        this.pos = pos;
        this.radius = radius;
    }
    void display(){
        ellipse(pos.x,pos.y,radius,radius);
    }
    boolean isIntersect (Circle circle){
        if(PVector.dist(this.pos,circle.pos) < this.radius+circle.radius) return true;
        else return false;
    }
}
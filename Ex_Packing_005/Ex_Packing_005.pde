// now we will use the new method we created for testing intersection
// and start adding the circles to an arraylist

ArrayList<Circle> myCircles = new ArrayList<Circle>();

void setup(){
    size(1800,1200);
    background(255);
    fill(0);
    noStroke();
    //stroke(255,0,0);
    ellipseMode(RADIUS);
}

void draw(){
    background(255);
    // lets also create a function to help us do the creation of the circles
    circleBuilder();
    for(Circle c : myCircles){
        c.pos.x = c.pos.x + 5;
        c.display();
    }
}

// a function to create new circles and add them to our arraylist
// but checks first if the new circle it created is intersecting with
// any previous circles
void circleBuilder(){
    // Create a new circle
    Circle myCircle = new Circle();
    // if this is the first circle to be created, add it directly to our arraylist
    if (myCircles.size()==0) myCircles.add(myCircle);
    // if this is not the first circle
    else{
        // check if it intersects any other circle
        boolean testIntersection = myCircle.isIntersect(myCircles);
        // if it does "NOT" intersect == !intersect add it to the arraylist
        if (!testIntersection) myCircles.add(myCircle);
    }
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
    Circle(PVector pos,float radius){
        this.pos = pos;
        this.radius = radius;
    }

    void display(){
        ellipse(pos.x,pos.y,radius,radius);
    }

    boolean isIntersect (ArrayList<Circle> circles){
        for(Circle c : circles){
            if(PVector.dist(this.pos,c.pos) < this.radius+c.radius) return true;
        }
        return false;
    }

    boolean isIntersect (Circle circle){
        if(PVector.dist(this.pos,circle.pos) < this.radius+circle.radius) return true;
        else return false;
    }
}
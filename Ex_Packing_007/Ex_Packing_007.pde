// Lets try and include some motion

ArrayList<Circle> myCircles = new ArrayList<Circle>();
float minR, maxR;

void setup(){
    size(1800,1200);
    background(255);
    fill(0);
    //noFill();
    noStroke();
    ellipseMode(RADIUS);
    minR = 0.5;
    maxR = 160;
}

void draw(){
    background(255);
    //adjust speed of generating new circles relative to how many frames have moved
    // using modulus division == remainder
    if(frameCount%5==0)
        circleBuilder();
    for(Circle c : myCircles){
        c.run();

    }
}
void circleBuilder(){
    Circle myCircle = new Circle();
    myCircles.add(myCircle);
}
// I edited this to generate new circles from just a zone at the middle of the screen
PVector pickRandomPos(){
    return new PVector(random((width/2)-50,(width/2)+50),random((height/2)-50,(height/2)+50));
}


class Circle{

    PVector pos;
    float radius;
    // lets add a velocity
    PVector vel;

    Circle(){
        this.pos = pickRandomPos();
        this.radius = 20.0;
        // lets initialize the velocity in a random but smooth way using noise function
        this.vel = new PVector(map(noise(this.pos.x),0,1,-1,1),map(noise(this.pos.y),0,1,-1,1));
    }


    void run(){
        update();
        display();
    }
    // instead of just displaying we will now be updating the position first
    // by adding every frame the velocity to the current position
    void update(){
        this.pos.x += this.vel.x;
        this.pos.y += this.vel.y;
    }
    void display(){
        ellipse(pos.x,pos.y,radius,radius);
    }



}
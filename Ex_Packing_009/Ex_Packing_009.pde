// now lets try and confine them within the screen
// lets also add a variable to change the initial speed of the circles
ArrayList<Circle> myCircles = new ArrayList<Circle>();
float minR, maxR;
float noiseScale = 5; //control global speed range for initial velocity
void setup(){
    size(1200,800);
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

PVector pickRandomPos(){
    return new PVector(random((width/2)-50,(width/2)+50),random((height/2)-50,(height/2)+50));
}


class Circle{

    PVector pos;
    float radius;
    PVector vel;

    Circle(){
        this.pos = pickRandomPos();
        this.radius = 20.0;
        this.vel = new PVector(map(noise(this.pos.x),0,1,-1,1)*noiseScale,map(noise(this.pos.y),0,1,-1,1)*noiseScale);
    }


    void run(){
        update();
        display();
    }
    void update(){
        this.pos.x += this.vel.x;
        this.pos.y += this.vel.y;
        checkBorderCollision();
    }
    // so to do that we add this function which checks the location of the circle
    // and if it finds it going further than screen borders it reverses its velocity
    // we then call this from the update method
    void checkBorderCollision(){
        if ((pos.x > width-radius) || (pos.x < radius)) {
            vel.x = vel.x * -1;
        }
        if ((pos.y > height-radius) || (pos.y < radius)) {
            vel.y = vel.y * -1;
        }
    }
    void display(){
        ellipse(pos.x,pos.y,radius,radius);
    }



}
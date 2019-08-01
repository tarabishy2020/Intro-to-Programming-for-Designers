// lets add a way to add as many forces as we want on our circles / "particles"
ArrayList<Circle> myCircles = new ArrayList<Circle>();
float minR, maxR;
float noiseScale = 5; //control global speed range for initial velocity
// one of the forces we want to try and apply on the whole system
PVector gravity = new PVector(0.0,1);

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
    if(frameCount%5==0)
        circleBuilder();
    for(Circle c : myCircles){
        c.applyForce(gravity);
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
    // to do that we will add acceleration
    // any collection of forces can affect the acceleration
    // and then after we finish adding all our forces
    // we can change the velocity once based on acceleration
    // and then change location based on updated velocity
    PVector acc;
    //another force we want to apply
    float friction = 0.001;

    Circle(){
        this.pos = pickRandomPos();
        this.radius = 20.0;
        // lets make the initial velocity zero
        this.vel = new PVector();
        this.acc = new PVector(map(noise(this.pos.x),0,1,-1,1)*noiseScale,map(noise(this.pos.y),0,1,-1,1)*noiseScale);
    }


    void run(){
        drag();
        update();
        display();
    }
    void update(){
        // like we said add initial force/acceleration to velocity
        vel.add(acc);
        // update vposition based on current velocity
        pos.add(vel);
        // reset acceleration
        acc.mult(0);
        //checkBorderCollision();
        checkBorderCollisionAdjusted();
    }
    // and now with this simple function we can make a multitude of forces affect our system
    // wind, gravity whatever
    void applyForce(PVector force) {
        acc.add(force);
    }
    void drag() {
        float speed = vel.mag();
        float dragMagnitude = friction * speed * speed;
        PVector drag = vel.get();
        drag.mult(-1);
        drag.normalize();
        drag.mult(dragMagnitude);
        applyForce(drag);
    }

    void checkBorderCollision(){
        if ((pos.x > width-radius) || (pos.x < radius)) {
            vel.x = vel.x * -1;
        }
        if ((pos.y > height-radius) || (pos.y < radius)) {
            vel.y = vel.y * -1;
        }
    }
    void checkBorderCollisionAdjusted() {
        if (pos.x > width-radius) {
          pos.x = width-radius;
          vel.x *= -1;
      } else if (pos.x < radius) {
          vel.x *= -1;
          pos.x = radius;
      }

      if (pos.y > height-radius) {
          vel.y *= -1;
          pos.y = height-radius;
      }
      else if (pos.y < radius) {
        vel.y *= -1;
        pos.y = radius;
    }
}
void display(){
    ellipse(pos.x,pos.y,radius,radius);
}



}


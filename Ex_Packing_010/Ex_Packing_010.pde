// Lets try and include some motion

ArrayList<Circle> myCircles = new ArrayList<Circle>();
float minR, maxR; //create a global value for minimum and maximum radius
float noiseScale = 0.5;
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
        //c.run();
        c.run(myCircles);
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
    PVector acc;
    float friction = 0.01;

    Circle(){
        this.pos = pickRandomPos();
        this.radius = random(5,70);
        //this.radius = 20.0;
        this.vel = new PVector();
        this.acc = new PVector(map(noise(this.pos.x),0,1,-1,1)*noiseScale,map(noise(this.pos.y),0,1,-1,1)*noiseScale);
    }

    void applyForce(PVector force) {
        acc.add(force);
    }

    void run(){
        drag();
        update();
        display();
    }
    void run(ArrayList<Circle> circles){
        drag();
        particleCollision(circles);
        update();
        display();
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
    void particleCollision(ArrayList<Circle> circles){
        for(Circle c : circles){
            if (!(this.pos.x == c.pos.x && this.pos.y == c.pos.y )){
                if(this.isIntersect(c)){
                    float restLen =this.radius+c.radius;
                    PVector force = PVector.sub(c.pos,this.pos);
                    float distance = force.mag();
                    float stretch = (distance - restLen)/distance*2*0.01;
                    force.mult(stretch);
                    this.applyForce(force);
                    c.applyForce(force.mult(-1));
                }
            }
        }

    }
    void update(){
        //this.pos.x += this.vel.x;
        //this.pos.y += this.vel.y;
        // or better use PVector avaliable methods
        vel.add(acc);
        pos.add(vel);
        acc.mult(0);
        checkBorderCollision();
    }
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
    boolean isInside(ArrayList<Circle> circles){
        for(Circle c : circles){
            if( pow(this.pos.x - c.pos.x,2) + pow(this.pos.y - c.pos.y,2) < pow(c.radius,2)) return true;
        }
        return false;
    }
    boolean isIntersect (Circle circle){
        if(PVector.dist(this.pos,circle.pos) < this.radius+circle.radius) return true;
        else return false;
    }


}
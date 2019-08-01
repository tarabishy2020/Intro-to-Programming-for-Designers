// refine the packing
// keep generating smaller circles until the builder manages
// to create one that is not intersecting with anything
// Make sure all circles are within the screen

ArrayList<Circle> myCircles = new ArrayList<Circle>();
float minR, maxR; //create a global value for minimum and maximum radius

void setup() {
  size(1200, 800);
  background(255);
  //fill(0);
  noFill();
  ellipseMode(RADIUS);
  strokeWeight(0.2);
  minR = 0.5;
  maxR = 160;
}

void draw() {
  //background(255);
  circleBuilder();
  for (Circle c : myCircles) {
    c.display();
  }
}
void circleBuilder() {
  Circle myCircle = new Circle(minR, maxR);
  if (myCircles.size()==0) myCircles.add(myCircle);
  else {
    float newMaxR = maxR;
    // while the new circle is inside any other circles
    // keep generating new ones but with smaller radius everytime
    while (myCircle.isInside(myCircles)) {
      newMaxR--;
      newMaxR = constrain(newMaxR, minR, maxR);
      myCircle = new Circle(minR, newMaxR);
    }
    // after you are sure the center is not inside a circle
    // see if the circle with the chosen radius will intersect with any surrounding circles
    // if it does intersect, instead of deleting it
    // just reduce the radius until the two are co-incedent
    for (int i = 0; i < myCircles.size(); i++) {
      Circle testCircle = myCircles.get(i);
      if (myCircle.isIntersect(testCircle)) {
        myCircle.radius = PVector.dist(myCircle.pos, testCircle.pos) - testCircle.radius;
        pushStyle();
        strokeWeight(0.2);
        // draw a line to visualize which circles this procedure happened to
        line(myCircle.pos.x, myCircle.pos.y, testCircle.pos.x, testCircle.pos.y);
        popStyle();
      }
    }
    myCircles.add(myCircle);
  }
}

PVector pickRandomPos() {
  return new PVector(random(0.5, width), random(0.5, height));
}
// we update this function to take the radius of our circle
// and generate a random location where minimum possible value is our radius
// and maximum possible value is our screenSize-radius
// so we make sure all circles are inside
PVector pickRandomPos(float radius) {
  return new PVector(constrain(random(width), radius, width-radius), constrain(random(height), radius, height-radius));
}

class Circle {

  PVector pos;
  float radius;

  Circle() {
    this.pos = pickRandomPos();
    this.radius = random(20, 100);
  }
  // add a new constructor where you can set the minimum and maximum value of the circle
  Circle(float minRad, float maxRad) {
    this.radius = random(minRad, maxRad);
    // also we flip the order so we can have our circles fully inside the screen
    this.pos = pickRandomPos(this.radius);
  }
  Circle(PVector pos, float radius) {
    this.pos = pos;
    this.radius = radius;
  }

  void display() {
    ellipse(pos.x, pos.y, radius, radius);
  }

  boolean isIntersect (ArrayList<Circle> circles) {
    for (Circle c : circles) {
      if (PVector.dist(this.pos, c.pos) < this.radius+c.radius) return true;
    }
    return false;
  }
  // a new method to test if the center of the circle is inside another circle
  // I had no clue how to do this
  // so I just googled, test if a point is inside a circle
  boolean isInside(ArrayList<Circle> circles) {
    for (Circle c : circles) {
      if ( pow(this.pos.x - c.pos.x, 2) + pow(this.pos.y - c.pos.y, 2) < pow(c.radius, 2)) return true;
    }
    return false;
  }

  boolean isIntersect (Circle circle) {
    if (PVector.dist(this.pos, circle.pos) < this.radius+circle.radius) return true;
    else return false;
  }
}

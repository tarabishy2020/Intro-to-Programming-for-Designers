void setup(){
    size(1200,800);
    // by default it takes as an input diameter
    ellipseMode(RADIUS);
    // setup the scene, we placed those here because we don't really want
    // to change this stuff every frame, if we want to override any of them later
    // we just have to change them from anything that is running from the draw function
    // Color of our background
    background(255);
    // Fill color for any shape we draw
    fill(0,200);
    // Turn off creating a stroke around shapes
    noStroke();
}

void draw(){
    // Call the function to create a circle
    placeCircle();
}

PVector pickRandomPos(){
    return new PVector(random(0,width),random(0,height));
}

void placeCircle(){
    // Call a function to create a random vector
    // use the vector as the position of the circle centroid
    // we could have create an array instead but I believe this is faster
    // we could have also did the same thing in here instead of doing it in
    // a separate function
    PVector pos = pickRandomPos();
    // Create a random value every time the function is called for the radius
    float radius = random(1,100);
    // finally draw the circle
    ellipse(pos.x,pos.y,radius,radius);
}
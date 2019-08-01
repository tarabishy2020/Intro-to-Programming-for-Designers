int counter =0;

// In processing there are two base functions we usually start with
// the first is <Setup>
// This function runs once when you start running your code
// used usually to initialize things, setting the stage for what to come later
void setup(){
    size(1800,1200);
}

void draw(){
    background(0);
    // Option 1
    //-----------------
    // noStroke();
    // fill(255);
    // ellipse(width/2,height/2,100,100);

    // Option 2
    // Create a function to do the same thing - this function takes no input
    // has no parameters
    //-----------------
    drawCircle();

    // Option 3
    // Create a function to do the same thing - but now with any size and color
    //-----------------
    drawCircle(200, 100, color(255,0,0));

    // Option 4
    // how about adding some movement
    // we now need to use a counter so that we can have a variable that is changing over time
    // variable++ is exactly the same as variableName = variableName + 1;
    // variable-- is exactly the same as variableName = variableName - 1;
    // other things you can use
    // variableName *= 2; variableName /= 2; variableName -= 2; variableName += 2;
    //-----------------
    movCircle(200, 100, color(255,0,0),counter);
    counter++;

}

void drawCircle(){
    fill(255);
    ellipse(width/2,height/2,100,100);
}

void drawCircle(int sizeX, int sizeY, color c){
    fill(c);
    ellipse(width/2,height/2,sizeX,sizeY);
}

void movCircle(int sizeX, int sizeY, color c,int counter){
    fill(c);
    ellipse(width/2+(counter*0.5),height/2,sizeX,sizeY);
}
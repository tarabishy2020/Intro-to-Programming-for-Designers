// we can store our newly created objects in an array or an arraylist
// lets try the arraylist, we will use it because we don't know how many objects we will create
// and a nice feature of arraylists is that you don't need to specify their length beforehand
// this is how you create a new arraylist, looks a bit like the way you create a new instance of a class
// the only difference is the use of "<>" which is where you declare what type of data/objects this arraylist will contain
ArrayList<Circle> myCircles = new ArrayList<Circle>();

int counter =0;

void setup(){
    size(1200 ,800);
    ellipseMode(RADIUS);
    background(255);
    fill(0);
    noStroke();
}

void draw(){
    background(255);

    // to add objects to your array list you use the ".add()" method on your arraylist
    myCircles.add(new Circle());

    // you can know how many items are currently in your arraylist my using the ".size()" method
    int x = myCircles.size();

    // a nice option with arraylists is this special for-each-loop that you can use to quickly
    // iterate over items in your list without knowing how many items inside
    // the way you read it is "for each x in list" do something == for(dataType x : list){doSomething()}
    // the one downside of that is, if you want to know at which item you are
    // while iterating you have to do that using a counter
    counter = 0;
    for(Circle c : myCircles){
        c.pos.x = c.pos.x + 0.5;
        // if we are now at the newest circle i.e last one added to the arraylist i.e arraylistSize-1
        // display it in red color
        if (counter==(x-1)){
            pushStyle();
            fill(255,0,0);
            c.display();
            popStyle();
        }
        else c.display();
        counter++;
    }
}

PVector pickRandomPos(){
    return new PVector(random(0,width),random(0,height));
}

class Circle{

    PVector pos;
    float radius;

    Circle(){
        pos = pickRandomPos();
        radius = random(1,100);
    }

    void display(){
        ellipse(pos.x,pos.y,radius,radius);
    }
}
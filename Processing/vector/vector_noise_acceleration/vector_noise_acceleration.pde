Mover mover;

void setup() {
  size(800, 600);
  mover = new Mover();
}

void draw() {
  background(255);

  mover.update();
  mover.checkEdges();
  mover.display();
}  

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float t;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 10;
    t = 0.1;
  }

  void update() {
    acceleration = PVector.random2D();
    acceleration.mult(noise(t));
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    t += 0.1;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 48, 48);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 7;
  }

  void update() {
    acceleration = PVector.random2D();
    acceleration.mult(random(2));
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    float theta = velocity.heading2D();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    rectMode(CENTER);
    noStroke();
    rect(0, 0, 25, 10);
    triangle(20.5, 0, 12, -5, 12, 5);
    popMatrix();
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
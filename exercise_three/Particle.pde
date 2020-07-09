class Particle {
  int c, index;
  float s, speed, max, incr, incr2, ns, x, y, x2, y2, setX, setY;

  Particle(float xIn, float yIn, float sIn, float incr2In) {
    x = xIn;
    y = yIn;
    s = max = sIn;
    incr2 = incr2In;
    setX = random(width);
    setY = random(height);
    index = int(random(0, 5));
    c = palette[index];
    incr = -random (.1, .4);
  }

  void move() {
    // Update the position and control the speed
    speed = map(mouseX, 0, width, 0, 2);
    ns = ((noise(incr2, x/setX, y/setY)-0.5) * setX) * (TWO_PI/360); 
    x += cos(ns) * speed;
    y += sin(ns) * speed;
    incr2 += .01;

    // Display
    s +=  incr;
    if (s <= 0) {
      s = 0;
      incr *= -1;
      // s += incr;
    } else if (s >= max) {
      s = max;
      incr *= -1;
    }
    x2 = x;
    y2 = y;
    stroke(c);
    strokeWeight(s);
    line(x2, y2, x, y);


    // wrap
    if (x < -s) {
      x = x2 = width + s;
    } else if (x>width+s) {
      x = x2= -s;
    }
    if (y < -s) {
      y = y2 = height + s;
    } else if (y > height + s) {
      y = y2 = -s;
    }
  }
}

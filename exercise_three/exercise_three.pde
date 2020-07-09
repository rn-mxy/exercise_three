PFont bebas; 
Particle[] particles;
int num;
int[] palette;
String s1 = "BREAK";
String s2 = "THE";
String s3 = "PATTERN";

void setup() {
  // Set size to a DIN format
  size(842, 1191);
  background(50);
  bebas = createFont("BebasNeue-Regular.ttf", 32);
  colorMode(HSB, 360, 100, 100);
  
  setPalette(); 
  setParticles();
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    particles[i].move();
  }
  displayHeadline();
}

// Set the color palette based on the first color, which is random generated. You get more or less matching colors this way.
void setPalette() { 
  palette = new int[5];
  int dst = 20, sat;
  int h0 = int(random(0, 360));
  int h1 = (h0 + dst) % 360;
  int h2 = (h0 + 2 * dst) % 360;
  int h3 = (h0 + 3 * dst) % 360;
  int h4 = (h0 + 4 * dst) % 360;

  sat = int(random(70, 100));
  palette[0] = color(h0, sat, 100);

  sat = int(random(20, 80));
  palette[1] = color(h1, sat, 100);

  sat = int(random(20, 80));
  palette[2] = color(h2, sat, 100);

  sat = int(random(20, 80));
  palette[3] = color(h3, sat, 100);

  sat = int(random(20, 80));
  palette[4] = color(h4, sat, 100);
};


// Set the particles in a grid.
void setParticles() {
  //background(255);
  int cols = 16;
  int rows = 16;
  float columnWidth = width/cols; 
  float rowHeight = height/rows; 

  num = (cols + 1) * (rows + 1);
  particles = new Particle[num];

  float u = 0;
  int j = 0;
  float size = 30;

  for (float y = 0; y <= height; y += rowHeight) {
    for (float x = 0; x <= width; x += columnWidth) {
      particles[j] = new Particle(x, y, size, u);
      u += .02;
      j++;
    }
  }
}

// Display the words of the headline
void displayHeadline() {
  fill(50);
  textAlign(CENTER);
  textFont(bebas);
  textSize(256);

  fill(palette[2]);
  text(s1, width/2, height/2 - 136);
  text(s2, width/2, height/2 + 64);
  text(s3, width/2, height/2 + 264);
}

// Reset the setting after clicking the mouse
void mousePressed() {
  setPalette();
  setParticles();
}

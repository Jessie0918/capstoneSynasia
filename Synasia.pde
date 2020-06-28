import ddf.minim.*;
VSlider pixelSize;

String filename = "marina.jpg";
String cn = "Colour Number:";
String cn2 = " ";
PImage p;
PImage logo;
int i, z;
int n1, n2 =1;
int n3=4;
AudioPlayer c1;
AudioPlayer p1;
AudioPlayer o1;
AudioPlayer v1;
String s = "C,D,E,F,G,A,B";
String[] nums = split(s, ",");
float r1, g1, b1; //float r2 = c >> 16 & 0xFF; Very fast to calculate
float volp1=-5;
float volo1=5;
float volv1=-5;

Minim minim;
static final int FADE = 2500;

void setup() {
  colorMode(RGB);
  // load image and set size of screen to same
  p = loadImage(filename);           // load
  logo = loadImage("logo-1.jpg");
  size(1080, 720);           
  colorMode(HSB, 255);               // allows us to access the brightness of a color
  // draw image to screen and access it's pixel values
  image(p, (width-p.width)/2-50, 50);
  image(logo, width-194, height-90);//logo
  //line decoration
  fill(149, 175, 236, 75);
  noStroke();
  rect(0, height-100, 500, 25);
  rect(550, height-100, 25, 25);
  //Here is audio setup
  minim = new Minim(this);

  pixelSize = new VSlider(width-120, 250, 20, 200, 20);
}

void draw() {
  background(0);
  pixelateImage(20);    // argument is resulting pixel size pixelSize.getval()
  //save("Pixelated_" + filename);
  background(255);
  pixelSize.display();
  z = pixelSize.getval();
  pixelateImage(z);
  pixelSize.display();
  //println(z);
  fill(255, 50);
  ellipse(mouseX, mouseY, 25, 25);
  image(logo, width-194, height-90);
  //line decoration
  //fill(250,191,193,75);
  fill(r1, g1, b1, 100);
  noStroke();
  rect(0, height-100, 500, 25);
  rect(300, height-100, 25, 25);
  //colour number
  //textSize(20);
  fill(90);
  text(cn+cn2, 50, height-50);
}

void mouseDragged() {
  pixelSize.drag();
}

void mouseReleased() {
  pixelSize.release();
}

void keyPressed() {
  pixelSize.key();
}

class VSlider {
  float cx, cy;
  float w, h;
  int min, max;
  int value;
  float ny;
  String word = "Pixels \n Size";
  
  boolean selected = false;

  VSlider(float cx_, float cy_, float w_, float h_, int value_) {
    cx = cx_;
    cy = cy_;
    w = w_;
    h = h_;

    min = 2;
    max = 100;
    value = constrain(value_, min, max);
    ny = cy + h/2 - map(value, min, max, 0, h);
  }
  
  int getval(){
    return value;
  }

  void display() {
    value = (int)map(ny, cy + h/2, cy - h/2, min, max);
    strokeWeight(3);
    rectMode(CENTER);
    noStroke();
    fill(10, 25); //button bg color trans
    rect(cx, cy, w, h);
    fill(90);//text color
    text(word, cx-30, 90);
    textSize(25);
    if (mouseover() || selected) {
      fill(90);
      text(value, cx+w, ny);
      stroke(191, 144, 218);//selected line color
    } else {
      stroke(255); //line color
      fill(90);
      text(value, cx+w, ny);
    }
    line(cx, cy-h/2, cx, cy+h/2);
    strokeWeight(1);//button stroke
    fill(255);
    rect(cx, ny, w-2, w-2);//last button height
  }

  boolean mouseover() {
    return cx-w/2 < mouseX && mouseX < cx+w/2 && cy-h/2 < mouseY && mouseY < cy+h;
  }

  void press() {
    if (mouseover()) {
      selected = true;
      ny = mouseY;
    } else {
      selected = false;
    }
  }

  void drag() {
    if(selected){
      ny = constrain(mouseY, cy - h/2, cy + h/2);
    }
  }

  void release() {
    selected = false;
  }
  
  void key(){
    if (!selected && mouseover()) {
      switch(keyCode) {
      case UP:
        ny -= 1;
        ny = constrain(ny, cy - h/2, cy + h/2-1);
        break;
      case DOWN:
        ny += 1;
        ny = constrain(ny, cy - h/2, cy + h/2-1);
        break;
      default:
        break;
      }
    }
  }
}

void mousePressed() {
  pixelSize.press(); //slider function control
  color c;
  c = get(mouseX, mouseY);  
  float r = red(c); //float r2 = c >> 16 & 0xFF; Very fast to calculate
  float g = green(c);
  float b = blue(c);
  println(r, g, b);
  i = (int)random(0, 7);
  r1=r;
  g1=g;
  b1=b;
  
  //*at least one group equals 0*
  if (r*g*b == 0.0) {
    //**special #000**
    if (b-g == 0 && b-r ==  0) {
      println("same000");
    } //**common classfication**
    else {
      //percussion R
      if (r/37>= 6) {
        n1=7;
      } else if (r/37>= 5) {
        n1=6;
      } else if (r/37>= 4) {
        n1=5;
      } else if (r/37>= 3) {
        n1=4;
      } else if (r/37>= 2) {
        n1=3;
      } else if (r/37>= 1) {
        n1=2;
      } else if (r/37> 0) {
        n1=1;
      }
      //end R

      //piano G
      //o[i].play();
      if (g/37>= 6) {
        n2=7;
      } else if (g/37>= 5) {
        n2=6;
      } else if (g/37>= 4) {
        n2=5;
      } else if (g/37>= 3) {
        n2=4;
      } else if (g/37>= 2) {
        n2=3;
      } else if (g/37>= 1) {
        n2=2;
      } else if (g/37> 0) {
        n2=1;
      }
      //end G

      //violin B
      if (b/85>= 2) {
        n3=5;
      } else if (b/85>= 1) {
        n3=4;
      } else if (b/85> 0) {
        n3=3;
      }
      //end B
    } //end **common**
  }

  //*no group equals 0*
  if (r*g*b != 0.0) {
    println("ok!");

    //**special #xxxxxx**
    if (b-g == 0 && b-r ==  0) {
      println("same");
      //g=0;
      //b=0;
      //percussion R
      if (r/37>= 6) {
        n1=7;
      } else if (r/37>= 5) {
        n1=6;
      } else if (r/37>= 4) {
        n1=5;
      } else if (r/37>= 3) {
        n1=4;
      } else if (r/37>= 2) {
        n1=3;
      } else if (r/37>= 1) {
        n1=2;
      } else if (r/37> 0) {
        n1=1;
      }
      //end R
    } //end **special**
    else {
      //**common**
      //percussion R
      if (r/37>= 6) {
        n1=7;
      } else if (r/37>= 5) {
        n1=6;
      } else if (r/37>= 4) {
        n1=5;
      } else if (r/37>= 3) {
        n1=4;
      } else if (r/37>= 2) {
        n1=3;
      } else if (r/37>= 1) {
        n1=2;
      } else if (r/37> 0) {
        n1=1;
      }
      //end R

      //piano G
      //o[i].play();
      if (g/37>= 6) {
        n2=7;
      } else if (g/37>= 5) {
        n2=6;
      } else if (g/37>= 4) {
        n2=5;
      } else if (g/37>= 3) {
        n2=4;
      } else if (g/37>= 2) {
        n2=3;
      } else if (g/37>= 1) {
        n2=2;
      } else if (g/37> 0) {
        n2=1;
      }
      //end G

      //violin B
      if (b/85>= 2) {
        n3=5;
      } else if (b/85>= 1) {
        n3=4;
      } else if (b/85> 0) {
        n3=3;
      }
      //end B
      //end **common**
    }
    //volume compare
    //>>>1
    if (r-g > 0 && r-b > 0) { // why r>>g>>b does not work?
      println("r");
      volp1=volp1+2;
      //volo1=volo1-1;
      volv1=volv1-2;
    } 
    //>>>2
    else if (g-r > 0 && g-b > 0) { 
      println("g");
      volp1=volp1-2;
      volo1=volo1+3;
      volv1=volv1-2;
    } 
    //>>>3
    else if (b-g > 0 && b-r > 0) { 
      println("b");
      volp1=volp1-2;
      //volo1=volo1-1;
      volv1=volv1+2;
    }//end>>>3
  }//end *no group equals 0*
  cn2 = "  "+(int)r+",  "+(int)g+",  "+(int)b;
  p1 = minim.loadFile("percussion-"+n1+".wav");
  o1 = minim.loadFile("piano-"+nums[i]+n2+".wav");
  v1 = minim.loadFile("violin-"+nums[i]+n3+".wav");
  //volume
  p1.setGain(volp1);
  o1.setGain(volo1);
  v1.setGain(volv1);
  //play
  if (r!=0) {
    p1.play();
  }
  if (g!=0) {
    o1.play();
  }
  if (b!=0) {
    v1.play();
  }
}//end mousepressed

void pixelateImage(int pxSize) {
 
  // use ratio of height/width...
  float ratio;
  if (width < height) {
    ratio = height/width;
  }
  else {
    ratio = width/height;
  }
  
  // ... to set pixel height
  int pxH = int(pxSize * ratio);
  
  noStroke();
  for (int x=0; x<p.width; x+=pxSize) {
    for (int y=0; y<p.height; y+=pxH) {
      fill(p.get(x, y));
      rect(x+(width-p.width)/2-50, y+50, pxSize, pxH);
    }
  }
}

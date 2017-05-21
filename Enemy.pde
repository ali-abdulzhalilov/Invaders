class Enemy {
  float x, y, w, h;
  float s = 1.5;
  float dx = 0, dy = 0;
  float minx, maxx, my;
  float ox, oy;
  boolean down = false, right = true;
  boolean hit = false;
  
  Enemy(float x, float y, float w, float h, float minx, float maxx, float my) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.minx = minx;
    this.maxx = maxx;
    this.my = my;
    this.ox = x;
    this.oy = y;
  }
  
  void update() {
    whereToGo();
    
    x += dx * s;
    y += dy * s;
  }
  
  void oxmx() {
    ox = x;
    oy = y;
  }
  
  void whereToGo() {
    if (down) {
      if (y >= oy + my) {
        down = false;
        oxmx();
      }
    } else {
      if (right) {
        if (x >= maxx) {
          right = false;
          down = true;
          oxmx();
        }
      } else {
        if (x <= minx) {
          right = true;
          down = true;
          oxmx();
        }
      }
    }
    
    if (down) {
      dy = 1;
      dx = 0;
    } else {
      dy = 0;
      if (right) dx = 1;
      else dx = -1;
    }
  }
  
  void display() {
    noStroke();
    fill(0, 125, 255);
    rect(x, y, w, h);
    
    stroke(0, 255, 0);
    line(minx, y, minx, y+h);
    line(maxx+w, y, maxx+w, y+h);
  }

}
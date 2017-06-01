class Transform {
  float x, y, w, h;
  float s = 1;
  float dx = 0, dy = 0;
  boolean hit = false;
  
  Transform(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void update() {
    move();
  }
  
  void move() {
    x += dx * s;
    y += dy * s;
  }
  
  void display() {
    stroke(255, 0, 0);
    line(x, y, x+w, y);
    stroke(0, 255, 0);
    line(x, y, x, y+h);
    stroke(125);
    line(x, y+h, x+w, y+h);
    line(x+w, y, x+w, y+h);
  }
}
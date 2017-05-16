class Enemy {
  float x, y, w, h;
  float s = 20;
  float dx = 0, dy = 0;
  
  Enemy(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void update() {
  }
  
  void display() {
    noStroke();
    fill(0, 125, 255);
    rect(x, y, w, h);
  }

}
class Block extends Transform{
  int health = 3;
  
  Block(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  
  void update() {
    for (int i = enemies.size() - 1; i >= 0; i--) {
      Enemy e = enemies.get(i);
      if (Physics.checkHit(x, y, w, h, e.x, e.y, e.w, e.h)) {
        health = 0;
        e.hit = true;
      }
    }
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      if (Physics.checkHit(x, y, w, h, b.x, b.y, b.w, b.h)) {
        health--;
        b.hit = true;
      }
    }
  }
  
  void display() {
    noStroke();
    fill((1-health/3.0)*255, 255, (1-health/3.0)*255);
    rect(x, y, w, h);
  }
}
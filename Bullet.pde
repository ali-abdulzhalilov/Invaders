class Bullet {
  float x, y;
  float dy;
  boolean hit = false;
  
  Bullet(float x, float y, float dy) {
    this.x = x;
    this.y = y;
    this.dy = dy;
  }

  void move() {
    y += dy * bulletSpeed;
  }
  
  void hitOnBorders() {
    if (x < -bulletSize || x > width || y < -bulletSize || y > height) hit = true;
  }
  
  void hitOnPlayerAndEnemies() {
    if (dy == -1) {
      for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        if (checkHit(x, y, bulletSize, bulletSize, e.x, e.y, e.w, e.h)) {
          hit = true;
          e.hit = true;
        }
      }
    } else {
      if (checkHit(x, y, bulletSize, bulletSize, p.x, p.y, p.w, p.h))
        println("player hit");
    }
  }
  
  void display() {
    noStroke();
    fill(255);
    rect(x, y, bulletSize, bulletSize);
  }
  
  boolean checkHit(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    return (x1+w1>x2 && x1<x2+w2)&&(y1+h1>y2 && y1<y2+h2);
  }
}
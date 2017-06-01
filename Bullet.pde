class Bullet extends Transform{
  Object sender;
  
  Bullet(Object sender, float x, float y, float dx, float dy) {
    super(x, y, bulletSize, bulletSize);
    this.s = bulletSpeed;
    this.dx = dx;
    this.dy = dy;
    this.sender = sender;
  }
  
  void update() {
    super.update();
    
    hitOnBorders();
    hitOnPlayerAndEnemies();
    if (doBulletsHitEachOther)
      hitOnBullets();
  }
  
  void hitOnBorders() {
    if (x > width) x = -w;
    if (x < -w) x = width;
    if (y < -h || y > height) hit = true;
  }
  
  void hitOnPlayerAndEnemies() {
    if (sender instanceof Player) {
      for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        if (checkHit(x, y, bulletSize, bulletSize, e.x, e.y, e.w, e.h)) {
          hit = true;
          e.hit = true;
        }
      }
    } else {
      if (checkHit(x, y, bulletSize, bulletSize, p.x, p.y, p.w, p.h)) {
        hit = true;
        p.hit = true;
      }
    }
  }
  
  void hitOnBullets() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      if (checkHit(x, y, bulletSize, bulletSize, b.x, b.y, bulletSize, bulletSize) && b != this && sender.getClass() != b.sender.getClass()) {
        hit = true;
        b.hit = true;
      }
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
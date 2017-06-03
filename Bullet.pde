class Bullet extends Transform{
  Object sender;
  PVector[] trail = new PVector[5];
  
  Bullet(Object sender, float x, float y, float dx, float dy) {
    super(x, y, bulletSize, bulletSize);
    this.s = bulletSpeed;
    this.dx = dx;
    this.dy = dy;
    this.sender = sender;
    
    for (int i = 0; i < trail.length; i++)
      trail[i] = new PVector(x, y);
  }
  
  void update() {
    super.update();
    if (sender instanceof Enemy)
      x += cos(y/s)*s/2; // wobble
    
    for (int i = trail.length - 2; i >= 0; i--){
      trail[i+1].x = trail[i].x;
      trail[i+1].y = trail[i].y;
    }
    trail[0].x = x+w/2;
    trail[0].y = y+h/2;
    
    
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
        if (Physics.checkHit(x, y, bulletSize, bulletSize, e.x, e.y, e.w, e.h)) {
          hit = true;
          e.hit = true;
        }
      }
    } else {
      if (Physics.checkHit(x, y, bulletSize, bulletSize, p.x, p.y, p.w, p.h)) {
        hit = true;
        p.hit = true;
      }
    }
  }
  
  void hitOnBullets() { 
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets. get(i);
      if (Physics.checkHit(x, y, bulletSize, bulletSize, b.x, b.y, bulletSize, bulletSize) && b != this && sender.getClass() != b.sender.getClass()) {
        hit = true;
        b.hit = true;
      }
    }
  }
  
  void display() {
    noStroke();
    for (int i = trail.length - 1; i >= 0; i--){
      float r = i/float(trail.length);
      float size = 2 + bulletSize*(1-r);
      if (sender instanceof Player)
        fill(255, 255*r, 0);
      else
        fill(0, 255*r, 255);
      rect(trail[i].x-size/2, trail[i].y-size/2, size, size);
    }
    
    
    fill(255);
    rect(x, y, bulletSize, bulletSize);
  }
}
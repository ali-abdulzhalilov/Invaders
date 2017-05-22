class Enemy {
  float x, y, w, h;
  float s = 1.2;
  float dx = 0, dy = 0;
  float minx, maxx, my;
  float oy;
  boolean down = false, right = true;
  boolean hit = false;
  float oldTime, fireRate = 5, fireTimer = random(fireRate);
  
  Enemy(float x, float y, float w, float h, float minx, float maxx, float my) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.minx = minx;
    this.maxx = maxx;
    this.my = my;
    this.oy = y;
  }
  
  void update() {
    whereToGo();
    
    x += dx * s;
    y += dy * s;
    
    fireTimer -= (millis() - oldTime) / 1000 * random(1);
    oldTime = millis();
    shoot();
  }
  
  void whereToGo() {
    if (down) {
      if (y >= oy + my) {
        down = false;
        oy = y;
      }
    } else {
      if (right) {
        if (x >= maxx) {
          right = false;
          down = true;
          x = maxx;
        }
      } else {
        if (x <= minx) {
          right = true;
          down = true;
          x = minx;
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
  
  void shoot() {
    if (fireTimer <= 0) {
      float x = this.x + (this.w - bulletSize)/2;
      float y = this.y + (this.h - bulletSize)/2;
      bullets.add(new Bullet(x, y, 1));
      fireTimer = fireRate;
    }
  }
  
  void display() {
    noStroke();
    fill(0, 125, 255);
    rect(x, y, w, h);
  }

}
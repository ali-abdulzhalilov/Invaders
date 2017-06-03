class Enemy extends Object{
  float minx, maxx, my;
  float oy;
  boolean down = false, right = true;
  boolean hit = false;
  
  Enemy(float x, float y, float w, float h, float minx, float maxx, float my) {
    super(x, y, w, h);
    fireRate = 20;
    super.fireTimer = random(fireRate);
    this.minx = minx;
    this.maxx = maxx;
    this.my = my;
    this.oy = y;
  }
  
  void update() {
    whereToGo();
    super.update();
    shoot();
    
    if (y-h > height) lose();
  }
  
  void whereToGo() {
    if (down) {
      if (y >= oy + my) {
        down = false;
        oy = y;
        s += 0.5;
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
      bullets.add(new Bullet(this, x, y, 0, 1));
      bullets.add(new Bullet(this, x, y, -0.1, 0.95));
      bullets.add(new Bullet(this, x, y, 0.1, 0.95));
      fireTimer = fireRate;
    }
  }
  
  void display() {
    noStroke();
    fill(0, 125, 255);
    rect(x, y, w, h);
  }

}
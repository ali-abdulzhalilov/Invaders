class Player extends Object{
  int hitCount = 0;
  
  Player(float w, float h) {
    super(width/2 - w/2, height - h, w, h);
    super.s = 10;
    this.oldTime = millis();
    this.fireRate = 0.25;
  }
  
  void update() {
    if (x + w > width) x = 0;
    if (x < 0) x = width - w;
    
    super.update();
    
    if (hit) {
      hitCount++;
      println("player hit: " + p.hitCount);
      hit = false;
    }
  }
  
  void move() {
    x += dx * s;
    y += dy * s;
  }
  
  void display() {
    noStroke();
    fill(255, 125, 0);
    rect(x, y, w, h);
  }
  
  void shoot() {
    if (fireTimer <= 0) {
      float x = this.x + (this.w - bulletSize)/2;
      float y = this.y + (this.h - bulletSize)/2;
      bullets.add(new Bullet(this, x, y, 0, -1));
      bullets.add(new Bullet(this, x, y, -0.1, -0.95));
      bullets.add(new Bullet(this, x, y, 0.1, -0.95));
      fireTimer = fireRate;
    }
  }
}
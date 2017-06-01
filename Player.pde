class Player extends Object{
  int hitCount = 0;
  int lives = 5;
  float acc = 0;
  float dec = 0.3;
  float maxS = 20;
  
  Player(float w, float h) {
    super(width/2 - w/2, height - h, w, h);
    super.s = 0;
    this.oldTime = millis();
    this.fireRate = 0.3;
  }
  
  void update() {
    if (x + w > width) x = 0;
    if (x < 0) x = width - w;
    
    s += (abs(s) < maxS) ? acc * dx : 0;
    x += s;
    acc = 0;
    s -= abs(s) > 0 ? (s/abs(s))*dec : 0;
    super.fireTimeCheck();
    
    if (hit) {
      hitCount++;
      if (lives > 0) lives--;
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
    
    fill(255, 0, 0);
    for (int i = 0; i < lives; i++)
      rect(i*30+10, 10, 20, 20);
  }
  
  void shoot() {
    if (fireTimer <= 0) {
      float x = this.x + (this.w - bulletSize)/2;
      float y = this.y + (this.h - bulletSize)/2;
      bullets.add(new Bullet(this, x, y, 0, -1));
      bullets.add(new Bullet(this, x, y, -0.3, -0.95));
      bullets.add(new Bullet(this, x, y, 0.3, -0.95));
      fireTimer = fireRate;
    }
  }
}
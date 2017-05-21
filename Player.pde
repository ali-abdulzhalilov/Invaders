class Player {
  float x, y, w, h;
  float s = 10;
  float dx = 0;
  float oldTime;
  float fireRate = 0.5;
  float fireTimer;
  
  Player(float w, float h) {
    this.w = w;
    this.h = h;
    this.x = width/2 - w/2;
    this.y = height - h;
    this.oldTime = millis();
  }
  
  void update() {
    if (x + w > width) x = 0;
    if (x < 0) x = width - w;
    
    x += dx * s;
    
    fireTimer -= (millis() - oldTime) / 1000;
    oldTime = millis();
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
      bullets.add(new Bullet(x, y, -1));
      fireTimer = fireRate;
    }
  }
}
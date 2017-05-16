class Player {
  float x, y, w, h;
  float s = 10;
  float dx = 0;
  
  Player(float w, float h) {
    this.w = w;
    this.h = h;
    this.x = width/2 - w/2;
    this.y = height - h;
  }
  
  void update() {
    if (x + w > width) x = width - w;
    if (x < 0) {x = 0; dx = 0;}
    
    x += dx * s;
  }
  
  void display() {
    noStroke();
    fill(255, 125, 0);
    rect(x, y, w, h);
  }
  
  void shoot() {
    float x = this.x + (this.w - bulletSize)/2;
    float y = this.y + (this.h - bulletSize)/2;
    bullets.add(new Bullet(x, y, -1));
  }
}
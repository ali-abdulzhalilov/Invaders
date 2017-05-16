class Bullet {
  float x, y;
  float dy;
  
  Bullet(float x, float y, float dy) {
    this.x = x;
    this.y = y;
    this.dy = dy;
  }

  void move() {
    y += dy * bulletSpeed;
  }
  
  boolean checkBorders() {
    return x < -bulletSize || x > width || y < -bulletSize || y > height;
  }
  
  void display() {
    noStroke();
    fill(255);
    rect(x, y, bulletSize, bulletSize);
  }
}
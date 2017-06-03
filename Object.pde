class Object extends Transform{
  float oldTime, fireRate = 0.5, fireTimer;
  
  Object(float x, float y, float w, float h) {
    super(x, y, w, h);
    oldTime = millis();
  }
  
  void update() {
    super.update();
    fireTimeCheck();
  }
  
  void fireTimeCheck() {
    fireTimer -= (millis() - oldTime) / 1000;
    oldTime = millis();
  }
}
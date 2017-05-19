class Controls {
  boolean[] keys = new boolean[3];
  
  boolean setKey(int k, int kCode, boolean value) {
    switch (k){
    case CODED:
      switch (kCode) {
      case LEFT:
        return keys[0] = value;
      case RIGHT:
        return keys[1] = value;
      }
    case ' ':
      return keys[2] = value;
    default: return value;
    }
  }

  void handleInput() {
    p.dx = 0;
    if (keys[0])
      p.dx += -1;
    if (keys[1])
      p.dx += 1;
    if (keys[2])
      p.shoot();
  }
}
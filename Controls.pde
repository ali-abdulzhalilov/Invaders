class Controls {
  boolean[] keys = new boolean[5];
  
  boolean setKey(int k, int kCode, boolean value) {
    switch (k){
    case CODED:
      switch (kCode) {
      case LEFT:
        return keys[0] = value;
      case RIGHT:
        return keys[1] = value;
      default:
        return false;
      }
    case ' ':
      return keys[2] = value;
    case 'a':
      return keys[0] = value;
    case 'd':
      return keys[1] = value;
    case '\n':
      return keys[3] = value;
    default: return value;
    }
  }

  void handleInput() {
    p.dx = 0;
    if (keys[0]) {
      p.dx += -1;
      p.acc = 1;
    }
    if (keys[1]) {
      p.dx += 1;
      p.acc = 1;
    }
    if (keys[2]) {
      p.shoot();
    }
    if (keys[3]) {
      doGame = true;
    }
  }
}
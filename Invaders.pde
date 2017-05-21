float bulletSize = 7.5;
float bulletSpeed = 5;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
Player p;
Controls c;

void setup() {
  size(640, 480);
  
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  float dis = 30, N = 10, M = 4;
  for (int i = 0; i < N; i++) { //x
    for (int j = 0; j < M; j++) { //y
      enemies.add(new Enemy(50+i*dis, j*dis+20, 15, 15, 50+i*dis, width-dis*N+i*dis-50+15, dis/2));
    }
  }
  p = new Player(20, 15);
  c = new Controls();
}

void draw() {
  c.handleInput();
  update();
  display();
}

void keyPressed() {
  c.setKey(key, keyCode, true);
}

void keyReleased() {
  c.setKey(key, keyCode, false);
}

void update() {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.move();
    b.hitOnBorders();
    b.hitOnPlayerAndEnemies();
    if (b.hit)
      bullets.remove(i);
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    if (e.hit)
      enemies.remove(i);
    e.update();
  }
  p.update();
}

void display() {
  background(0);
  
  for (int i = bullets.size() - 1; i >= 0; i--) {
    bullets.get(i).display();
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    enemies.get(i).display();
  }
  
  p.display();
}
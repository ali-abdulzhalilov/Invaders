float bulletSize = 10;
float bulletSpeed = 3;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
Player p;
Controls c;

void setup() {
  size(640, 480);
  
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  bullets.add(new Bullet(width/2, height/2, -1));
  enemies.add(new Enemy(50, 50, 20, 20));
  p = new Player(30, 20);
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
    if (b.checkBorders())
      bullets.remove(i);
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    enemies.get(i).update();
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
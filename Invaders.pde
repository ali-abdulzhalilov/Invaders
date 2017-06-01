float bulletSize = 15;
float bulletSpeed = 5;
boolean doBulletsHitEachOther = true;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
Player p;
Controls c;
float a = 0;
boolean anyHit = false;

void setup() {
  size(800, 600);
  smooth();
  
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  float dis = 35, N = 10, M = 4;
  for (int i = 0; i < N; i++) { //x
    for (int j = 0; j < M; j++) { //y
      enemies.add(new Enemy(50+i*dis, j*dis+20, 20, 20, 50+i*dis, width-dis*N+i*dis-50+15, dis/2));
    }
  }
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
    b.update();
    if (b.hit)
      bullets.remove(i);
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    if (e.hit) {
      enemies.remove(i);
      anyHit = true;
      a = 0;
    }
    e.update();
  }
  p.update();  
}

void display() {
  float df = 5;
  float k = 0;
  if (anyHit) {
    k = constrain(df-a/4, 0, df);
    translate(cos(a)*k,0); // brrrrrr
    a += PI/4;
    if (k == 0) anyHit = false;
  }
  if (k > df-0.5) 
    background(random(125), random(50), random(50));
  else
    background(0);
  
  for (int i = bullets.size() - 1; i >= 0; i--) {
    bullets.get(i).display();
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    enemies.get(i).display();
  }
  
  p.display();
}
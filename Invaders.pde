float bulletSize = 15;
float bulletSpeed = 7.5;
boolean doBulletsHitEachOther = false;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
ArrayList<Block> blocks;
Player p;
Controls c;
float a = 0;
float backDraw = 0;
boolean anyHit = false;
int waveCount = 0;
int highWaveCount = 0;
boolean doGame = false;

void setup() {
  size(800, 600);
  smooth();
  
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  blocks = new ArrayList<Block>();
  p = new Player(30, 20);
  c = new Controls();
}

void draw() {
  c.handleInput();
  if (doGame) {
    update();
    display();
  } else {
    startDisplay();
  }
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
  for (int i = blocks.size() - 1; i >= 0; i--) {
    Block b = blocks.get(i);
    if (b.health <= 0)
      blocks.remove(i);
    b.update();
  }
  p.update();
  
  if (enemies.size() == 0)
    nextWave();
}

void display() {
  float df = 5;
  float k = 0;
  if (anyHit) {
    k = constrain(df-a/4, 0, df);
    translate(cos(a)*k,cos(a-random(PI))*k); // brrrrrr
    a += PI/4;
    if (k == 0) anyHit = false;
  }
  if (k > df-0.2)
    background(random(200), random(20), random(20));
  else
    background(0);
  
  for (int i = blocks.size() - 1; i >= 0; i--) {
    blocks.get(i).display();
  }
  for (int i = bullets.size() - 1; i >= 0; i--) {
    bullets.get(i).display();
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    enemies.get(i).display();
  }
  
  p.display();
  
  textSize(20);
  textAlign(RIGHT, TOP);
  text("WAVE "+waveCount, width-10, 10);
}

void startDisplay() {
  background(0);
  fill(255);
  
  textSize(20);
  textAlign(RIGHT, TOP);
  text("HI-SCORE: "+highWaveCount, width-10, 10);
  
  textAlign(CENTER, CENTER);
  textSize(50);
  text("INVADERS", width/2, height/2-50);
  textSize(20);
  text("PRESS [ENTER]", width/2, height/2+50);
}

void nextWave() {
  p.lives++;
  waveCount++;
  resetBlocks();
  resetEnemies();
}

void resetBlocks() {
  float dis = 20;
  int N = 3, M = 3, O = 3;
  
  blocks.clear();
  for (int i = 0; i <= N; i++) {
    for (int j = 0; j < M; j++) {
      for (int k = 0; k < O; k++) {
        if (!(k==2 && j==1)) {
          Block b = new Block(50+j*dis+((width-100-M*dis)/N)*i, height-150+k*dis, dis, dis);
          blocks.add(b);
        }
      }
    }
  }
}

void resetEnemies() {
  float dis = 35;
  int N = 10+waveCount/2;
  int M = 4+waveCount/4;
  
  enemies.clear();
  for (int i = 0; i < N; i++) { //x
    for (int j = 0; j < M; j++) { //y
      Enemy e = new Enemy(50+i*dis, j*dis+20, 20, 20, 50+i*dis, width-dis*N+i*dis-50+15, dis/2);
      e.s += waveCount/2;
      enemies.add(e);
    }
  }
}

void lose() {
  delay(500);
  doGame = false;
  highWaveCount = waveCount;
  p.lives = 4;
  waveCount = 0;
  nextWave();
}
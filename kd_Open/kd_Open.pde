//for export

Kd kd;

void setup() {
  size(600, 600, P3D);

  kd = new Kd(0, new PVector(0, 0, 0), new PVector(100, 100, 100), 0);
}

void draw() {
  background(255);

  if (keyPressed) {
    if (key==' ') {
      noFill();
    }
  }
  translate(width/2, height/2, 300);
  rotateX(frameCount*0.001);
  rotateY(frameCount*0.002);
  kd.run();

  println(frameRate+", "+nowPhase);
}

int nowPhase = 5;

void keyReleased() {
  fill(255);
}
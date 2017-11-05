//사용하실때 반드시 출처를 밝혀주세요. 이을.
//Identify sources when using. Lee Eul.

class Kd {
  int xyz; // 0, 1, 2
  int phase;

  Kd left, right = null;

  PVector pointLoc = null;

  PVector boxLoc;
  PVector boxSize;
  PVector showSize;

  Kd(int xyz, PVector boxLoc, PVector boxSize, int phase) {
    this.xyz = xyz;
    this.boxLoc = boxLoc;
    this.boxSize = boxSize;
    this.phase = phase;
  }

  void show() {
    pushMatrix();
    translate(boxLoc.x, boxLoc.y, boxLoc.z);
    box(boxSize.x*.9, boxSize.y*.9, boxSize.z*.9);
    popMatrix();
  }

  void conceive() {
    pointLoc = new PVector( random(boxLoc.x-boxSize.x/2, boxLoc.x+boxSize.x/2), 
      random(boxLoc.y-boxSize.y/2, boxLoc.y+boxSize.y/2), 
      random(boxLoc.z-boxSize.z/2, boxLoc.z+boxSize.z/2));

    switch(xyz) {
    case 0:
      left = new Kd((xyz+1)%3, 
        new PVector( (boxLoc.x-boxSize.x/2 + pointLoc.x)/2, boxLoc.y, boxLoc.z), 
        new PVector( pointLoc.x - (boxLoc.x-boxSize.x/2), boxSize.y, boxSize.z), 
        phase+1);
      right = new Kd((xyz+1)%3, 
        new PVector( (boxLoc.x+boxSize.x/2 + pointLoc.x)/2, boxLoc.y, boxLoc.z), 
        new PVector( boxLoc.x + boxSize.x/2 - pointLoc.x, boxSize.y, boxSize.z), 
        phase+1);
      break;
    case 1:
      left = new Kd((xyz+1)%3, 
        new PVector(boxLoc.x, ( boxLoc.y-boxSize.y/2 + pointLoc.y )/2, boxLoc.z), 
        new PVector(boxSize.x, pointLoc.y - (boxLoc.y - boxSize.y/2), boxSize.z), 
        phase+1);
      right = new Kd((xyz+1)%3, 
        new PVector(boxLoc.x, ( boxLoc.y+boxSize.y/2 + pointLoc.y )/2, boxLoc.z), 
        new PVector(boxSize.x, boxLoc.y + boxSize.y/2 - pointLoc.y, boxSize.z), 
        phase+1);
      break;
    case 2:
      left = new Kd((xyz+1)%3, 
        new PVector(boxLoc.x, boxLoc.y, ( boxLoc.z-boxSize.z/2 + pointLoc.z )/2), 
        new PVector(boxSize.x, boxSize.y, pointLoc.z - (boxLoc.z - boxSize.z/2)), 
        phase+1);
      right = new Kd((xyz+1)%3, 
        new PVector(boxLoc.x, boxLoc.y, ( boxLoc.z + boxSize.z/2 + pointLoc.z )/2), 
        new PVector(boxSize.x, boxSize.y, boxLoc.z + boxSize.z/2 - pointLoc.z), 
        phase+1);
      break;
    default:
      break;
    }
  }

  void run() {
    if (pointLoc==null) {
      if (nowPhase >= phase) {
        conceive();
      } else {
        show();
      }
    } else {
      left.run();
      right.run();
    }
  }
}

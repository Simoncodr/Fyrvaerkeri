ArrayList<raket> r;

void setup() {
  frameRate(60);
  noStroke();
  size(800, 800, P2D);
  r = new ArrayList<raket>();
}

void draw() {
  background(0);
  
  for (int i = r.size() - 1; i >= 0; i--) {
    raket raket = r.get(i);
    raket.fly2();
    raket.stop_flying();
    if (raket.isExpired()) {
      r.remove(i);
    }
  }
}

void mousePressed() {
  // Add a new rocket to the ArrayList on mouse click
  r.add(new raket(mouseX, mouseY, int(random(100, 700)), 800));
}

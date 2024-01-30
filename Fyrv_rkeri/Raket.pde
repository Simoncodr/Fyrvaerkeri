class raket {
  eksplotion ex;
  float x, y;
  float x2, y2;
  float change_x;
  float curve = -0.05;
  float startTime = millis();
  
  boolean once = false;
  boolean eksplode = false;
  boolean traveling = false;
  ArrayList<PVector> positions = new ArrayList<PVector>();

  raket(int x, int y, int x2, int y2) {
    if (!once) {
      this.x = x;
      this.y = y;
      this.x2 = x2;
      this.y2 = y2;
      once = true;
      traveling = true;
      change_x = sqrt(pow((y - y2) / 5, 2) + pow((x - x2), 2));
      change_x /= (y - y2) / 5;
      if (x > x2) {
        change_x *= (-1);
        curve *= (-1);
      } 
    }
  }

  void fly2() {
    if (traveling) {
      if (curve < 0) {
        curve -= 0.05;
      } else {
        curve += 0.05;
      }
      for (PVector pos : positions) {
        y2 -= 5;
        x2 += change_x + curve;
        fill(160, 120, 0);
        circle(x2, y2, 10);
        ex = new eksplotion();
      }
      positions.add(new PVector(x, y));
      if (positions.size() > 20) {
        positions.remove(0);
      }
    }
  }

  void stop_flying() {
    if (y2 < y || x2 < 50 || x2 > 750 || y2 < 50) {
      traveling = false;
      once = false;
      eksplode = true;
      eksplotion();
    }
  }

  void eksplotion() {
    ex.explotion(x2, y2);
    ex.drawEksplotion();
  }
  boolean isExpired() {
    // Check if the duration has passed
    return (millis() - startTime) > (3 * 1000);
  }
}

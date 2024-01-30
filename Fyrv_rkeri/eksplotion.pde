class eksplotion {
  particle[] p = new particle[int(random(80, 150))];
  particle2[] p2 = new particle2[int(random(50, 100))];
  float x, y, s;
  float alpha = 255;
  int r, g, b;
  int color_value;
  int size;
  boolean once = false;

  void explotion(float x, float y) {
    this.x = x;
    this.y = y;
    if (!once) {
      color_value = int(random(8));
      once = true;
      if (color_value == 0) {
        // red
        r = 255 - int(random(0, 30));
        g = 0 + int(random(0, 20));
        b = 0 + int(random(0,20));
      } else if (color_value == 1) {
        // orange
        r = 255 - int(random(0, 30));
        g = 165 + int(random(0, 20));
        b = 0 + int(random(0, 20));
      } else if (color_value == 2) {
        // yellow
        r = 255 - int(random(0, 30));
        g = 255 - int(random(0, 30));
        b = 0 + int(random(0, 20));
      } else if (color_value == 3) {
        // green
        r = 0 + int(random(0, 20));
        g = 128 + int(random(0, 20));
        b = 0 + int(random(0, 20));
      } else if (color_value == 4) {
        // silver
        r = 192 + int(random(0, 20));
        g = 192 + int(random(0, 20));
        b = 192 + int(random(0, 20));
      } else if (color_value == 5) {
        // blue
        r = 0 + int(random(0, 20));
        g = 0 + int(random(0, 20));
        b = 255 - int(random(0, 30));
      } else if (color_value == 6) {
        // purple
        r = 128 + int(random(0, 20));
        g = 0 + int(random(0, 20));
        b = 128 + int(random(0, 20));
      } else if (color_value == 7) {
        // white
        r = 255 - int(random(0, 30));
        g = 255 - int(random(0, 30));
        b = 255 - int(random(0, 30));
      }
      for (int i = 0; i < p.length; i++) {
        p[i] = new particle(r, g, b, x, y);
      }
      for (int i = 0; i < p2.length; i++) {
        p2[i] = new particle2(r, g, b, x, y);
      }
      size = int(random(25, 40));
    }
  }

  void drawEksplotion() {
    fill(r, g, b, alpha);
    circle(x, y, s);
    s += size;
    alpha -= 25.5/2;
    if (once) {
      for (int i = 0; i < p.length; i++) {
        p[i].update();
        p[i].drawParticle();
      }
      for (int i = 0; i < p2.length; i++) {
        p2[i].update2();
        p2[i].drawParticle2();
      }
    }
  }
}

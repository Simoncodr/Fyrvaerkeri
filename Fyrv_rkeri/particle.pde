class particle {
  float r, g, b;
  float x, y;
  float vx, vy;
  float alpha = 255;
  float size;
  float gravity = (random(0.1, 0.4));
  boolean once = false;

  particle(float r, float g, float b, float x, float y) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.x = x;
    this.y = y;
    if (!once) {
      float angle = random(0, TWO_PI);
      float speed = random(2, 20);
      vx = cos(angle) * speed;
      vy = sin(angle) * speed;
      once = true;
      size = int(random(5,10));
    }
  }

  void drawParticle() {
    fill(r, g, b, alpha);
    ellipse(x, y, size, size);
    alpha -= size/2;
  }
  void update() {
    x += vx;
    y += vy;

    vy += gravity;

    vx *= 0.99;
    vy *= 0.99;
  }
}

class Triangle {

  final static float RAD = 15;

  PVector a, b, c;
  color col;

  boolean main;

  public Triangle(PVector a, PVector b, PVector c, boolean main) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.col = color(0);
    this.main = main;
  }

  //constructor para triangulo equilatero dados dos puntos
  public Triangle(PVector a, PVector b) {
    this.a = a;
    this.b = b;
    this.c = new PVector(0,0);
    this.col = color(0);
    this.main = false;
    calcVertexEqui();
  }

  public void show() {
    if (this.main) {
      fill(124, 199, 209, 180);
      noStroke();
      ellipse(a.x, a.y, RAD, RAD);
      ellipse(b.x, b.y, RAD, RAD);
      ellipse(c.x, c.y, RAD, RAD);
    }

    stroke(col);
    //strokeWeight(2);
    noFill();
    beginShape();
    vertex(a.x, a.y);
    vertex(b.x, b.y);
    vertex(c.x, c.y);
    endShape(CLOSE);
  }

  public void calcVertexEqui() {
    //calcular c
    PVector m = new PVector((a.x+b.x)/2, (a.y+b.y)/2); //punto medio entre a, b
    float d = a.dist(b);
    float h = sqrt(d*d - d*d/4);
    PVector dir = new PVector(a.x-b.x, a.y-b.y);
    PVector perp = new PVector(-dir.y, dir.x);
    perp.div(perp.mag());
    c.x = m.x + h*perp.x;
    c.y = m.y + h*perp.y;
    return;
  }
  
  public PVector getCentroid() {
    float x, y;
    x = (a.x+b.x+c.x)/3;
    y = (a.y+b.y+c.y)/3;   
    return new PVector(x,y);
  }
  
  public void updateVertex(PVector a, PVector b, PVector c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

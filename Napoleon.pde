Triangle main, ta, tb, tc, cent;
PVector selectedVertex;

void setup() {
  size(900, 800);
  PVector a, b, c;
  float w3, h3;
  w3 = width/3;
  h3 = height/3;
  a = new PVector(random(w3, 2*w3),random(h3, 2*h3));
  b = new PVector(random(w3, 2*w3),random(h3, 2*h3));
  c = new PVector(random(w3, 2*w3),random(h3, 2*h3));
  main = new Triangle(a,b,c,true);
  ellipseMode(RADIUS);
  selectedVertex = null;
  strokeWeight(3);
  
  ta = new Triangle(a, b);
  tb = new Triangle(b, c);
  tc = new Triangle(c, a);
  
  cent = new Triangle(ta.getCentroid(), tb.getCentroid(), tc.getCentroid(), false);
  cent.col = color(75,185,120);
}

boolean touches(PVector v) {
  if(v.dist(new PVector(mouseX, mouseY)) <= Triangle.RAD) {
    return true;
  }
  
  return false;
}

void draw() {
  background(255);
  main.show();
  ta.show();
  tb.show();
  tc.show();
  cent.show();
}

void mousePressed() {
  if(touches(main.a)) {
    selectedVertex = main.a;
  } else if(touches(main.b)) {
    selectedVertex = main.b;
  } else if(touches(main.c)) {
    selectedVertex = main.c;
  }
}

void mouseReleased() {
  selectedVertex = null;
}

void mouseDragged() {
  if(selectedVertex != null) {
    selectedVertex.x = mouseX;
    selectedVertex.y = mouseY;
    ta.calcVertexEqui();
    tb.calcVertexEqui();
    tc.calcVertexEqui();
    cent.updateVertex(ta.getCentroid(), tb.getCentroid(), tc.getCentroid());
  } else {
    //move the cursor
    main.a.x += mouseX-pmouseX;
    main.a.y += mouseY-pmouseY;
    main.b.x += mouseX-pmouseX;
    main.b.y += mouseY-pmouseY;
    main.c.x += mouseX-pmouseX;
    main.c.y += mouseY-pmouseY;
    ta.calcVertexEqui();
    tb.calcVertexEqui();
    tc.calcVertexEqui();
    cent.updateVertex(ta.getCentroid(), tb.getCentroid(), tc.getCentroid());
  }
}

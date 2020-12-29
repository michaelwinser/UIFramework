class UIElement {
  int x, y;
  int w, h;
  int id;
  
  ArrayList<UIElement> children;

  UIElement() {
    this(0, 0, 0, 0);
  }
  
  UIElement(int x, int y, int w, int h) {
    
    id = getNextWindowId();
    
    children = new ArrayList<UIElement>();

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void layout() {
    for (UIElement child : children) {
      child.layout();
    }
  }

  void frameworkDraw(int level) {
    layout();
    String indent = "                                           ";
    println("frameworkDraw: " + indent.substring(0, level) + nf(id) + ": x = " + nf(x) + " y = " + nf(y));
    pushMatrix();
    translate(x, y);
    clip(0, 0, w, h);
    draw();
    frameworkDrawChildren(level);
    popMatrix();
  }
  
  void frameworkDrawChildren(int level) {
    for (UIElement child : children) {
      child.frameworkDraw(level + 1);
    }
  }
  
  void drawDefault() {
    fill(255);
    stroke(0);
    rectMode(CORNER);
    rect(0, 0, width, height);
    textAlign(CENTER, CENTER);
    textSize(10);
    fill(0);
    text("Window " + nf(id), w / 2, h / 2);
  }
  
  void draw() {
    drawDefault();
  }

  void addChild(UIElement e) {
    children.add(e);
  }
}

class UIElement {
  int x, y;
  int w, h;
  int id;
  boolean overlay;

  // Layout properties
  int layoutX;
  int layoutY;
  int layoutWidth;
  int layoutHeight;

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

    pushMatrix();
    translate(x, y);
    clipStack.push(0, 0, w, h);
    draw();
    clipStack.pop();
    frameworkDrawChildren(level);
    if (overlay) {
      drawOverlay();
    }
    popMatrix();
  }

  void drawOverlay() {
    fill(0, 0, 0, 64);
    rectMode(CORNER);
    rect(0, 0, w, h);
    stroke(0);
    line(0, 0, w, h);
    line(0, h, w, 0);
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

  UIElement frameworkHitTest(int x, int y) {

    for (int i = children.size() ; i > 0 ; i--) {
      UIElement child = children.get(i - 1);
      if (x >= child.x && x < (child.x + child.w) && y >= child.y && y < (child.y + child.h)) {

        return child.frameworkHitTest(x - child.x, y - child.y);
      }
    }
    
    return this;
  }

  void addChild(UIElement e) {
    children.add(e);
  }
}

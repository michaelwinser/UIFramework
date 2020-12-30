UIElement root;
Static floater;
int windowId;
UIElement mouseFocus;

int getNextWindowId() {
  return ++windowId;
}

void setup() {
  surface.setResizable(true);
  size(1024, 768);

  root = new TestWindowRoot(0, 0, width, height);
}

void draw() {

  root.w = width;
  root.h = height;
  background(255);
  root.frameworkDraw(0);

  drawDebugInfo();
}


void drawDebugInfo() {

  clip(0, 0, width, height);
  fill(0);
  textSize(30);
  textAlign(LEFT, BOTTOM);
  text(nf(width) + " x " + nf(height), 0, height);
}

void mouseMoved() {
  
  UIElement newFocus = root.frameworkHitTest(mouseX, mouseY);  
  if (mouseFocus != null) {
    mouseFocus.overlay = false;
  }
  
  mouseFocus = newFocus;
  mouseFocus.overlay = true;
}

void mouseClicked() {
  redraw();
}

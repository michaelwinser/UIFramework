UIElement root;
Static floater;
int windowId;

int getNextWindowId() {
  return ++windowId;
}

void setup() {
  size(1024, 768);
  
  root = new UIElement(0, 0, width, height);
  HorizontalStack stack = new HorizontalStack(0, 0, width, height);
  floater = new Static(100, 100, 80, 50, "Floater");
  floater.setColour(color(255, 255, 0));
  root.addChild(stack);
  root.addChild(floater);
  

  UIElement leftPanel = new VerticalStack();
  Static centerPanel = new Static("Center"); 
  centerPanel.setColour(color(255, 0, 0));
  UIElement rightPanel = new VerticalStack();
 
  stack.addChild(leftPanel);
  stack.addChild(centerPanel);
  stack.addChild(rightPanel);
  
  //leftPanel.addChild(new Static("One"));
  //leftPanel.addChild(new Static("Two"));
  //leftPanel.addChild(new Static("Three"));
  //leftPanel.addChild(new Static("Four"));
  //leftPanel.addChild(new Static("Five"));
  //leftPanel.addChild(new Static("Six"));

  //leftPanel.addChild(new Static("Alpha"));
  //leftPanel.addChild(new Static("Bravo"));
  //leftPanel.addChild(new Static("Charlie"));
  //leftPanel.addChild(new Static("Delta"));
  //leftPanel.addChild(new Static("Echo"));
  //leftPanel.addChild(new Static("Foxtrot"));
  
  helperAddStatics(leftPanel, "left static", 3);
  helperAddStatics(rightPanel, "right static", 5);
}

void draw() {
  floater.x = int(width / 2 + 50 * sin(radians(frameCount)));
  floater.y = int(height / 2 + 50 * cos(radians(frameCount)));
  background(255);
  root.frameworkDraw(0);
  
  fill(0);
  textSize(30);
  text(frameCount, 0, height);
}


void mouseClicked() {
  redraw();
}

void helperAddStatics(UIElement e, String prefix, int count) {
  for (int i = 0 ; i < count ; i++) {
    e.addChild(new Static(prefix + " " + nf(i)));
  }
}

  

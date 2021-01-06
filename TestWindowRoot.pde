class TestWindowRoot extends UIElement {
  HorizontalStack stack;
  BorderLayout myLayout;
  Static floater;
  Static football;

  TestWindowRoot(int x, int y, int w, int h) {
    myLayout = new BorderLayout(0, 0, width, height);
    UIElement statusBar = new Static("Status bar");
    statusBar.borderPosition = BorderPosition.South;
    statusBar.layoutHeight = 20;
    floater = new Static(w / 2, h / 2, 50, 20, "Floater");
    
    UIElement leftPanel = new VerticalStack();
    leftPanel.borderPosition = BorderPosition.West;
    leftPanel.layoutWidth = min(200, w / 4);
    
    UIElement rightPanel = new VerticalStack();
    rightPanel.borderPosition = BorderPosition.East;
    rightPanel.layoutWidth = min(200, w / 4);
    
    Static centerPanel = new Static("Center"); 
    centerPanel.setColour(color(255, 0, 0));
    centerPanel.layoutWidth = 500;
    centerPanel.borderPosition = BorderPosition.Center;

    myLayout.addChild(statusBar);
    myLayout.addChild(leftPanel);
    myLayout.addChild(rightPanel);
    myLayout.addChild(centerPanel);
    
    helperAddStatics(leftPanel, "left static", 3);
    helperAddStatics(rightPanel, "right static", 5);
    
    addChild(myLayout);
  }

  void layout() {
    myLayout.w = w;
    myLayout.h = h;

    floater.x = int(width / 2 + 50 * sin(radians(frameCount)));
    floater.y = int(height / 2 + 50 * cos(radians(frameCount)));
  }

  void helperAddStatics(UIElement e, String prefix, int count) {
    for (int i = 0; i < count; i++) {
      Static child = new Static(prefix + " " + nf(i));
      child.layoutHeight = 20;
      e.addChild(child);
    }
  }
}

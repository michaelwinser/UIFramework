class ClipManager {
  class ClipRect {
    int x, y, w, h;
    ClipRect(int x, int y, int w, int h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }
  }

  ArrayList<ClipRect> stack;

  ClipManager() {
    stack = new ArrayList<ClipRect>();
  }

  void applyClip() {
    if (stack.size() > 0) {
      ClipRect rect = stack.get(stack.size() - 1);

      clip(rect.x, rect.y, rect.w, rect.h);
    } else {
      noClip();
    }
  }

  void push(int x, int y, int w, int h) {
    ClipRect rect = new ClipRect(x, y, w, h);

    stack.add(rect);

    applyClip();
  }

  void pop() {
    stack.remove(stack.size() - 1);

    applyClip();
  }
}

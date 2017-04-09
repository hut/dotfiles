class Getch(object):
  def __init__(self, wait=1):
    self.fd = sys.stdin.fileno()
    self.old = termios.tcgetattr(self.fd)
    self.new = termios.tcgetattr(self.fd)
    self.new[3] &= ~termios.ECHO
    self.new[3] &= ~termios.ICANON
#    self.new[3] &= ~termios.IGNBRK
#    self.new[3] &= ~termios.IEXTEN
    self.new[6][termios.VTIME] = wait
    self.new[6][termios.VMIN] = 0

  def __call__(self):
    try:
      self.activate()
      return self.getraw()
    finally:
      self.deactivate()

  def getraw(self):
    return sys.stdin.read(1)

  def activate(self):
    termios.tcsetattr(self.fd, termios.TCSADRAIN, self.new)

  def deactivate(self):
    termios.tcsetattr(self.fd, termios.TCSADRAIN, self.old)

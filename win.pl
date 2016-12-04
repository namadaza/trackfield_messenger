use strict;
use warnings;

use Time::HiRes qw(usleep nanosleep);
use X11::GUITest qw/
  FindWindowLike
  GetWindowName
  GetMousePos
  MoveMouseAbs
  PressMouseButton
  ReleaseMouseButton
  SetInputFocus
  SendKeys
  :CONST
/;

my @windows = FindWindowLike('Messenger - Google Chrome');

#Good for troubleshooting in case you don't know the exact name of
#your window title, note if you get a message it stops recognizing the windows
#lmfao
#my @windows = GetWindowName('44040194');

print "* Number of chrome windows found: ", scalar @windows, "\n";
if (!@windows) {
  die("i am ucla cs boi, couldn't find chrome window");
}
SetInputFocus($windows[0]);

#Need this to mess around with initial mouse positions
#my ($x, $y, $sex) = GetMousePos();
#print $x, "\n", $y, "\n";

#MOUSE_INIT
my $x_init = 1121;
my $y_init = 837;
my $scr_num = 0;

#MOUSE_LEFT
my $x_left = 829;
my $y_left = 947;

#MOUSE_RIGHT
my $x_right = 1179;
my $y_right = 790;

MoveMouseAbs($x_init, $y_init, $scr_num);
PressMouseButton M_LEFT;
my $counter = 0;
while ($counter <= 400) {
  #$display->XTestFakeMotionEvent($scr_num, $x_left, $y_left, 0);
  MoveMouseAbs($x_left, $y_left, $scr_num);
  usleep(10000);
  #$display->XTestFakeMotionEvent($scr_num, $x_right, $y_right, 0);
  MoveMouseAbs($x_right, $y_right, $scr_num);
  usleep(10000);
  $counter++;
}

ReleaseMouseButton M_LEFT;


require 'pry'

require 'opencv'
include OpenCV

camera = CvCapture.open(0)
window = GUI::Window.new('camera')

#data = './opencv/data/haarcascades/haarcascade_frontalface_default.xml'
#data = './opencv/data/haarcascades/haarcascade_frontalface_alt.xml'
#data = './opencv/data/haarcascades/haarcascade_frontalface_alt_tree.xml'
data = './haarcascade_frontalface_alt.xml'
data = './haarcascade_frontalface_default.xml'
detector = CvHaarClassifierCascade::load(data)

trap("SIGINT") {
  p "exiting"
  exit 0
}

while true do
  image = camera.query

#  detector.detect_objects(image).each do |region|
#    color = CvColor::Blue
#    image.rectangle! region.top_left, region.bottom_right, :color => color
#  end

  hue_image = cvtColor(image, rb_BGR2HSV)

  window.show hue_image

  key = GUI::wait_key 10
  break if key == 'q'
end

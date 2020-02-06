let one = new imgToAscii('/assets/frame_1.jpg', .15);
let two = new imgToAscii('/assets/frame_2.jpg', .15);
let three = new imgToAscii('/assets/frame_3jpg', .15);
let four = new imgToAscii('/assets/frame_4.jpg', .15);
let five = new imgToAscii('/assets/frame_5.jpg', .15);
let six = new imgToAscii('/assets/frame_6.jpg', .15);
let seven = new imgToAscii('/assets/frame_7.jpg', .15);
let eight = new imgToAscii('/assets/frame_8.jpg', .15);
let nine  = new imgToAscii('/assets/frame_9.jpg', .15);
let ten = new imgToAscii('/assets/frame_10.jpg', .15);
let eleven = new imgToAscii('/assets/frame_11.jpg', .15);
let twelve = new imgToAscii('/assets/frame_12.jpg', .15);
let thirteen = new imgToAscii('/assets/frame_13.jpg', .15);
let fourteen = new imgToAscii('/assets/frame_14.jpg', .15);
let fifteen = new imgToAscii('/assets/frame_15.jpg', .15);

frames = [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen];

var count = 0;
function changeFrames() {
  $("#frames").text(frames[count] + ".display();");
  count < 16 ? count ++ : count = 0;
}
setInterval(changeText, 100);

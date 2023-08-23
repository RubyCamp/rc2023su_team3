require_relative 'ruby-ev3/lib/ev3'

LEFT_MOTOR = "B"
RIGHT_MOTOR = "C"
COLOR_SENSOR = "3"
DISTANCE_SENSOR = "4"
PORT = "COM4"


#以下GROUP3_2 用設定
#LEFT_MOTOR = "C"
#RIGHT_MOTOR = "B"
#COLOR_SENSOR = "3"
#DISTANCE_SENSOR = "2"
#PORT = "COM4"
MOTOR_SPEED = 50


puts "starting..."
brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(PORT))
brick.connect
puts "connected..."
motors = [LEFT_MOTOR, RIGHT_MOTOR]

brick.reset(*motors)   # モーターの回転方向を初期化

# 0.2秒間だけ速度50にて前進
brick.start(MOTOR_SPEED, *motors)
sleep 0.2
brick.stop(true, *motors)

# 10秒間、カラーセンサーの値をコンソールに出力する
cnt = 0
while cnt < 100
  puts brick.get_sensor(COLOR_SENSOR, 2)
  sleep 1
  cnt += 1
end

brick.play_tone(100,1000,1000)

puts "closing..."
brick.stop(true, *motors)
brick.clear_all
brick.disconnect
puts "finished..."

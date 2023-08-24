require 'dxruby'
=begin
require_relative 'map'
require_relative 'character'
require_relative 'player'
require_relative 'navigator'
=end
require_relative 'ruby-ev3/lib/ev3'

#以下GROUP3 用設定
LEFT_MOTOR = "B"
RIGHT_MOTOR = "C"
COLOR_SENSOR = "3"
DISTANCE_SENSOR = "1"
PORT = "COM4"
MOTOR_SPEED = 50

puts "starting..."
brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(PORT))
brick.connect
puts "connected..."
motors = [LEFT_MOTOR, RIGHT_MOTOR]

#4cm以上壁から離れていたら前進
#0.5秒以上前進し続けていたら壁を見つけるまでとりあえず右に少しずつ回転し続ける

=begin
#参考
# 10秒間、カラーセンサーの値をコンソールに出力する
cnt = 0
while cnt < 10
  puts brick.get_sensor(COLOR_SENSOR, 2)
  sleep 1
  cnt += 1
end
=end

def go(brick,motor_speed,left_motor,right_motor)
    @brick.start(motor_speed, left_motor,right_motor)
    puts "start"
    sleep 0.1
    @brick.stop(true, left_motor,right_motor)
end

loop do
    distance = brick.get_sensor(DISTANCE_SENSOR,0)
    puts distance

    count=0
    if distance > 4.0
       go(brick,MOTOR_SPEED,LEFT_MOTOR,RIGHT_MOTOR)
        count = count + 1
        if count > 4

    end

    sleep 0.2
end

puts "closing..."
brick.stop(true, *motors)
brick.clear_all
brick.disconnect
puts "finished..."
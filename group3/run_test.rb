require_relative 'ruby-ev3/lib/ev3'

=begin
LEFT_MOTOR = "B"
RIGHT_MOTOR = "C"
COLOR_SENSOR = "3"
DISTANCE_SENSOR = "4"
PORT = "COM4"
=end

#以下GROUP3_2 用設定
LEFT_MOTOR = "B"
RIGHT_MOTOR = "C"
COLOR_SENSOR = "3"
DISTANCE_SENSOR = "2"
PORT = "COM4"
MOTOR_SPEED = 50



puts "starting..."
brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(PORT))
brick.connect
puts "connected..."
motors = [LEFT_MOTOR, RIGHT_MOTOR]

brick.reset(*motors)   # モーターの回転方向を初期化

def go_one_square(squares,robot,left_MOTOR,right_MOTOR)
    puts "a"
    p robot
    robot.start(MOTOR_SPEED, left_MOTOR,right_MOTOR)
    puts "start"
    sleep (0.8*squares)
    robot.stop(true, left_MOTOR,right_MOTOR)
end

# 1マス分前進
go_one_square(2,brick,LEFT_MOTOR,RIGHT_MOTOR)



puts "closing..."
brick.stop(true, *motors)
brick.clear_all
brick.disconnect
puts "finished..."

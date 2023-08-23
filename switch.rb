require_relative 'ruby-ev3/lib/ev3'

LEFT_MOTOR = "C"
RIGHT_MOTOR = "B"
COLOR_SENSOR = "3"
DISTANCE_SENSOR = "2"
PORT = "COM6"
MOTOR_SPEED = 50


puts "starting..."
brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(PORT))
brick.connect
puts "connected..."
motors = [LEFT_MOTOR, RIGHT_MOTOR]

brick.reset(*motors)   # モーターの回転方向を初期化

    # 音を鳴らす
    # volume: 音量(0-100)
    # freq: 周波数(250-10000)
    # duratinon: 長さ(ミリ秒単位、1000 = 1秒間)
brick.play_tone(100, 5000, 1000)
       

puts "closing..."
brick.stop(true, *motors)
brick.clear_all
brick.disconnect
puts "finished..."

    

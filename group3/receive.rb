require_relative 'ruby-ev3/lib/ev3'
require_relative 'communicator'

LEFT_MOTOR = "B"
RIGHT_MOTOR = "C"
COLOR_SENSOR = "3"
DISTANCE_SENSOR = "1"
PORT = "COM5"
MOTOR_SPEED = 50


puts "starting..."
brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(PORT))
brick.connect
puts "connected..."

motors = [LEFT_MOTOR, RIGHT_MOTOR]
  begin
    threads = []
    receiver = Communicator::Receiver.new(brick)

    threads << Thread.start do
      signals = receiver.receive
      puts signals
      message = receiver.get_message(signals)
      puts "receive: #{message}"
    end
  
    threads.each{|t| t.join }
  ensure
    receiver.disconnect
  end

  puts "closing..."
  brick.stop(true, *motors)
  brick.clear_all
  brick.disconnect
  puts "finished..."
  
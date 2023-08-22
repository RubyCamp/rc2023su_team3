class EV3Controller
  COLOR_SENSOR = "3"
  DISTANCE_SENSOR = "4"
  LEFT_MOTOR = "C"
  RIGHT_MOTOR = "B"
  MOTOR_SPEED = 50

  attr_reader :last_color, :last_distance

  def initialize(port = "COM6")
    @motors = [LEFT_MOTOR, RIGHT_MOTOR]
    @brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(port))
    @brick.connect
    @brick.reset(*@motors)
    @wait_cnt = 0
    @last_color = 0.0
    @last_distance = 0.0
    update_sensor_value
  end

  def move_forward(sec, speed = MOTOR_SPEED)
    @brick.start(speed, *@motors)
    sleep sec
    @brick.stop(true, *@motors)
  end

  def move_backward(sec, speed = MOTOR_SPEED)
    @brick.start(-speed, *@motors)
    sleep sec
    @brick.stop(true, *@motors)
  end

  def move_leftward(sec, speed = MOTOR_SPEED)
    @brick.start(speed, @motors[0])
    sleep sec
    @brick.stop(true, @motors[0])
  end

  def move_rightward(sec, speed = MOTOR_SPEED)
    @brick.start(speed, @motors[1])
    sleep sec
    @brick.stop(true, @motors[1])
  end

  def update_sensor_value
    @wait_cnt += 1
    return unless @wait_cnt % 30 == 0
    @last_color = @brick.get_sensor(COLOR_SENSOR, 2)
    @last_distance = @brick.get_sensor(DISTANCE_SENSOR, 0)
  end

  def color_recognition
    color = @brick.get_sensor(COLOR_SENSOR, 2)  # 读取颜色传感器值
    case color
    when 2
      puts "Color:青 - Cannot move forward"
      return false
    when 5
      puts "Color:赤 - Cannot move forward"
      return false
    when 1
      puts "Color:黒 - Can move forward"
      return true
    when 6
      puts "Color:白 - Can move forward"
      return true
    when 3
      puts "Color:緑 - Can move forward"
      return true
    else
      puts "Color: #{color} - Unknown color"
      return false
    end
  end

  def close
    @brick.stop(true, *@motors)
    @brick.clear_all
    @brick.disconnect
  end
end

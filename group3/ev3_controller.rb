require_relative 'character'
class EV3Controller
  # COLOR_SENSOR = "2"
  DISTANCE_SENSOR = "4"
  LEFT_MOTOR = "C"
  RIGHT_MOTOR = "B"
  MOTOR_SPEED = 20

  attr_reader :last_color, :last_distance

  def initialize(port = "COM4")
    @motors = [LEFT_MOTOR, RIGHT_MOTOR]
    @brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(port))
    @brick.connect
    @brick.reset(*@motors)
    @wait_cnt = 0
    # @last_color = 0.0
    @last_distance = 0.0
    # update_sensor_value
  end


  def move_forward(sec, speed = MOTOR_SPEED)
    @brick.start(speed, *@motors)
    sleep sec
    @brick.stop(true, *@motors)
  end

  def move_forward_quick(sec, speed = MOTOR_SPEED)
    
    @brick.start(speed + 90 , *@motors)
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
    @brick.start(-speed, @motors[1])
    sleep sec
    @brick.stop(true, @motors[0])
    @brick.stop(true, @motors[1])
  end

  def move_rightward(sec, speed = MOTOR_SPEED)
    @brick.start(speed, @motors[1])
    @brick.start(-speed, @motors[0])
    sleep sec
    @brick.stop(true, @motors[1])
    @brick.stop(true, @motors[0])
  end

  def move_rightward2(sec, speed = MOTOR_SPEED)
    @brick.start(speed, @motors[1])
    @brick.start(-speed, @motors[0])
    sleep sec
    @brick.stop(true, @motors[1])
    @brick.stop(true, @motors[0])
  end


  def update_sensor_value
    @wait_cnt += 1
    return unless @wait_cnt % 30 == 0
    @last_color = @brick.get_sensor(COLOR_SENSOR, 2)
    @last_distance = @brick.get_sensor(DISTANCE_SENSOR, 0)
  end

  def color_recognition
    color = @brick.get_sensor(COLOR_SENSOR, 2) # カラーセンサ値の読み取り
    p (color) 
    case color
    when 2
      puts "Color:青 - 青に移動できません"
      return false
    when 5
      puts "Color:赤 - 赤ゾーンに入り、ゲームオーバー"
      return false
    when 1
      puts "Color:黒 - 黒に移動可能"
      return true
    when 6
      puts "Color:白 - 白に移動可能"
      return true
    when 3
      puts "Color:緑 - 緑ゾーンに入り、ポイントを獲得"
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

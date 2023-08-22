class Navigator < Character
  def update(map)
    dx = 0
    dy = 0
    
    if Input.key_push?(K_RIGHT)
      if @ev3_controller.color_recognition
      dx = 1 
      @ev3_controller.move_rightward(0.2)
      end
    end

    if Input.key_push?(K_LEFT)
      if @ev3_controller.color_recognition
      dx = -1
      @ev3_controller.move_leftward(0.2)
      end
    end

    if Input.key_push?(K_UP)
      # dy = -1
      # @ev3_controller.move_forward(0.2)
      if @ev3_controller.color_recognition
        dy = -1
        @ev3_controller.move_forward(0.2)
      # else
      #   puts "Cannot move forward due to color recognition"
      end
    end

    if Input.key_push?(K_DOWN)
    
      dy = 1
      @ev3_controller.move_backward(0.2)
     
    end

    update_new_position(map, @x + dx, @y + dy)

    @ev3_controller.update_sensor_value
    Window.draw_font(600, 100, "COLOR: #{@ev3_controller.last_color}", @font)
    Window.draw_font(600, 200, "COLOR: #{@ev3_controller.last_distance}", @font)
  end
end
class Navigator < Character
  # def ev3_move(dir = 1)
  #   case dir
  #   when 1
  #     @ev3_controller.move_forward(1.2)
  #     @direction +=1
  #   when 2
  #     @ev3_controller.move_leftward(0.4) 
  #     @direction +=1
  #   end
  # end

  def update(map)
    dx = 0
    dy = 0
    
    if Input.key_push?(K_SPACE)
      # if @ev3_controller.color_recognition
        # ev3_move(1)
        @ev3_controller.move_forward(1.2)
        @ev3_controller.move_leftward(0.4) 
        @ev3_controller.move_forward(1.2)
        @ev3_controller.move_leftward(0.4) 
        @ev3_controller.move_forward(0.65)
        @ev3_controller.move_rightward2(0.4)
        @ev3_controller.move_forward(0.65)
        @ev3_controller.move_leftward(0.4) 
        @ev3_controller.move_forward(0.65)
        @ev3_controller.move_leftward(0.4) 
        @ev3_controller.move_forward(0.65)
      # end
    end

    if Input.key_push?(K_RIGHT)
      # if @ev3_controller.color_recognition
      # @x += 1 
      @ev3_controller.move_rightward(0.36)
      case @direction
       when 1
       @direction = 3
       when 2
       @direction = 1
       when 0
       @direction = 3
       when 3
       @direction = 0
     end
     # end
   end
      # end
 

    if Input.key_push?(K_LEFT)
      # if @ev3_controller.color_recognition
      # @x -= 1
      @ev3_controller.move_leftward(0.36)
      case @direction
       when 1
        @direction = 2
       when 2
        @direction = 0
       when 0
        @direction = 3
       when 3
        @direction = 1
      end
      # end
    end

    if Input.key_push?(K_UP)
      # dy = -1
      # @ev3_controller.move_forward(0.2)
      # if @ev3_controller.color_recognition
      if @direction == 0
        @y += 1
        @ev3_controller.move_forward(0.65)
      end
      if @direction == 2
        @x -= 1
        @ev3_controller.move_forward(0.65)
      end
      if @direction == 1
        @y -= 1
        @ev3_controller.move_forward(0.65)
      end
      if @direction == 3
        @x += 1
        @ev3_controller.move_forward(0.65)
      end
      # else
      #   puts "Cannot move forward due to color recognition"
      # end
    end

    if Input.key_push?(K_DOWN)
    
      @y += 1
      @ev3_controller.move_backward(0.65)
     
    end

    # update_new_position(map, @x + dx, @y + dy)

    # @ev3_controller.update_sensor_value
    # # Window.draw_font(600, 100, "COLOR: #{@ev3_controller.last_color}", @font)
    # Window.draw_font(600, 200, "distance: #{@ev3_controller.last_distance}", @font)

    # map.updatesell(@x, @y, @ev3_controller.last_color)
  end
end
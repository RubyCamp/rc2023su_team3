class Navigator < Character
  def update(map)
    dx = 0
    dy = 0
    # p @ev3_controller.last_color
    map.update_color(@x, @y, @ev3_controller.last_color)

    def ev3_move(dir = 1, long)
      case dir
      when 1
        @ev3_controller.move_forward(long*0.4)
      when 2
        @ev3_controller.move_backward(long*0.4) 
      when 3
        @ev3_controller.move_leftward(long*0.4)
      when 4
        @ev3_controller.move_rightward(long*0.4)
      when 1.1
        @ev3_controller.move_forward(long*0.6)
      end
    end
  

    if Input.key_push?(K_SPACE)
      # ev3_move(1,3)
      # ev3_move(3,1)
      # ev3_move(1,3)
      # ev3_move(3,1)
      # ev3_move(1,1.1)
      # ev3_move(4,1)
      # ev3_move(1,1.1)
      # ev3_move(3,1)
      # ev3_move(1,1.1)
      route = [1,1,2,1,2,1,1,3,1,3,1,1,2,1,2,1,1]
      route.each do |i|
        case i 
        when 1 then
          @ev3_controller.move_forward(1.6)
        when 2 then
          @ev3_controller.move_leftward(1.0)
        when 3 then
          @ev3_controller.move_rightward(1.0)
        end
        p @ev3_controller.last_color
      end
    end

    if Input.key_push?(K_A)
    @ev3_controller.move_leftward(0.1)
  end

  if Input.key_push?(K_D)
   @ev3_controller.move_rightward(0.1)
  end

  if Input.key_push?(K_W)
    @ev3_controller.move_forward(0.1)
   end

   if Input.key_push?(K_S)
    @ev3_controller.move_backward(0.1)
   end

    if Input.key_push?(K_RIGHT)
        # if @ev3_controller.color_recognition
      # @x += 1 
      @ev3_controller.move_rightward(0.6)
      case @direction
       when 1
       @direction = 3
       when 2
       @direction = 1
       when 0
       @direction = 2
       when 3
       @direction = 0
     end
     # end
    end

    if Input.key_push?(K_LEFT)
   # if @ev3_controller.color_recognition
      # @x -= 1
      @ev3_controller.move_leftward(0.6)
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
        @ev3_controller.move_forward(1.5)
      end
      if @direction == 2
        @x -= 1
        @ev3_controller.move_forward(1.5)
      end
      if @direction == 1
        @y -= 1
        @ev3_controller.move_forward(1.5)
      end
      if @direction == 3
        @x += 1
        @ev3_controller.move_forward(1.5)
      end
      # else
      #   puts "Cannot move forward due to color recognition"
      # end
    end

    if Input.key_push?(K_DOWN)
    
      @y += 1
      @ev3_controller.move_backward(1.5)
     
    end

    update_new_position(map, @x + dx, @y + dy)

    @ev3_controller.update_sensor_value
    Window.draw_font(600, 100, "COLOR: #{@ev3_controller.last_color}", @font)
    Window.draw_font(600, 200, "distance: #{@ev3_controller.last_distance}", @font)

    map.updatesell(@x, @y, @ev3_controller.last_color)
  end
end
class Map
  CHIP_SIZE = 64
  BLOCK_CHIP_NUM = 1
  def initialize(map_data_path)
    @map_data = []
    File.open(map_data_path) do |f|
      f.each do |line|
        @map_data << line.chomp.split(/\s*,\s*/)
      end
    end
    @white_img = Image.load("images/white.png")
    @block_img = Image.load("images/block.png")
    @blue_img = Image.load("images/blue.png")
    @green_img = Image.load("images/green.png")
    @red_img = Image.load("images/red.png")
  end
  


  def update_color(x, y, color)
    @map_data[y][x] = color.to_i
  end

  def update
    
  end

  def draw

    @map_data.each_with_index do |line, my|
      line.each_with_index do |color, mx|
        case color.to_i
        when 6
          Window.draw(mx * CHIP_SIZE , my * CHIP_SIZE , @white_img)
    
        when 5
          Window.draw(mx * CHIP_SIZE , my * CHIP_SIZE , @red_img)
  
        when 3
          Window.draw(mx * CHIP_SIZE , my * CHIP_SIZE , @green_img)

        when 2
          Window.draw(mx * CHIP_SIZE , my * CHIP_SIZE , @blue_img)
          nm << 2
        when 1
          Window.draw(mx * CHIP_SIZE , my * CHIP_SIZE , @white_img)
        end
      end
    end
  end

  # 指定されたマップ座標[new_x, new_y]が進入可能かどうかを真偽値で返す。
  # def is_available?(new_x, new_y)
  #   if @map_data[new_y]
  #     return @map_data[new_y][new_x].to_i != BLOCK_CHIP_NUM
  #   end
  #   return false
  # end

  def updatesell(x,y,color)
    # @map_data[y][x] = color.to_i
  end

end
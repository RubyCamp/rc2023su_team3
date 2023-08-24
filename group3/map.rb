class Map
  CHIP_SIZE = 32
  BLOCK_CHIP_NUM = 1
  def initialize(map_data_path)
    @map_data = []
    File.open(map_data_path) do |f|
      f.each do |line|
        @map_data << line.chomp.split(/\s*,\s*/)
      end
    end
    @floor_img = Image.load("images/white.png")
    @block_img = Image.load("images/block.png")
    @blue_img = Image.load("images/blue.png")
  end
  

  def update
    
  end

  def draw
    @map_data.each_with_index do |line, my|
      line.each_with_index do |chip_num, mx|
        case chip_num.to_i
        when 6
          Window.draw(mx * CHIP_SIZE + 32, my * CHIP_SIZE + 32, @floor_img)
        when 2
          Window.draw(mx * CHIP_SIZE + 32, my * CHIP_SIZE + 32, @blue_img)
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

  # def updatesell(x,y,color)
  #   @map_data[y][x] = color.to_i
  # end

end
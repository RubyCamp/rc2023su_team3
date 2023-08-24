# #マップのデータを格納してある配列map
# @map = [ 6, 6, 6, 6, 2, 2, 5, 6, 6, 2, 6, 3]

# File.open(map_data_path) do |f|
#     f.print(map[0])
#     f.print("#{map[5]}")
#     f.print("#{map[6]}")
#     f.put("#{map[11]}")
#     f.print("#{map[1]}")
#     f.print("#{map[4]}")
#     f.print("#{map[7]}")
#     f.put("#{map[10]}")
#     f.print("#{map[2]}")
#     f.print("#{map[3]}")
#     f.print("#{map[8]}")
#     f.put("#{map[9]}")
# end



class write
    def initialize(map_data_path)
      @new_data = Array.new(3, Array.new(4, 0))
      File.open(map_data_path,"W") do |f|
        f.each do |line|
          @new_data << line.chomp
        end

        for i in 1..3 do
          for nin 1..4 do
            @new_data[i][n] << 
          end
        end


      end
    end
end
class Image
attr_accessor :array

 def initialize(array) 
     @array = array
 end

  def blur_man(distance) 
    distance.times do
      transform
    end
    manhattan_blur
  end

  def blur(row_number,col_number)
    if row_number != 0
      @array[row_number-1][col_number]   = 1
    end
    if col_number != 0
      @array[row_number][col_number-1]   = 1
    end
    first_row = array[0]
    if col_number != first_row.length - 1
      @array[row_number][col_number+1]   = 1
    end
    if row_number != array.length - 1
      @array[row_number+1][col_number]   = 1
    end
  end

  def transform
    ones = []
    @array.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones.push [row_number, col_number]
        end
      end
    end
      ones.each do |pair|
      row_number, col_number = pair
      blur(row_number, col_number)
    end
  end

  def manhattan_blur
     @array.each do |row|
         row.each do |item|
           print item
         end   
         puts
     end
  end

end

image = Image.new([
  [0, 0, 0, 0], 
  [0, 1, 0, 0], 
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur_man(2)

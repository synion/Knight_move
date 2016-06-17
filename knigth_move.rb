class Knight < Struct.new(:position)
  VECTORS = [[-2,1],[-2,-1],[2,1],[2,-1],[1,-2],[1,2],[-1,-2],[-1,2]]

  def to_s
    moves.join(' ') 
  end

  def moves
    vectors.
      map { |vector| coordinates + vector }.
      select { |coords| coords.valid? }.
      sort
  end

  private

  def coordinates
    @coordinates ||= Coordinates.new_from_position(position)
  end

  def vectors
    @vectors ||= VECTORS.map { |vx, vy| Coordinates.new(vx, vy)}
  end

  class Coordinates < Struct.new(:x, :y)
    LETTERS = '_abcdefgh'
    VALID_COORDINATE = 1..8

    def self.new_from_position(position)
      self.new(LETTERS.index(position[0]), position[1].to_i)
    end

    def +(coordinates)
      self.class.new(x + coordinates.x, y + coordinates.y)  
    end

    def valid?
      VALID_COORDINATE.include?(x) && 
        VALID_COORDINATE.include?(y)
    end

    def <=>(other)
      [x, y] <=> [other.x, other.y]
    end

    def to_s
      valid? ?
        "#{x_position}#{y}" : 
        "invalid coordinates"
    end

    private

    def x_position
      LETTERS[x]
    end
  end
end 

File.open('knigth.txt').each_line do |line|
    puts Knight.new(line.chomp)
end

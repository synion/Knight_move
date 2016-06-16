class Knigth
  attr_accessor :x, :y

  def initialize(x,y,c=[])
 	@x = x
 	@y = y
 	@c = c
  end	

  def x_to_h
  	@h = {}
  	i = 0
  	"a".upto "h" do |l|
  		i += 1
  		@h[l] = i
    end
  end
   
  def move(paramX,paramY)
  	@paramX = paramX
  	@paramY = paramY
  	x_to_h
  	letter = @h.key(@h[@x].to_i + @paramX.to_i)
  	if x_and_y?
  	  @c << "#{letter}#{@y.to_i + @paramY.to_i}"
  	end  
  end

  def x_and_y?
  	(1..8).include?(@h[@x].to_i + @paramX) and (1..8).include?(@y.to_i + @paramY)
  end 
  	
  def see_available_move
    [[-2,1],[-2,-1],[2,1],[2,-1],[1,-2],[1,2],[-1,-2],[-1,2]].each {|x,y| move(x,y) }
    puts @c.sort.join(' ')
  	
  end	
end 

File.open('knigth.txt').each_line do |line|
	a = line.chomp.split('')
    knigth = Knigth.new(a[0],a[1])
    knigth.see_available_move
end




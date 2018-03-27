class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 , @name2 = name1, name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    6.times do |i|
      @cups[i] = Array.new(4) {:stone}
    end
  end

  def valid_move?(start_pos)
      raise "Invalid starting cup" unless start_pos.between?(1,12)
  end

  def make_move(start_pos, cur_name)
    stones = cups[start_pos]
    @cups[start_pos] = []
    p start_pos

    i = 0
    stone_i = 0
    until stones.empty?
      # i = (0..13)
      i = 0 if i > 13
      stone_i = start_pos + 1 + i  # bump forward 1 from starting
      # store the stone, pop it off, unless it's your oppenents points area.
      # oppnenetns points area = 0
      # puts do_the_points_even_matter?(start_pos,stone_i)
      # puts stone_i
      @cups[stone_i] << stones.pop if do_the_points_even_matter?(start_pos, stone_i)

      i += 1
    end
    render

    next_turn(stone_i)
  end

  def do_the_points_even_matter?(start_pos, stone_index)
    if start_pos.between?(0,5) && stone_index != 13
      return true
    elsif start_pos.between?(7,12) && stone_index != 6
      return true
    end
  end

  def next_turn(ending_cup_idx)
    adj_val = ending_cup_idx - 1

      if adj_val == 6 || adj_val == 13
        return :prompt
      if @cups[adj_val].count == 0
        return :switch
      elsif adj_val.between?(0,12) && cups[adj_val].any?
        return adj_val
      end
    end

  end

  def render
    # print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    # puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    # print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    # puts ""
    # puts ""
  end

  def one_side_empty?
    side_one = cups[0..5].all? {|cup| cup.empty?}
    # 6 is points
    side_two = cups[7..12].all? {|cup| cup.empty?}
    # 13 is points

    # all empty =inverse= any any
    return false if !side_one || !side_two

    return true if side_one || side_two
  end

  def winner
     count_1 = cups[6].count
     count_2 = cups[13].count

     if count_1 == count_2
       return :draw
     elsif count_1 > count_2
       return name1
     elsif count_1 < count_2
       return name2
     end
  end

end # class end

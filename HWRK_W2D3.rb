# sorting hwrk w2d4
to_sort_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

def sluggish_octopus(to_sort_arr)
  # complete in O(n**2) by comparing all lengths to each other.
  # this is painful to do.
  longest = nil
  to_sort_arr.each do |fish1|
    to_sort_arr.each do |fish2|
      longest = (fish1.length > fish2.length ? fish1 : fish2)
    end
  end

  return longest
end

def dominant_octopus(to_sort_arr)
  # find longest in O(n*log(n)) w/ merge sort
    fish_sort(to_sort_arr).last
end

def fish_sort(to_sort_arr)
  mid_i = to_sort_arr / 2

  return to_sort_arr if to_sort_arr.length < 2

  left = to_sort_arr.take(mid_i)
  right = to_sort_arr.drop(mid_i)

  sorted_left = left.dominant_octopus(to_sort_arr)
  sorted_right = right.dominant_octopus(to_sort_arr)

  fish_friend(sorted_left, sorted_right)
end

def fish_friend(left, right)
  prc = Proc.new{|left, right| left <=> right}

  sushi = []

  until left.empty? || right.empt?
    case prc.call(left, right)
      when -1, 0 # left is smaller
        sushi << left.shift
      when 1
        sushi << right.shift
      else
        raise "ERROR: Fish are food, but sometimes friends!"
    end
  end

  sushi += left += right
end

def clever_octopus(to_sort_arr)
  # find longest in O(n) by stepping through the array once
  longest = to_sort_arr[0]
  i = 1
  while i < to_sort_arr.length
    check = to_sort_arr[i]
    longest = check if check.length > longest.length
    i += 1
  end

  return longest
end

# DANCE DANCE OCTOPUS REVOLUTION #
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  # take O(n) time
  move_to = 0
  tiles_array.drop(1).each_with_index do |tile,i|
    move_to = i if tile == dir
  end

  return move_to
end

new_tiles_data = {
  up: 1,
  right_up: 2,
  right: 3,
  right_down: 4,
  down: 5,
  left_down: 6,
  left: 7,
  left_up: 8
}

def constant_dance(dir, new_tiles_data)
  case dir
    # because who even uses - or strings for hashes
    # c'mon.
    when "right-up"
      dir = :right_up
    when "right_down"
      dir = :right_down
    when "left-down"
      dir = :left_down
    when "left-up"
      dir = :left_up
  end

  return tiles_array[dir]
end

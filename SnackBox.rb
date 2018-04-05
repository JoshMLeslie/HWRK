SNACK_BOX_DATA = {
  1 => {
    "bone" => {
      "info" => "Phoenician rawhide",
      "tastiness" => 20
    },
    "kibble" => {
      "info" => "Delicately braised hamhocks",
      "tastiness" => 33
    },
    "treat" => {
      "info" => "Chewy dental sticks",
      "tastiness" => 40
    }
  },
  2 => {
    "bone" => {
      "info" => "An old dirty bone",
      "tastiness" => 2
    },
    "kibble" => {
      "info" => "Kale clusters",
      "tastiness" => 1
    },
    "treat" => {
      "info" => "Bacon",
      "tastiness" => 80
    }
  },
  3 => {
    "bone" => {
      "info" => "A steak bone",
      "tastiness" => 64
    },
    "kibble" => {
      "info" => "Sweet Potato nibbles",
      "tastiness" => 45
    },
    "treat" => {
      "info" => "Chicken bits",
      "tastiness" => 75
    }
  }
}

class SnackBox

  attr_reader :data

  def initialize(data = SNACK_BOX_DATA)
    @data = data
    # self.methods.grep(/^get_(.*)_info$/) {self.what_methods? $1} # ???
  end

  def what_methods?
    food, data_request = data[1].keys, data[1].values.first.keys
    puts
    puts "SnackBox#get_"
    food.each do |food|
      data_request.each do |data|
        puts "    #{food}_#{data}(box_i)"
      end
    end
    nil
  end

  # why even bother pulling this out when it just replaces the methods?
  # If anything, pull the data out into a CSV or something.

  def method_missing(method_name, box_id)
    # get_(bone / kibble / treat )_(info / tastiness) and pass 'box_id'
    raise "Simple argument error" unless box_id.is_a?(Integer)

    method_name = method_name.to_s

    if method_name.start_with?("get_")
      attr_str = method_name[("get_".length)..-1]
      attr_names = attr_str.split("_")

      raise 'Second-level method name error' unless attr_names.length == 2

      food , data_request = attr_names

      return data[box_id]["#{food}"]["#{data_request}"]
    else
      raise 'Simple method name error'
    end
  end

end # class

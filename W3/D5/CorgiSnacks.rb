require_relative 'SnackBox'

class CorgiSnacks

  attr_reader :box_id, :snack_box

  def initialize(snack_box = SnackBox.new, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = snack_box.get_bone_info(box_id)
    tastiness = snack_box.get_bone_tastiness(box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = snack_box.get_kibble_info(box_id)
    tastiness = snack_box.get_kibble_tastiness(box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = snack_box.get_treat_info(box_id)
    tastiness = snack_box.get_treat_tastiness(box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end # class

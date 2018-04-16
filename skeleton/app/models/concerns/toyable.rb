module Toyable
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: true
    validates :toyable, uniqueness: true
    belongs_to :toyable, polymorphic: true
  end

  def receive_toy(name)
    finder = Toy.find_by(name: name)
    output_toy = (finder ? finder : Toy.create(name) )
    self.toys << output_toy
    output_toy
  end
end

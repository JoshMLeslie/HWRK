# create_table "people", force: :cascade do |t|
#   t.string "name", null: false
#   t.integer "house_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end


class Person < ApplicationRecord
  validates :name, presence: true

  belongs_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "House"
  }
end

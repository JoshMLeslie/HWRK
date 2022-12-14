# create_table "houses", force: :cascade do |t|
#   t.string "address", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class House < ApplicationRecord
  validates :address, presence: true

  has_many :people, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "Person"
  }
end

class Recipe < ApplicationRecord
  belongs_to :kitchen

  validates :recipe_name,:kitchen_id,:type_of_food,:how_many_people_serves,:preparation_time,:difficulty_level,:ingredients,:step_by_step, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

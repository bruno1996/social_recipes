class Recipe < ApplicationRecord
belongs_to :kitchen
validates :recipe_name,:kitchen_id,:type_of_food,:how_many_people_serves,:preparation_time,:difficulty_level,:ingredients,:step_by_step, presence: true

end

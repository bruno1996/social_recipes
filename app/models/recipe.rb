class Recipe < ApplicationRecord

validates :recipe_name,:kitchen,:type_of_food,:how_many_people_serves,:preparation_time,:difficulty_level,:ingredients,:step_by_step, presence: true

end

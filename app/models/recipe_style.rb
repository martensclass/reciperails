class RecipeStyle < ActiveRecord::Base
   belongs_to :style
   belongs_to :recipe
end
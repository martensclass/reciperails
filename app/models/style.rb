class Style < ActiveRecord::Base
   validates :name, presence: true, length: { in: 2..25 }, uniqueness: { case_sensitive:false }
   has_many :recipe_styles
   has_many :recipes, through: :recipe_styles
end
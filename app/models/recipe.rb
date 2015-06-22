class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id,     presence: true 
    validates :name,        presence: true, length: { in: 2..30 }
    validates :summary,     presence: true, length: { in: 5..100 }
    validates :description, presence: true, length: { in: 5..300 }
end
class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id,     presence: true 
    validates :name,        presence: true, length: { in: 5..30 }
    validates :summary,     presence: true, length: { in: 10..100 }
    validates :description, presence: true, length: { in: 10..300 }
end
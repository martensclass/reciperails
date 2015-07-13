class Recipe < ActiveRecord::Base
    belongs_to :chef
    has_many :likes, dependent: :destroy
    
    has_many :comments, dependent: :destroy
    
    has_many :recipe_styles, dependent: :destroy
    has_many :styles, through: :recipe_styles
    
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    
    validates :chef_id,     presence: true 
    validates :name,        presence: true, length: { in: 2..30 }
    validates :summary,     presence: true, length: { in: 5..100 }
    validates :description, presence: true, length: { in: 5..300 }
    #this was added to allow for pictures after installing gem and adding
    #picture field to recipes -> gem was carrierwave
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    default_scope -> { order(created_at: :desc) }
    
    def thumbs_up_total
       self.likes.where(like: true).size 
    end
    
    def thumbs_down_total
       self.likes.where(like: false).size 
    end
    
    def chef_comments(c)
       self.comments.where(chef: c)
    end
    
    def chef_likes(c)
        self.likes.where(chef: c)
    end
    
    private
    
    def picture_size
       if picture.size > 5.megabytes
           errors.add(:picture, "should be less than 5 mb")
       end
    end
end
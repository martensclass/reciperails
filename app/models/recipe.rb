class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id,     presence: true 
    validates :name,        presence: true, length: { in: 2..30 }
    validates :summary,     presence: true, length: { in: 5..100 }
    validates :description, presence: true, length: { in: 5..300 }
    #this was added to allow for pictures after installing gem and adding
    #picture field to recipes -> gem was carrierwave
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
    
    def picture_size
       if picture.size > 5.megabytes
           errors.add(:picture, "should be less than 5 mb")
       end
    end
end
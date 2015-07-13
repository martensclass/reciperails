class Chef < ActiveRecord::Base
    
    has_many :recipes, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    
    before_save { self.email = self.email.downcase }
    
   
   
   #email valid regular expression:
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
   validates :chefname, presence: true, length: { in: 2..50 }
   validates :email,    presence: true, length: { maximum: 100 }, 
                        uniqueness: { case_sensitive:false }, 
                        format:  { with: VALID_EMAIL_REGEX }
                        
    has_secure_password
end
module ApplicationHelper
    
    def get_gravimage(chef, options = { size: 80 }) 
       
       hexemail = Digest::MD5::hexdigest(chef.email.downcase);
       size = options[:size]
       
       img_url = "http://secure.gravatar.com/avatar/#{hexemail}?s=#{size}"
       
       image_tag(img_url, alt: chef.chefname, class: 'avimg')
    end
    
end

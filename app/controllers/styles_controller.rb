class StylesController < ApplicationController
   def new
        @style = Style.new
   end 
   
   def create
      @style = Style.new(style_params)
      
      if @style.save
         flash[:success] = "Your new style was added"
         redirect_to recipes_path
      else
        flash[:danger] = @style.errors.full_messages
        render :new
      end
      
   end
   
   
   private 
   
   def style_params
      params.require(:style).permit(:name)
   end
   
end
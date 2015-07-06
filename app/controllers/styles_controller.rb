class StylesController < ApplicationController
   
   before_action :require_user, except: [:show]
   
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
   
   def show
      @style = Style.find(params[:id])
      @recipes = @style.recipes.paginate(page: params[:page], per_page: 3)
   end
   
   private 
   
   def style_params
      params.require(:style).permit(:name)
   end
   
end
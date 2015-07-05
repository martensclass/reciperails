class IngredientsController < ApplicationController
   def new
        @ing = Ingredient.new
   end 
   
   def create
      @ing = Ingredient.new(ing_params)
      
    if @ing.save
         flash[:success] = "Your new ingredient was added"
         redirect_to recipes_path
    else
        flash[:danger] = @ing.errors.full_messages
        render :new
    end
      
   end
   
   
   private 
   
   def ing_params
      params.require(:ingredient).permit(:name)
   end
   
end
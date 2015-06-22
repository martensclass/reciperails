class RecipesController < ApplicationController
   
   
   def index
       @recipes = Recipe.all
   end
   
   def show
      @recipe = Recipe.find(params[:id])
   end
   
   def new
      @recipe = Recipe.new
   end
   
   def create
      @recipe = Recipe.new(recipe_params)
      @recipe.chef=Chef.first
      
      if @recipe.save
         flash[:success] = "Your new recipe was added"
         redirect_to @recipe
      else
        flash[:danger] = @recipe.errors.full_messages
        render :new
      end
   end
   
   def edit
       @recipe = Recipe.find(params[:id])
   end
   
   def update
      @recipe = Recipe.find(params[:id])
      
      if @recipe.update(recipe_params)
         flash[:success] = "Recipe Updated"
         redirect_to recipe_path(@recipe)
      else
        flash[:danger] = @recipe.errors.full_messages
        render :new
      end
   end
   
   private
   
   
   def recipe_params
         params.require(:recipe).permit(:name, :summary, :description)
   end
    
end
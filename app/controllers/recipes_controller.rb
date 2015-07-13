class RecipesController < ApplicationController
   
   before_action :set_recipe, only: [:show, :edit, :update, :like, :destroy, :comment, :changevote]
   before_action :require_user, except: [:show, :index]
   before_action :require_same_user, only: [:edit, :update]
   
   def index
       @recipes = Recipe.paginate(page: params[:page], per_page: 3)
   end
   
   def show
     @comments = @recipe.comments
   end
   
   def destroy
      @recipe.destroy
      flash[:success] = "Recipe deleted"
      redirect_to recipes_path
   end   
   
   def new
      @recipe = Recipe.new
   end
   
   def edit
       
   end
   
   def create
      @recipe = Recipe.new(recipe_params)
      @recipe.chef=current_user
      
      if @recipe.save
         flash[:success] = "Your new recipe was added"
         redirect_to @recipe
      else
        flash[:danger] = @recipe.errors.full_messages
        render :new
      end
   end
   
   def update
      if @recipe.update(recipe_params)
         flash[:success] = "Recipe Updated"
         redirect_to recipe_path(@recipe)
      else
        flash[:danger] = @recipe.errors.full_messages
        render :new
      end
   end
   
   def comment
      comment = Comment.create(content: params[:content], chef: current_user, recipe: @recipe)
      if comment.valid?
         flash[:success] = "Your comment was recorded."
      else
         flash[:danger] = "You can only comment once for each recipe."
      end
      redirect_to :back
   end
   
   
   def like
         like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
         if like.valid?
            flash[:success] = "Your vote for " + @recipe.name + " was recorded."
         else
            flash[:danger] = "You can only vote once for each recipe."
         end
      redirect_to :back
   end
   
   def changevote
      like=Like.where(recipe: @recipe, chef: current_user).first
      like.toggle!(:like)
      flash[:success] = "Your vote for " + @recipe.name + " has been changed."
      redirect_to :back
   end
   
   private #----------------------
   
   def recipe_params
         params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [], ingredient_ids: [])
   end
   
   def set_recipe
       @recipe = Recipe.find(params[:id])
   end
   
   def require_same_user
       if !current_user.admin && current_user != @recipe.chef
          flash["danger"] = 'You can only edit your own recipes '
          redirect_to recipes_path
       end
   end
   
end
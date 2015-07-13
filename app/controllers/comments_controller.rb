class CommentsController < ApplicationController
   
   def destroy
    @comment = Comment.find(params[:id])
     @recipe = @comment.recipe 
     @comment.destroy
     flash[:success] = "Your comment was deleted"
     redirect_to @recipe
   end
    
end
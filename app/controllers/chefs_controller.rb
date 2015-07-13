class ChefsController < ApplicationController

before_action :find_chef, only: [:show, :edit, :update, :destroy]
before_action :require_same_user, only: [:edit, :update]
before_action :require_admin, only: [:destroy]

def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
end
    
def index
    @chefs = Chef.paginate(page: params[:page], per_page: 3)
end
    
def new
    @chef = Chef.new
end

def destroy
      @chef.recipes.destroy_all
      @chef.destroy
      flash[:success] = "Chef deleted"
      redirect_to recipes_path
end  

def create
    @chef = Chef.new(chef_params)
    if @chef.save
         flash[:success] = "You have successfully registered"
         session[:chef_id] = @chef.id
         redirect_to recipes_path
    else
        flash[:danger] = @chef.errors.full_messages
        render :new
    end
end

def edit
    
end

def update
    if @chef.update(chef_params)
         flash[:success] = "Your profile has been updated"
         redirect_to @chef
    else
        flash[:danger] = @chef.errors.full_messages
        render :edit
    end
end


private

    def chef_params
       params.require(:chef).permit(:chefname, :email, :password) 
    end
    
    def require_same_user
        if current_user != @chef
           flash["danger"] = 'You can only edit your own profile '
           redirect_to root_path
        end
    end
    
    def find_chef
       @chef = Chef.find(params[:id])
    end
    
    def require_admin
       if !current_user.admin
           redirect_to recipes_path
       end
    end
    
end
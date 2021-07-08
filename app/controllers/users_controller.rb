class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def show
    user = User.find(params[:id]) # コメントしたひとのID
    @nickname = user.name
    @profile = user.profile
    @occupation = user.occupation
    @position = user.position
    #  @prototypes = Prototype.all
    @prototypes = user.prototypes.includes(:user)
  end

  private
  # def user_params
  #   params.require(:user).permit(:name, :email) 
  # end

  def user_params
    params.require(:user).permit(:name, :email, :image).merge(user_id: current_user.id)
  end

end

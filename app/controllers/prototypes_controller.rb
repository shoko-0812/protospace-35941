class PrototypesController < ApplicationController
  def index
    # @prototype = Prototype.find(params[:id])
    # user.prototypes.includes(:user)
    # @users = @prototype.users.includes(:user)
    
    # @nickname2 = User.all
    # # @nickname = prototype.user.name 
    # @nickname = @nickname2.name
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    # Prototype.create(prototype_params)
    # @message = @room.messages.new(message_params)
    # @prototype.save
    if @prototype.save
      redirect_to prototypes_path
    else
      render :new
    end  
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to prototypes_path
  end

  def edit
    @prototype = Prototype.find(params[:id])
    # redirect_to prototype_path 
    
    # @prototype = Prototype.edit(prototype_params)
  
    # if @prototype.save
    #   redirect_to edit_prototype_path
    # else
    #   render :new
    # end 
  end

  def update
    @prototype = Prototype.find(params[:id])
    # before_action :update, except: [:index, :show]
    
    if @prototype.update(prototype_params)
      # redirect_to prototype_path    # unless user_signed_in?
    else
      render :edit
    end 
  end


  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user) 
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

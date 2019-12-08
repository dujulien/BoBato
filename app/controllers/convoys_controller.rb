class ConvoysController < ApplicationController

  # before_action :set_user
  # before_action :authenticate_user!, only: [:new, :create]

  def index
    @convoys = Convoy.all
  end

  def show
    @convoy = Convoy.find(params[:id])
    @id = params[:id]
  end

  def new
    @convoy = Convoy.new
  end

  def edit
    @convoy = Convoy.find(params[:id])
  end

  def create
    @convoy = Convoy.new(convoy_params)
    if @convoy.save
        redirect_to @convoy, notice: 'Proposition de convoi créé'          
    else
      flash.now[:danger] = 'Erreur dans la création du convoi'
      render 'new'
    end
  end

  def update
    @convoy = Convoy.find(params[:id])
    if @convoy.update(convoy_params)
      redirect_to @convoy
    else
      render 'edit'
    end
  end

  def destroy
    @convoy = Convoy.find(params[:id])
    @convoy.destroy
    redirect_to user_my_convoys_path(current_user.id)
  end

  private

  # def set_user
  #   @user = current_user
  # end

  def convoy_params
    params.permit(:title,:boat_type,:boat_owner_id,:required_license,:description,:departure_port,:arrival_port,:date_of_departure, :date_of_arrival,:convoy_price, pictures:[])
  end

end
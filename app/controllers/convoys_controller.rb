class ConvoysController < ApplicationController

  # before_action :set_user
  # before_action :authenticate_user!, only: [:new, :create]

  def index
    @convoys = Convoy.where("date_of_departure >= ?", Time.current)
  end

  def show
    @convoy = Convoy.find(params[:id])
    @id = params[:id]
  end

  def new
    @user = current_user
    @convoy = Convoy.new
    @convoy.boat_owner_id=@user.id
  end

  def edit
    @convoy = Convoy.find(params[:id])
  end

  def create
    @user = current_user
    @convoy = Convoy.new(convoy_params)
    @convoy.boat_owner_id=@user.id

    if @convoy.save
      flash[:success] = "Votre proposition de convoi est enregistrée avec succés"
      redirect_to @convoy   
    else
      flash[:errors] = @convoy.errors.full_messages
      render 'new'
    end
  end

  def update
    @convoy = Convoy.find(params[:id])
    if @convoy.update(convoy_params)
      flash[:success] = "La mise à jour de votre convoi est bien enregistrée"
      redirect_to @convoy
    else
      render 'edit'
    end
  end

  def destroy
    @convoy = Convoy.find(params[:id])
    @convoy.destroy
    flash[:success] = "Votre convoi a été supprimé"
    redirect_to user_my_convoys_path(current_user.id)
  end

  private

  # def set_user
  #   @user = current_user
  # end

  def convoy_params
    params.permit(:title,:boat_type,:required_license,:description,:departure_port,:arrival_port,:date_of_departure, :date_of_arrival,:convoy_price, pictures:[])
  end

end

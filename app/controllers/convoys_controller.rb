’class ConvoysController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @convoys = Convoy.where("date_of_departure >= ?", Time.current).page(params[:page]).per(9)
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
    @user = current_user
    @convoy = Convoy.new(convoy_params)
    @convoy.boat_owner_id=current_user.id
    # @convoy.pictures.attach(params[pictures:[]])
    # @convoy.update(boat_owner: @user)
    # title: params[:title],boat_type: params[:boat_type],required_license: params[:required_license],description: params[:description],departure_port: params[:departure_port],arrival_port:params[:arrival_port],date_of_departure: params[:date_of_departure],date_of_arrival: params[:date_of_arrival],convoy_price: params[:convoy_price])

    if @convoy.save
      flash[:success] = "Votre proposition de convoyage est enregistrée avec succés"
      redirect_to @convoy   
    else
      flash[:errors] = @convoy.errors.full_messages
      render 'new'
    end
  end

  def update
    @convoy = Convoy.find(params[:id])
    if @convoy.update(convoy_params)
      flash[:success] = "La mise à jour de votre convoyage est bien enregistrée"
      redirect_to @convoy
    else
      render 'edit'
    end
  end

  def destroy
    @convoy = Convoy.find(params[:id])
    @convoy.destroy
    flash[:success] = "Votre convoyage a été supprimé"
    redirect_to user_my_convoys_path(current_user.id)
  end

  private

  def convoy_params
    params.permit(:title,:boat_type,:required_license,:description,:departure_port,:arrival_port,:date_of_departure, :date_of_arrival,:convoy_price,pictures:[])
  end

end

class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index] #:show
  before_action :verify_author, only: [:edit, :destroy]

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def verify_author
    unless current_user == Gossip.find(params[:id])
      flash[:danger] = "BIEN ESSAYÉ"
      redirect_back(fallback_location: root_path)
    end
  end

  def new
  end

  def create
    @gossip = Gossip.new(
      title: params[:gossip_title],
      content: params[:gossip_content],
      author: current_user
    )
    if @gossip.save
      flash[:success] = "Ton potin a été ajouté !"
      redirect_to :root
    else
      flash[:danger] = "Ton potin n'est pas valide !"
      render :new
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(
      title: params[:gossip_title],
      content: params[:gossip_content]
    )
      flash[:success] = "Potin modifié !"
      redirect_to :root
    else
      flash[:danger] = "Potin non valide !"
      render :edit
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    Gossip.find(params[:id]).destroy
    flash[:success] = "Potin supprimé !"
    redirect_to :root
  end

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id].to_i)
  end
end

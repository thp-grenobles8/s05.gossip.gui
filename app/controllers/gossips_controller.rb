class GossipsController < ApplicationController
  def new
  end

  def create
    @gossip = Gossip.new(
      title: params[:gossip_title],
      content: params[:gossip_content],
      author: User.all.sample
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
  end

  def edit
  end

  def destroy
  end

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id].to_i)
  end
end

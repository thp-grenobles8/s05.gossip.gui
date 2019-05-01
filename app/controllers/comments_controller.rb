class CommentsController < ApplicationController
  def create
    puts "-"*60
    puts params
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.new(
      content: params[:comment_content],
      author: User.anonymous,
      gossip: @gossip
    )
    if @comment.save
      flash[:success] = "Ton commentaire a été ajouté !"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:danger] = "Ton commentaire n'est pas valide !"
      redirect_to gossip_path(@gossip.id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(
      content: params[:comment_content],
      author: @comment.author,
      gossip: @comment.gossip
    )
      flash[:success] = "Commentaire modifié !"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:danger] = "Commentaire non valide !"
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    gossip = comment.gossip
    comment.destroy
    flash[:success] = "Commentaire supprimé !"
    redirect_to gossip_path(gossip.id)
  end

end

class StaticController < ApplicationController
  # def home
  #   @gossips = Gossip.all
  #   @title = "po-potins en pagaille"
  # end

  def team
    @title = "l'équipe (pas le journal)"
  end

  def contact
    @title = "contact"
  end
end
